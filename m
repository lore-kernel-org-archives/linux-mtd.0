Received: from [217.111.56.18] (helo=spring.sncag.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bmlgk-0006u0-NG
	for linux-mtd@lists.infradead.org; Mon, 19 Jul 2004 23:53:11 -0400
To: D.A.Fedorov@inp.nsk.su
In-Reply-To: <Pine.SGI.4.10.10407192037090.204659-100000@Sky.inp.nsk.su>
	(Dmitry A. Fedorov's message of "Mon, 19 Jul 2004 21:01:13 +0700")
References: <Pine.SGI.4.10.10407192037090.204659-100000@Sky.inp.nsk.su>
From: Rainer Weikusat <rainer.weikusat@sncag.com>
Date: Tue, 20 Jul 2004 11:22:26 +0800
Message-ID: <87smbn747h.fsf@farside.sncag.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org
Subject: Re: starting address of mtd device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

"Dmitry A. Fedorov" <D.A.Fedorov@inp.nsk.su> writes:
[...]

> Well, what about generic physmap board module?
> I can make patch.

I could provide you with one, if you wanted to use it (enables
configuration of arbitrarily mapped distinct flash chips via command
line, a sample looks like this:

CONFIG_CMDLINE="root=/dev/mtdblock2 physmap=phys_0:0x200000@0x2800000:2,phys_1:0x800000@0x2a00000:2 mtdparts=phys_0:128k(boot),-(root);phys_1:64k(top),8064k(main),64k(bottom)"

Patch is against 2.4.26-stock, but it should be reasonably to generic
to port it easily. I am actually using this with the board I am
working at the moment, and, except the fact that the *amdstd-functions
keep panicking my kernel (next work-step to do ;-), it seems to be
working fine.
