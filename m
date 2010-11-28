Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PMcu2-0005xH-TA
	for linux-mtd@lists.infradead.org; Sun, 28 Nov 2010 08:46:35 +0000
Received: by pvg7 with SMTP id 7so681000pvg.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 28 Nov 2010 00:46:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1290779883.2552.4.camel@localhost>
References: <AANLkTinzy-qTsYfbZhkhoFN6Tz9G47+JUWsa97KCUAke@mail.gmail.com>
	<1290779883.2552.4.camel@localhost>
Date: Sun, 28 Nov 2010 17:46:32 +0900
Message-ID: <AANLkTinxyagZ+_5_fv2ei0bF=N3Ww0KJhjSNKqNmQHpr@mail.gmail.com>
Subject: Re: Flashing UBIFS over fastboot
From: Leo Barnes <barnes.leo@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello again,

New problem:

On Fri, Nov 26, 2010 at 10:58 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>
> I think you can hack ubinize and teach it to add OOB bytes.
>

I have now managed to transform a UBIFS image so that it is flashable
by fastboot. The system then boots once without any trouble (at least
any immediate trouble), but when I reboot, it refuses to start. I have
narrowed the problem down to the fact that fastboot does not strip
trailing 0xFF pages from the blocks and instead writes them as usual.
As explained in the FAQ this has some nasty consequences. I have no
way (currently at least) of modifying how fastboot works on the
device. Is it somehow possible to fill these pages with dummy data and
tell UBI/UBIFS that it is ok to discard this data when the block is
erased sometime in the future? Or is there any other way of doing it?
If UBI/UBIFS clones/remaps a block, does it strip empty trailing
pages?

Best regards,
//Leo
