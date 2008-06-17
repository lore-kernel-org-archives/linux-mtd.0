Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K8eUo-0002Ej-GQ
	for linux-mtd@lists.infradead.org; Tue, 17 Jun 2008 16:57:27 +0000
Date: Tue, 17 Jun 2008 18:57:18 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Alexey Korolev <akorolev@infradead.org>
Subject: Re: [BUG] JFFS2 power loss recovery issues on NAND
Message-ID: <20080617165717.GH28448@logfs.org>
References: <alpine.LFD.1.10.0806101438520.27550@casper.infradead.org>
	<48570D5A.1050906@call-direct.com.au> <48577212.9070004@parrot.com>
	<20080617092434.GA27539@logfs.org>
	<alpine.LFD.1.10.0806171642280.31079@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.LFD.1.10.0806171642280.31079@casper.infradead.org>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	Iwo Mergler <iwo@call-direct.com.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 17 June 2008 17:00:42 +0100, Alexey Korolev wrote:
> 
> Declare bug as a feature could be not so good. But the issue is rare. I think if we got some time we will fix it in the described way.

[ You really should switch to a decent mailer that e.g. breaks lines
  before column 136. ;) ]

For 'normal' filesystems, this bug is solved in __sync_single_inode by
writing out pages first and the inode later.  Works well enough for
ext[23] at least.

So I agree, JffS2 should behave at least as well.

Jörn

-- 
Simplicity is prerequisite for reliability.
-- Edsger W. Dijkstra
