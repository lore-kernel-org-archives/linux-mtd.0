Received: from mx3.mail.elte.hu ([157.181.1.138])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MxQPn-0004tx-6e
	for linux-mtd@lists.infradead.org; Mon, 12 Oct 2009 19:18:43 +0000
Date: Mon, 12 Oct 2009 21:18:24 +0200
From: Ingo Molnar <mingo@elte.hu>
To: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
Subject: Re: [PATCH] panic.c: export panic_on_oops
Message-ID: <20091012191824.GL17138@elte.hu>
References: <20091012120951.GA16799@elte.hu>
	<20091012142714.56362465@marrow.netinsight.se>
	<20091012123210.GB22766@elte.hu>
	<20091012140821.5dfa1598@lxorguk.ukuu.org.uk>
	<20091012132503.GD25464@elte.hu>
	<1255354342.30919.17.camel@macbook.infradead.org>
	<20091012142634.GB4565@elte.hu>
	<1255358181.9111.14.camel@macbook.infradead.org>
	<20091012151431.GC14004@elte.hu> <4AD3763C.70307@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4AD3763C.70307@gmx.net>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"Koskinen Aaro \(Nokia-D/Helsinki\)" <aaro.koskinen@nokia.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Simon Kagstrom <simon.kagstrom@netinsight.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


* Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net> wrote:

> > I wish it worked on any of the 10+ x86 systems i have. Is there 
> > anyone who'd be interested in exploring whether warm BIOS reboots 
> > work _anywhere_?
> 
> AFAIK memory clearing is default off in coreboot for non-ECC RAM and 
> default on for ECC RAM (to avoid parity errors on read, but that can 
> probably be worked around). Unless I'm mistaken, the SeaBIOS BIOS 
> compatibility layer on top of coreboot doesn't erase RAM at all, so 
> contents can survive.
>
> No idea about classic AMI/Award/Phoenix/Insyde/whatever BIOS, though.

I wouldnt mind to support this for coreboot too, but it will only be 
practical if there's at least one standard BIOS out of the many i run 
that supports warm reboot in practice ...

Can try a test-patch on all of those systems btw. - we do support 
warm-reboot on x86 in arch/x86/kernel/reboot.c:

        /* Write 0x1234 to absolute memory location 0x472.  The BIOS reads
           this on booting to tell it to "Bypass memory test (also warm
           boot)".  This seems like a fairly standard thing that gets set by
           REBOOT.COM programs, and the previous reset routine did this
           too. */
        *((unsigned short *)0x472) = reboot_mode;

But someone would have to come up with a test-patch to prove whether it 
works really works.

	Ingo
