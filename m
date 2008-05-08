Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Ju8CK-0005Vq-Ny
	for linux-mtd@lists.infradead.org; Thu, 08 May 2008 15:38:20 +0000
Date: Thu, 8 May 2008 17:38:11 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH][RFC] NAND subpage read feature. Take 2.
Message-ID: <20080508153811.GF14141@logfs.org>
References: <Pine.LNX.4.64.0804301301360.6788@pentafluge.infradead.org>
	<20080501202523.GA17828@logfs.org>
	<fe810cf0805040146y64ffcb66vfbf2c4aa82eabfd4@mail.gmail.com>
	<20080505073745.GA13916@logfs.org>
	<fe810cf0805050510g2bf7ef4brfaf4352454dd204b@mail.gmail.com>
	<20080505153959.GA17330@logfs.org>
	<fe810cf0805060229j3c20ab77g96c5ade0f111d278@mail.gmail.com>
	<20080508153038.GC14141@logfs.org>
	<1210260821.3645.68.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1210260821.3645.68.camel@sauron>
Cc: linux-mtd@lists.infradead.org, tglx@linutronix.de, dwmw2@infradead.org,
	Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 8 May 2008 18:33:41 +0300, Artem Bityutskiy wrote:
> 
> We could provide a possibility to explicitly enable/disable it I guess.

I've thought about that as well, but didn't like the idea too much.  It
would be better to spend the extra work and make sure we don't have
regressions.

Jörn

-- 
Optimizations always bust things, because all optimizations are, in
the long haul, a form of cheating, and cheaters eventually get caught.
-- Larry Wall
