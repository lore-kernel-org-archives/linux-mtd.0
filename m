Received: from mail2.racnet.net ([213.144.11.11])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DM1Yr-0003p7-Km
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2005 06:27:02 -0400
Message-ID: <425E4576.7030603@rac.de>
Date: Thu, 14 Apr 2005 12:27:02 +0200
From: Marcus Mikolaiczyk <m.mikolaiczyk@rac.de>
MIME-Version: 1.0
To: William J Beksi <wjbeksi@setabox.com>
References: <425E37FF.5040703@rac.de> <425E41D8.5070408@setabox.com>
In-Reply-To: <425E41D8.5070408@setabox.com>
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

Hi William,

the connection should be ok, the hardware guys tested it - I hope so.
They use a simple test appl. which I cannot use under Linux.

the hardware function (discussion "NAND connected with address lines
based example" on this list around 31.03.2005):
...
static int BTU_NAND_BASE = 0xAE000000;
static int BTU_NAND_VIRT_BASE ;
static int BTU_NAND_RB = 0xF0000C00;
static int BTU_NAND_RB_RDY = (1<<5);
/*
 * Define partitions for flash devices
 */
extern struct nand_oobinfo jffs2_oobinfo;
#define NUM_PARTITIONS256M 1
static struct mtd_partition partition_info256M[] = {
        { name: "BTU NAND flash partition 1",
          offset:  0,
          size:    SZ_256M },
};

/*
 *      hardware specific access to control-lines via address bus
 */
static void btutc1130_hwcontrol(struct mtd_info *mtd, int cmd)
{
        struct nand_chip *this = (struct nand_chip *) mtd->priv;
        switch(cmd){
                //Command Latch Enable Settings
                case NAND_CTL_SETCLE: this->IO_ADDR_W = BTU_NAND_BASE +
1; break;
                case NAND_CTL_CLRCLE: this->IO_ADDR_W = BTU_NAND_BASE;
break;
                //Address Latch Enable Settings
                case NAND_CTL_SETALE: this->IO_ADDR_W = BTU_NAND_BASE +
2; break;
                case NAND_CTL_CLRALE: this->IO_ADDR_W = BTU_NAND_BASE;
break;
        }
}

/*
 *      read device ready pin
 */
int btutc1130_device_ready(struct mtd_info *mtd)
{
        // Gibt 0 zurueck, wenn P0.4_IN 0 ist ansonsten 1
        return ( (*(volatile unsigned char *) (BTU_NAND_RB + 0x14)) &
BTU_NAND_RB_RDY) ? 1 : 0;
}
....
....

I've got a seperate CS which is connect to the nand an too this CS the
address range 0xAE000000 is 'connected'.

I'm looking for to write a small c-appl which does some inital tests on
this.

Marcus
