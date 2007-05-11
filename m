Received: from ug-out-1314.google.com ([66.249.92.168])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HmVUt-0007S1-B8
	for linux-mtd@lists.infradead.org; Fri, 11 May 2007 09:49:29 -0400
Received: by ug-out-1314.google.com with SMTP id m2so620651uge
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 May 2007 06:49:24 -0700 (PDT)
From: borasah@gmail.com
To: linux-mtd@lists.infradead.org
Subject: Re: NAND flash write goes wrong
Date: Fri, 11 May 2007 16:56:23 +0300
References: <200705102150.31171.borasah@gmail.com>
	<Pine.LNX.4.64.0705110825530.3951@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.0705110825530.3951@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="Iso-8859-9"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200705111656.24216.borasah@gmail.com>
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> > compiled them for both the host and the target. I am using "mkfs.jffs2
> > command on the host" to generate a jffs2 image.
> > 	./mkfs.jffs2 -p 0x3800000 -s 0x200 -e 0x4000 -r rootfs -o img -l
>
> I don't know if this is it but
>
> - I wouldn't pad the output image using -p <padsize>. Since there may be
>    bad blocks in the flash, the image might not fit if padded to the
>    whole partition size. Just skip the -p and its argument. As long as
>    the whole partition into which the image is written has been erased
>    beforehand, jffs2 will be able to make use of the unused space.
>
> - The -s <pagesize>  argument doesn't specify the page size of the
>    flash chip, rather it should be the same as the 'page size' in the
>    Linux system, normally 4096 for most architectures.
>
> - In nand flash, the cleanmarkers are normally not part of the image
>    as they reside in the 'spare area' in the flash. The JFFS2 driver will
>    automatically create cleanmarkers when it scans the chip at first boot,
>    and having them in the image will confuse the issue, even if it normally
>    works anway (but with lots of warnings at boot time).
>    So, add -n to the list of arguments to inhibit cleanmarker
>    generation by mkfs.jffs2.

Thanks for the infos. OK, this means
	./mkfs.jffs2 -e 0x4000 -r rootfs -o img -l -n
or
	./mkfs.jffs2 -s 0x1000 -e 0x4000 -r rootfs -o img -l -n
right? I checked the target .config, it uses 4K as page size. But I gave

	Input file is not page aligned
	Data did not fit into device, due to bad blocks
	: Success

In fact, I tried without -p and with -n before. Without -p nandwrite gives the 
above message. Then I put -p and nandwrite started to write...

> > 	Erasing 16 Kibyte @ 24000 --  0 % complete. Cleanmarker written at
> > 24000. Skipping bad block at 0x00028000
> > 	...
> > Is this normal? Then I do
> > 	./nandwrite /dev/mtd2 img
> > It writes by skipping bad blocks.
> > 	...
> > 	Writing data to block 189c000
> > 	Bad block at 189c000, 1 block(s) from 189c000 will be skipped
> > 	Writing data to block 18a0000
> > 	...
>
> If there indeed are bad blocks it is correct to skip them both when
> erasing and writing.

OK. What I wanted to learn was different. In the begining there was no bad 
sector but by the passage of time, when I tried different combinations, bad 
sector numbers started to increase. Is this normal? Or are there some 
fundamentally different things between kernel version and mtd-utils so these 
marks them as bad?

Thanks...

--
Bora SAHIN
