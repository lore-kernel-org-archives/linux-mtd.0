Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FQhoB-0004GB-0u
	for linux-mtd@lists.infradead.org; Tue, 04 Apr 2006 05:26:51 -0400
Date: Tue, 4 Apr 2006 11:26:28 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Andrew Morton <akpm@osdl.org>
Message-ID: <20060404092628.GA12277@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: Simon Evans <spse@secret.org.uk>, "Eric W. Biederman" <ebiederman@lnxi.com>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	"H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw2@infradead.org>
Subject: [Patch 0/3] Remove blkmtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patchset removed blkmtd in three steps:
1. Mark it as deprecated,
2. mark block2mtd, the replacement, as no longer experimental and
3. remove the driver.

Eric suggested sending patch 1 and 2 directly to Linus while leaving
patch 3 in -mm as long as klibc remains there as well.  Andrew, do you
prefer me to send the first two patches to Linus or will you rather do
it yourself?

Jörn

-- 
When people work hard for you for a pat on the back, you've got
to give them that pat.
-- Robert Heinlein
