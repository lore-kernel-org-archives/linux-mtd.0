Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Ncu7T-0002Jc-BF
	for linux-mtd@lists.infradead.org; Thu, 04 Feb 2010 05:19:15 +0000
Received: by fxm22 with SMTP id 22so4837224fxm.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 03 Feb 2010 21:19:10 -0800 (PST)
Subject: Re: ubi_bgt0d: page allocation failure. order:8, mode:0xd0
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Eric Millbrandt <emillbrandt@dekaresearch.com>
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD3118B8DD2D4@dekaexchange07.deka.local>
References: <0A40042D85E7C84DB443060EC44B3FD3118B8DD2D4@dekaexchange07.deka.local>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 04 Feb 2010 07:19:08 +0200
Message-Id: <1265260748.2517.47.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-01-25 at 15:30 -0500, Eric Millbrandt wrote:
> Hello all,
> 
> I have an embedded system that is running on a ubifs root filesystem
> which is dropping into read-only mode.  After a read of the mtd FAQ I
> found out that the filesystem has an unexpected error and that I
> should contact this list.  What could be causing this error?

You did not provide full output. But from what I see you have a bad
blocks. UBI recovers data, which is fine. But you have suspiciously too
many of them. May be this is a norm in MLC...

The ultimate failure is because MTD cannot allocate RAM. MTD should not
dynamically allocate order 8 buffer, that would need to be fixed. You'd
need to hack that function and make it allocate an array of pages, not
an 256KiB at once. Indeed, memory fragmentation quickly leads inability
to find 256KiB of physically continuous RAM.

> I am running the following
> 
> - Freescale MPC5200B
> - Micron MLC NAND flash

And I assume you read this:
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_ubifs_mlc

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
