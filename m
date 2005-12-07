Received: from smtp.mailbox.co.uk ([195.82.125.32])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EjzGg-0003wX-SZ
	for linux-mtd@lists.infradead.org; Wed, 07 Dec 2005 08:23:39 -0500
Received: from apogee.jonmasters.org ([212.18.227.82]
	helo=pat.int.jonmasters.org)
	by smtp.mailbox.co.uk with esmtp (Exim 4.54) id 1EjydU-0004V7-Vj
	for linux-mtd@lists.infradead.org; Wed, 07 Dec 2005 12:43:05 +0000
Received: from jcm by pat.int.jonmasters.org with local (Exim 3.35 #1 (Debian))
	id 1EjybP-0005xU-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Dec 2005 12:40:55 +0000
Date: Wed, 7 Dec 2005 12:40:55 +0000
From: Jon Masters <jonathan@jonmasters.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20051207124055.GA17607@apogee.jonmasters.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Jon Masters <jcm@jonmasters.org>
Subject: DMA engine acceleration HOWTO
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi folks,

As part of some work I'm doing for Liberte Software (not finished/released yet),
here's a quick hacking guide to enabling an SoC DMA engine in your NAND driver.
In this case, I am using a ppc405 core and am programming the DMA controller
inline since we know the Linux ppcxx_dma code is unworkable.

We found that by adding this support, we were able to achieve massive kernel
overhead reduction during MTD ops where the system is now able to go do
processing work for us - we're down to about 30% overhead now when running
YAFFS2 and doing continuous read/writes to very large MTD devices.

MTD uses read_buf and write_buf routines for talking to the flash. We
create DMA versions thereof:

static void mynand_write_buf(struct mtd_info *mtd, const u_char *buf, int len);
static void mynand_read_buf(struct mtd_info *mtd, u_char *buf, int len);

And an IRQ handler:

static void mynand_dma_irq(int irq, void *this, struct pt_regs *regs);

Then we wire up the whole process using a completion and some #defines:

/* DMA stuff */
 
#define MYNAND_USE_DMA        1       /* Use DMA */
#define MYNAND_DMACH          2       /* Use DMA channel 2 */
#define MYNAND_DMA_INT        7       /* Use DMA channel 2 (IRQ 6???) */
#define MYNAND_DMA_BUFSIZE    4096    /* 1 page */

ppc_dma_ch_t dma_ch;

static dma_addr_t mynand_dma_addr;
static u_char *mynand_dma_buf;
DECLARE_COMPLETION(mynand_dma_completion);

Then we need to add some code to our init function to allocate an IRQ and a
suitable DMA bounce buffer:

        if (request_irq(MYNAND_DMA_INT, &mynand_dma_irq, SA_INTERRUPT,
            "mynand_dma_irq", this)) {
                printk("mynand_init: request_irq failed int=%d\n",
                        MYNAND_DMA_INT);
                return -1;
        }
 
        mynand_dma_buf = consistent_alloc(GFP_KERNEL, MYNAND_DMA_BUFSIZE,
                                            &mynand_dma_addr);
        if (NULL == mynand_dma_buf) {
                printk("mynand_init: ouch. memory problem! FIXME!\n");
                free_irq(MYNAND_DMA_INT, this);
                return -1;
        } else {
                memset(mynand_dma_buf, 0, MYNAND_DMA_BUFSIZE);
        }

Here are the functions (for example, conditionally selected by MYNAND_USE_DMA):

(these are for ppc4xx systems and make all kinds of assumption, but you can see
 as an example thus:)

static void mynand_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
{
                                                                                
        int i;
        struct nand_chip *this = mtd->priv;
        unsigned long IO_ADDR_DMA_W = this->IO_ADDR_W-(unsigned long)mynand_base_logical+mynand_base_physical;
                                                                                
        //printk("mynand_write_buf: %d bytes.\n",len);
                                                                                
        memcpy(mynand_dma_buf, buf, len);
                                                                                
        mtdcr(DCRN_DMACR2, 0);
        mtdcr(DCRN_DMACR2, SET_DMA_PW(PW_8)); /* 1. transfer is 8 bit */
        mtdcr(DCRN_DMASA2, mynand_dma_addr);  /* 2. Source Address */
        mtdcr(DCRN_DMADA2, IO_ADDR_DMA_W);    /* 2. Destination Address */
        mtdcr(DCRN_DMACT2, len);              /* 3. Set count */
        mtdcr(DCRN_DMASR, DMA_CS2|DMA_TS2|DMA_CH2_ERR);
                                              /* 4. Clear status */
        mtdcr(DCRN_DMACR2, mfdcr(DCRN_DMACR2) | SET_DMA_SAI(1));
        mtdcr(DCRN_DMACR2, mfdcr(DCRN_DMACR2) | SET_DMA_DAI(0));
                                              /* 5. Destination Increment */
        mtdcr(DCRN_DMACR2, mfdcr(DCRN_DMACR2) | SET_DMA_TM(TM_S_MM));
                                              /* 5. Software memory-to-memory */        mtdcr(DCRN_DMACR2, mfdcr(DCRN_DMACR2) | SET_DMA_CIE_ENABLE(1));
                                              /* 5. Interrupt enable */
        mtdcr(DCRN_DMACR2, mfdcr(DCRN_DMACR2) | SET_DMA_PL(EXTERNAL_PERIPHERAL));
        mtdcr(DCRN_DMACR2, mfdcr(DCRN_DMACR2) | SET_DMA_ETD(1)); /* 1 req. */
        mtdcr(DCRN_DMACR2, mfdcr(DCRN_DMACR2) | SET_DMA_TCE(1)); /* 1 req. */
                                                                                
        //printk("DMA Configuration:\n\n");
        //printk("DCRN_DMACR2=0x%08x\n", mfdcr(DCRN_DMACR2));
        //printk("DCRN_DMASA2=0x%08x\n", mfdcr(DCRN_DMASA2));
        //printk("DCRN_DMADA2=0x%08x\n", mfdcr(DCRN_DMADA2));
        //printk("DCRN_DMACT2=0x%08x\n", mfdcr(DCRN_DMACT2));
        //printk("DCRN_DMASR=0x%08x\n", mfdcr(DCRN_DMASR));
                                                                                
        /* enable DMA */
                                                                                
        mtdcr(DCRN_DMACR2, mfdcr(DCRN_DMACR2) | SET_DMA_CE_ENABLE(1));
                                              /* 5. Channel enable */
                                                                                
        wait_for_completion(&mynand_dma_completion);
                                                                                
        //for (i=0; i<len;i++)
        //      buf[i] = readb(this->IO_ADDR_R);
                                                                                
}

static void mynand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
{
                                                                                
        int i;
        struct nand_chip *this = mtd->priv;
        unsigned long IO_ADDR_DMA_R = this->IO_ADDR_R-(unsigned long)mynand_base_logical+mynand_base_physical;
                                                                                
        //printk("mynand_read_buf: %d bytes.\n",len);
                                                                                
        mtdcr(DCRN_DMACR2, 0);
        mtdcr(DCRN_DMACR2, SET_DMA_PW(PW_8)); /* 1. transfer is 8 bit */
        mtdcr(DCRN_DMASA2, IO_ADDR_DMA_R);    /* 2. Source Address */
        mtdcr(DCRN_DMADA2, mynand_dma_addr);  /* 2. Destination Address */
        mtdcr(DCRN_DMACT2, len);              /* 3. Set count */
        mtdcr(DCRN_DMASR, DMA_CS2|DMA_TS2|DMA_CH2_ERR);
                                              /* 4. Clear status */
        mtdcr(DCRN_DMACR2, mfdcr(DCRN_DMACR2) | SET_DMA_SAI(0));
        mtdcr(DCRN_DMACR2, mfdcr(DCRN_DMACR2) | SET_DMA_DAI(1));
                                              /* 5. Destination Increment */
        mtdcr(DCRN_DMACR2, mfdcr(DCRN_DMACR2) | SET_DMA_TM(TM_S_MM));
                                              /* 5. Software memory-to-memory */        mtdcr(DCRN_DMACR2, mfdcr(DCRN_DMACR2) | SET_DMA_CIE_ENABLE(1));
                                              /* 5. Interrupt enable */
        mtdcr(DCRN_DMACR2, mfdcr(DCRN_DMACR2) | SET_DMA_PL(EXTERNAL_PERIPHERAL));
        mtdcr(DCRN_DMACR2, mfdcr(DCRN_DMACR2) | SET_DMA_ETD(1)); /* 1 req. */
        mtdcr(DCRN_DMACR2, mfdcr(DCRN_DMACR2) | SET_DMA_TCE(1)); /* 1 req. */
                                                                                
        mtdcr(DCRN_DMACR2, mfdcr(DCRN_DMACR2) | SET_DMA_BEN(1));
                                                                                
        //printk("DMA Configuration:\n\n");
        //printk("DCRN_DMACR2=0x%08x\n", mfdcr(DCRN_DMACR2));
        //printk("DCRN_DMASA2=0x%08x\n", mfdcr(DCRN_DMASA2));
        //printk("DCRN_DMADA2=0x%08x\n", mfdcr(DCRN_DMADA2));
        //printk("DCRN_DMACT2=0x%08x\n", mfdcr(DCRN_DMACT2));
        //printk("DCRN_DMASR=0x%08x\n", mfdcr(DCRN_DMASR));
                                                                                
        /* enable DMA */
                                                                                
        mtdcr(DCRN_DMACR2, mfdcr(DCRN_DMACR2) | SET_DMA_CE_ENABLE(1));
                                              /* 5. Channel enable */
        wait_for_completion(&mynand_dma_completion);
                                                                                
        memcpy(buf, mynand_dma_buf, len);
                                                                                
        //printk("transfer done!\n");
        //for (i=0; i<len;i++)
        //      buf[i] = readb(this->IO_ADDR_R);
                                                                                
}

static void mynand_dma_irq(int irq, void *this, struct pt_regs *regs) {
                                                                                
        //printk("mynand: DMA interrupt %d.\n", irq);
        mtdcr(DCRN_DMASR, DMA_CS2|DMA_TS2|DMA_CH2_ERR); /* zero status */
        complete(&mynand_dma_completion);
}

Enjoy!

Jon.
