Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Ju84z-0004ru-FV
	for linux-mtd@lists.infradead.org; Thu, 08 May 2008 15:30:46 +0000
Date: Thu, 8 May 2008 17:30:38 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Alexander Belyakov <abelyako@googlemail.com>
Subject: Re: [PATCH][RFC] NAND subpage read feature. Take 2.
Message-ID: <20080508153038.GC14141@logfs.org>
References: <Pine.LNX.4.64.0804301301360.6788@pentafluge.infradead.org>
	<20080501202523.GA17828@logfs.org>
	<fe810cf0805040146y64ffcb66vfbf2c4aa82eabfd4@mail.gmail.com>
	<20080505073745.GA13916@logfs.org>
	<fe810cf0805050510g2bf7ef4brfaf4352454dd204b@mail.gmail.com>
	<20080505153959.GA17330@logfs.org>
	<fe810cf0805060229j3c20ab77g96c5ade0f111d278@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe810cf0805060229j3c20ab77g96c5ade0f111d278@mail.gmail.com>
Cc: dwmw2@infradead.org, tglx@linutronix.de, linux-mtd@lists.infradead.org,
	Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 6 May 2008 13:29:09 +0400, Alexander Belyakov wrote:
> 
> Thanks. I believe mtd caching deserves separate discussion, because
> too many mtd things are going to be affected.

Indeed.  For that very reason I've kept the caching part of logfs for
now.  It is not a trivial decision to make and regressions can show up
in surprising places.

Jörn

-- 
Joern's library part 10:
http://blogs.msdn.com/David_Gristwood/archive/2004/06/24/164849.aspx
