Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pww5Z-000227-Io
	for linux-mtd@lists.infradead.org; Tue, 08 Mar 2011 12:32:34 +0000
Received: by wwc33 with SMTP id 33so680194wwc.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 08 Mar 2011 04:32:31 -0800 (PST)
Subject: Re: Perf issue with UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Bhavesh Parekh <bhaveshparekh1@gmail.com>
In-Reply-To: <AANLkTin4FHcpvhsQJkU7pOUPk3-gV+N+1cb0W6_3KC8P@mail.gmail.com>
References: <AANLkTin4FHcpvhsQJkU7pOUPk3-gV+N+1cb0W6_3KC8P@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 08 Mar 2011 14:31:04 +0200
Message-ID: <1299587464.2754.27.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-03-07 at 15:54 +0530, Bhavesh Parekh wrote:
> Hi all,
> I am facing performance issue wil using the UBIFS on our platform.
> 
> Kernel version 2.6.36
> Nand device info : Micron chip with 2K page size & 128K erase-size
> ECC : ECC is done by the NAnd-controller.
> 
> We have YAFFS2 working on our platform and recently tried UBIFS on our
> platform. YAFF2 Perf is 18MB/s and UBIFS is 11.2 MB/s.

Compression was disabled I guess?
Are you talking about read speed, right?

>  Looking at the
> driver log we found that the UBIFS access pattern to the device is
> 4096+48 byte read in the main area, which means that there are lots of
> unaligned read.

Yeah, this is data (uncompressed) + data node header.

>  Our platform only support aligned read, so we did an
> optimization by simplying storing the last read page in the buffer
> hopping that on the next read we will be reading the same page and
> gain the perf. Doing this we were able to increase the perf to 14.5
> MB/s

I think this is standard optimization in nand_base.c.
Did you try to enable bulk read by mounting UBIFS with "bulk_read" mount
options (-o bulk_read) ?

> Is there any way we can make UBI to have the access in the aligned way
> only ?

I do not think so. UBIFS has compression, so data node size varies, so
it fundamentally cannot be block-based. YAFFS2 has not compression, thus
it is organized a bit different and it is more "block size aligned",
because YAFFS2 knows that 4KiB of data always take 4KiB on the flash. In
case of UBIFS 4KiB of data may take only 1.5KiB on the flash.

>  Other wise perf will be lesser than YAFFS2.
> 
> Further we twick the nand-driver and implemented the page-cache mode
> support in the driver.

Yeah, that'd be cool.

>  And change the mtd->writesize to 16K so that
> request from the upper layer comes in 16K. It work fine with the
> YAFFS2 and we see a perf gain of 3-4MB/s but UBIFS request pattern
> remains same 4K +48 byte. Is there anything we can do here so that
> UBIFS respect mtd->writesize

Yeah, you can try to do this.

But please, try UBIFS bulk_read option, does it make any difference for
you?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
