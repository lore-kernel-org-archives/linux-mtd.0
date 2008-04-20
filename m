Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jnhvl-0003lI-5Z
	for linux-mtd@lists.infradead.org; Sun, 20 Apr 2008 22:22:41 +0000
To: Bernard Blackham <bernard@largestprime.net>
From: Wolfgang Denk <wd@denx.de>
Subject: Re: [U-Boot-Users] ubi and u-boot
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: Your message of "Sat, 19 Apr 2008 01:49:47 +0800."
	<4808DF3B.2080702@largestprime.net>
Date: Mon, 21 Apr 2008 00:22:37 +0200
Sender: wd@denx.de
Message-Id: <20080420222237.4AE5324657@gemini.denx.de>
Cc: u-boot-users@lists.sourceforge.net, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In message <4808DF3B.2080702@largestprime.net> you wrote:
> 
> Wolfgang showed some interest briefly too.[1]

I am definitely interested.

>  > The UBI (version 1 :-) initial scan is not
> > fast for large flash, and if the bootloader does it too, that's twice
> > as much time to boot.

We have the same (at at least similar) problems when using JFFS2 file
systems in U-Boot. Yet, being able to do this is quite useful in many
situations.

> > However, if there was a protocol for bootloader to pass the scan
> > results to the booted kernel, that would be very nice.

That would be of course a good thing to have :-)

> If there's no compelling reasons not to, I'll try and find some time to 
> work on ubi in uboot. I'm not expecting it to be easy though :)

Thanks in advance, and good luck!

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
All these theories, diverse as they are, have two things  in  common:
they explain the observed facts, and they are completeley and utterly
wrong.                       - Terry Pratchett, _The Light Fantastic_
