Received: from wproxy.gmail.com ([64.233.184.204])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DF9It-0007K6-Vx
	for linux-mtd@lists.infradead.org; Sat, 26 Mar 2005 06:18:08 -0500
Received: by wproxy.gmail.com with SMTP id 57so363819wri
	for <linux-mtd@lists.infradead.org>;
	Sat, 26 Mar 2005 03:18:08 -0800 (PST)
Message-ID: <a2cb6db60503260318343be275@mail.gmail.com>
Date: Sat, 26 Mar 2005 11:18:08 +0000
From: Zeri Virgo <sillyzeri@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Subject: boot from diskonchip with jffs2
Reply-To: Zeri Virgo <sillyzeri@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I'm in search of an update to the issues discussed in this thread... 
http://lists.infradead.org/pipermail/linux-mtd/2003-August/008327.html

I'm trying to determine the best method to boot and run from an old NAND 
DiskOnChip (*not* TSOP). A while ago, I had success with the doc2000.c 
driver...
/dev/mtd0 -> /dev/nftla -> /dev/nftla1 -> ext2 -> /(root of 64MB)

Is it feasile to use jffs2 for the root filesystem?

I understand the diskonchip.c code is ready for NFTL, reading the media 
headers and mapping a separate "BDTL partition" for use.

So, should I...

1) not try to use jffs2 and just move over to a similar method as above 
but with the diskonchip.c driver and root on the BDTL partition.

2) continue to use the deprecated doc2000.c driver and hack it to map 
some "fake" partitions...
/dev/mtd0 -> /dev/nftla -> /dev/nftla1 -> ext2 -> /boot 2MB
/dev/mtd1 (/dev/mtdblock1) -> jffs2 /(root of 62MB)

3) use DOCBoot - right now I only need it for i586, but I may need it 
for PowerPC and ARM/XScale eventually...and the README says NFTL DOCs 
aren't yet supported.

4) use U-Boot http://www.denx.de/twiki/bin/view/DULG/DiskOnChip

5) use RedBoot - would need update on 
http://lists.infradead.org/pipermail/linux-mtd/2005-January/011361.html 
re. status of DiskOnChip support for the platforms I mentioned in 3 
above? I'm going to look at the RedBoot code now...willing to have a go at 
it if necessary.

6) use something else...?

- Zeri
