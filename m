Received: from mail2.racnet.net ([213.144.11.11])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DU01T-0008TT-GU
	for linux-mtd@lists.infradead.org; Fri, 06 May 2005 06:25:32 -0400
Message-ID: <427B3E53.3090803@rac.de>
Date: Fri, 06 May 2005 11:52:19 +0200
From: Marcus Mikolaiczyk <m.mikolaiczyk@rac.de>
MIME-Version: 1.0
To: m.mikolaiczyk@rac.de
References: <425E37FF.5040703@rac.de> <425E41D8.5070408@setabox.com>
	<425E4576.7030603@rac.de>
In-Reply-To: <425E4576.7030603@rac.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Nand Flash not found.
Reply-To: m.mikolaiczyk@rac.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm still on the way getting the Samsung NAND discovered, but a small
step has been made.
I've got now a simple testapplication which can read out the NAND IDs
with the readid cmd 0x90 . So I can definitely discover this NAND chip
with this Linux app, but not with the 'derived' linux NAND driver.
Samsung K9F2G08UOM:
Page Size: 2k (+64) Bytes
Block Size: 128k (+4k) Bytes
Organisation: 8 Bit


Code example for external READID cmd:
#define NANDF_DATA            (*((unsigned int volatile *) 0xAE000000))
#define NANDF_COMM            (*((unsigned int volatile *) 0xAE000004))
#define NANDF_ADDR            (*((unsigned int volatile *) 0xAE000008))
...
  value=0x90;
  NANDF_COMM=value;
  value=0x00; // not necessary
  NANDF_ADDR=value;
  va[0]=NANDF_DATA;
  va[1]=NANDF_DATA;
  va[2]=NANDF_DATA;
  va[3]=NANDF_DATA;
  printf("Maker Code: %x     Device Type: %x    DontCare: %x
Organisation: %x\n\r", va[0], va[1], va[2], v
a[3]);
...

Results:
Maker Code: ec     Device Type: da    DontCare: 80    Organisation: 15
SAMSUNG		   3.3V				      See Above Values for Pages Size...

I changed the hardwarespecific part to this values but with no success.
The module does not find the NAND.

static int BTU_NAND_BASE = 0xAE000000;
static int BTU_NAND_VIRT_BASE ;
static int BTU_NAND_RB = 0xF0000C00;
static int BTU_NAND_RB_RDY = (1<<5);
...
static void btutc1130_hwcontrol(struct mtd_info *mtd, int cmd)
{
       struct nand_chip *this = (struct nand_chip *) mtd->priv;
       switch(cmd){
       //Command Latch Enable Settings
       case NAND_CTL_SETCLE: this->IO_ADDR_W = BTU_NAND_BASE + 4; break;
       case NAND_CTL_CLRCLE: this->IO_ADDR_W = BTU_NAND_BASE; break;
       //Address Latch Enable Settings
       case NAND_CTL_SETALE: this->IO_ADDR_W = BTU_NAND_BASE + 8; break;
       case NAND_CTL_CLRALE: this->IO_ADDR_W = BTU_NAND_BASE; break;
       }
}
...
       /* map physical adress */
        BTU_NAND_VIRT_BASE=(unsigned long)ioremap(BTU_NAND_BASE,SZ_4K);
...
        /* Set address of NAND IO lines */
        this->IO_ADDR_R = BTU_NAND_BASE;
        this->IO_ADDR_W = BTU_NAND_BASE;
        this->hwcontrol = btutc1130_hwcontrol;
        this->dev_ready = btutc1130_device_ready;
        /* 20 us command delay time */
        this->chip_delay = 20;
        this->eccmode = NAND_ECC_SOFT;
...

What does the nand_scan function check ?
What else should be adapted (Chip ID list in nand_ids.c)?
Someone any ideas.

Cheers Marcus
