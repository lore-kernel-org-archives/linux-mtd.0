Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1At8JR-0005Ak-64
	for linux-mtd@lists.infradead.org; Tue, 17 Feb 2004 16:43:09 +0000
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: David Vrabel <dvrabel@arcom.com>
In-Reply-To: <4030D2AB.7010002@arcom.com>
References: <4030D2AB.7010002@arcom.com>
Content-Type: text/plain
Message-Id: <1077036046.13463.52.camel@tubarao>
Mime-Version: 1.0
Date: 17 Feb 2004 09:40:46 -0700
Content-Transfer-Encoding: 7bit
cc: linux-mtd list <linux-mtd@lists.infradead.org>
Subject: Re: CFI command set 0002 (AMD/Fujitsu) work.
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-02-16 at 07:24, David Vrabel wrote:

> I'm currently working on cfi_cmdset_0002.c to get erase-suspend-program 
> working.  So far I've taken all the chip status checking code and 
> refactored it into a single function -- it was all a bit of a mess.

Very nice.

> 1. There's a fair amount of crap related to very broken SST chips (all 
> the stuff for retrying commands).

There's really not that much code.

>   a) This is mess and appears only 
> applicable to a very few number of chips;

Yes - it's only for a small number.

> b) I'm not sure it would even 
> work if talking to the chip is broken then retrying a few times won't 
> guarantee it will work.

Yes, it's so horribly broken that there is *never* a guarantee that it
will work.  I can't think of a reliable way to go about it other than
give it a reasonable number of tries.

> I'd suggest removing this stuff from 
> cfi_cmdset_0002.c.  Clearly the SST chips aren't compliant even though 
> they claim to be.  Thoughts?

Sure.  It is clutter and is only for a small number of chips that should
be replaced with chips that work.  I'll see what I can do on my own to
fix the problems I have to deal with.

> 2. The "fast programming" feature (unlock bypass) which is currently 
> always disabled (due to "code brokeness"). I don't believe this will 
> ever work with erase-suspends.  Should the "fast programming" stuff be 
> removed?

I don't see a reason to keep it.

-- 
Thayne Harbaugh
Linux Networx
