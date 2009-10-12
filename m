Received: from mailout-afstr61.mailout.artfiles.de ([212.72.187.61]
	helo=mailout.artfiles.de)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MxK6u-0000A5-71
	for linux-mtd@lists.infradead.org; Mon, 12 Oct 2009 12:34:48 +0000
Received: from [213.157.18.234] (helo=linux-primary.intern.xnet2000.de)
	auth=postmaster@xnet2000.de
	by mailout.artfiles.de with esmtpa (Exim 4.69) id 1MxK6r-00036G-VT
	for linux-mtd@lists.infradead.org; Mon, 12 Oct 2009 14:34:42 +0200
Received: from [192.168.0.175] (machineroom.intern.xnet2000.de [192.168.0.175])
	by linux-primary.intern.xnet2000.de (Postfix) with ESMTP id C11545EE512
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Oct 2009 14:34:44 +0200 (CEST)
Message-ID: <4AD32261.70209@xnet2000.de>
Date: Mon, 12 Oct 2009 14:34:41 +0200
From: Robert Parusel <rparusel@xnet2000.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: how can I mkfs.jffs2 on AT45DB321
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Reply-To: rparusel@xnet2000.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

can someone give me a hint how to use a AT45DB321 dataflash on avr32 linux.

I've added
*Code:*

        {
                .modalias = "mtd_dataflash",
                .controller_data = ( void * ) GPIO_PIN_PB ( 2 ),
                .max_speed_hz = 1000000,
                .bus_num = 1,
                .chip_select = 0,
        },


in the board setup code
and while booting the kernel i can see:
*Code:*

mtd_dataflash spi1.0: AT45DB321x (4224 KBytes) pagesize 528 bytes, OTP


The next step was
*Code:*

flash_eraseall -j /dev/mtd3

than
*Code:*

mkfs.jffs2 -r /tmp/emptyfs -o /tmp/temp.jffs2 -s528 -e528 -p4325376 -b
-v -n


I've copied the file /tmp/temp.jffs2 with flashcp to the device
*Code:*

flashcp /tmp/temp.jffs2 /dev/mtd3


An than, while, mounting the dataflash, i see a lot of
*Code:*

.
CLEANMARKER node found at 0x00254310 has totlen 0xc != normal 0x0
Empty flash at 0x0025431c ends at 0x00254520
.
Newly-erased block contained word 0x19852003 at offset 0x0038d900

lines.

So it seems that the hardware is ok, but my commands,
to make a jffs filesystem on it, must be wrong.

Can someone help me please?

--

Kind regards
robert
