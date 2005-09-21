Received: from anchor-post-35.mail.demon.net ([194.217.242.85])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EI7nA-0002Q3-44
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2005 12:50:17 -0400
From: "Andy Hawkins" <a.hawkins@cabletime.com>
To: <support@mvista.com>, <linux-mtd@lists.infradead.org>,
	<linuxppc-embedded@ozlabs.org>
Date: Wed, 21 Sep 2005 17:49:15 +0100
Message-ID: <003401c5becc$6795bf00$153335bf@cabletime.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Slow read performance of NAND flash on PPC 405EP
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We have a custom PPC-405EP based board, with a Samsumg 8Gbit flash
(K9W8G08U1M) attached via EBC bank 2. When we read from this flash, we are
only getting data rates of around 20 MBits/sec (this is using 'dd' to read
direct from the linux /dev/mtd/x device). Our estimates show that the device
should be capable of something like 100 MBits/sec.

The EBC bank is set up as follows:

#define CFG_EBC_PB2AP           0x8a015480
#define CFG_EBC_PB2CR           0xFF458000  /*
BAS=0xFF4,BS=4MB,BU=R/W,BW=8bit */

The EBC bus is running at 54 MHz. We were originally running this bus at 27
MHz, and this speed increase doesn't appear to have done an awful lot for
us. By looking at the timings of various signals on an oscilloscope, we
adjusted the PB2AP register to that shown above, in an attempt to remove as
many of the wait states as possible.

However, during a read, we are seeing that each byte read cycle takes around
220 nSec (this is taken between the times when the #PERCS2 line for the
device goes low). A significant portion (about 6 clock periods) of this
time, the device appears to be doing nothing (i.e. the chip select line is
inactive). The code in the linux kernel to read a page of data from the
flash is very simple:

static void nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
{
        int i;
        struct nand_chip *this = mtd->priv;

        for (i=0; i<len; i++)
                buf[i] = readb(this->IO_ADDR_R);
}

readb maps to a call to in_8(FLASH_BASE_ADDRESS). The in_8 function does
contain what appear to be un-necessary calls to twi and isync, but removing
these calls does not alter the cycle time significantly.

Is there some setup of the EBC (or other component in the processor) that we
have incorrect that could be affecting the throughput?

Any advice you can offer would be greatly appreciated.

Thanks

Andy
