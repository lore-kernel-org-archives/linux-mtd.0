Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nzn2U-0006Dq-A8
	for linux-mtd@lists.infradead.org; Thu, 08 Apr 2010 08:24:39 +0000
Subject: Re: UBIFS and MLC NAND Flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Pedro I. Sanchez" <psanchez@fosstel.com>
In-Reply-To: <4BA7A183.7040206@fosstel.com>
References: <4BA7A183.7040206@fosstel.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 08 Apr 2010 11:22:41 +0300
Message-ID: <1270714961.6754.107.camel@localhost>
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

Hi,

On Mon, 2010-03-22 at 12:57 -0400, Pedro I. Sanchez wrote:
> Hello,
> 
> I have a few questions regarding this topic.
> 
> 1. The UBIFS FAQ has a summary of the state of the support for MLC NAND 
> flash here:
> 
>   http://www.linux-mtd.infradead.org/faq/ubifs.html#L_ubifs_mlc
> 
> The question is, is this still the case? Does the FAQ reflect the 
> current state of affairs?

I think so.

> 2. I have several boards with MLC NAND flash running the Linux kernel 
> 2.6.29 and UBIFS. I am seeing a fairly large rate of file "corruption" 
> errors, files that all of a sudden become unreadable. Curiously enough, 
> they have been read-only files in all cases, program executables and 
> shared libraries.

Hmm. Do you do unclean power cuts?

> Would upgrading to a more recent kernel, or back porting the latest 
> UBIFS code, help? Shall I expect better support for MLC NAND flash in 
> the latest UBIFS code?

You did not specify whether you pulled the ubifs-v2.6.29.git tree. If
you did this, then your UBI/UBIFS should be the same as in the latest
kernels. Please, do this, although this will probably not solve your
corruption problems, but you'll have other bug-fixes we have made since
2.6.29 times.

Please, take a look here as well:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport

Did you run MTD tests? If no, run them. You may have issues on driver/HW
levels.

Vs. "Shall I expect better support" - not as far as I know, because I
have not heard if anyone is working on this. But you could do that and
contribute.

> 3. I am also seeing other errors where it is the U-Boot or the Kernel 
> partitions that become corrupted. UBIFS is not involved there directly 
> since these partitions are at the mtd level and outside the UBI layer.
> 
> More specifically, my flash is partitioned as mtd0, mtd1, mtd2, mtd3, 
> mtd4. Only mtd4 has UBI/UBIFS on top. Is it possible that some flash 
> handling problems in UBIFS (mtd4) "spill over" other non-UBIFS mtd 
> partitions?

May be. Start with validating your MTD driver using MTD tests. This may
help you to narrow down the problem.

> 4. Other than minimizing flash writes, is there any other suggestion on 
> what to do to improve on the failure rate I see in the file system?

Not sure. You should carefully investigate you problems and find out the
nature of the failures, and then we can discuss that.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
