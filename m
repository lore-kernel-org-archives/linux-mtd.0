Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M4w5s-0003H8-R5
	for linux-mtd@lists.infradead.org; Fri, 15 May 2009 12:00:59 +0000
Subject: Re: Load UBI faster
From: Artem Bityutskiy <dedekind@infradead.org>
To: simon polette <spolette@gmail.com>
In-Reply-To: <72795ccb0905130803y25acae9bwde94ed86d0dbb4f2@mail.gmail.com>
References: <72795ccb0905060026q7dcb45c0u15c35943374fcc78@mail.gmail.com>
	<1241673722.27549.14.camel@localhost.localdomain>
	<1241674092.27549.16.camel@localhost.localdomain>
	<72795ccb0905130803y25acae9bwde94ed86d0dbb4f2@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 15 May 2009 15:00:13 +0300
Message-Id: <1242388813.27996.234.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, spolette@adetelgroup.com
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-05-13 at 17:03 +0200, simon polette wrote:
> My NAND is 256MB but I use only a 130MB partition for UBI/UBIFS.
> So I implemented the on-flash BBT, that made me save 120ms which is a
> sizeable improvement.
> On the other hand, skipping crc calculation for header doesn't seem to
> save much time (perhaps ~10ms so it's difficult to measure the
> difference).

Well, you could try profiling your system and see where you can
try to optimize things.

But I think the bottleneck is the flash reading. If you may
improve it - cool.

UBI has to scan the media, this is in it's design. You would
need to develop UBI2 to fix that:
http://www.linux-mtd.infradead.org/doc/ubi.html#L_scalability

On thing you may do is to lessen the amount of eraseblocks by
joining your physical erasblocks on driver level, and report
eraseblock size 256KiB, instead of 128KiB. Then UBI would have
to read twice as less. But the drawback is that if one PEB is
bad, you waste its pair, which is not bad.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
