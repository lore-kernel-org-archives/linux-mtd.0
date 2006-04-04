Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by pentafluge.infradead.org with esmtp (Exim 4.60 #1 (Red Hat Linux))
	id 1FQhqI-00032T-Ew
	for linux-mtd@lists.infradead.org; Tue, 04 Apr 2006 10:28:55 +0100
Date: Tue, 4 Apr 2006 11:28:32 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Andrew Morton <akpm@osdl.org>
Message-ID: <20060404092832.GB12277@wohnheim.fh-wedel.de>
References: <20060404092628.GA12277@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20060404092628.GA12277@wohnheim.fh-wedel.de>
Cc: Simon Evans <spse@secret.org.uk>, "Eric W. Biederman" <ebiederman@lnxi.com>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	"H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw2@infradead.org>
Subject: [Patch 1/3] Immediatly deprecate blkmtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Deprecate blkmtd.  Reasoning is described in the patch itself.

Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 Documentation/feature-removal-schedule.txt |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

--- blkmtd/Documentation/feature-removal-schedule.txt~blkmtd_deprecation	2006-04-04 10:55:42.000000000 +0200
+++ blkmtd/Documentation/feature-removal-schedule.txt	2006-04-04 11:03:56.000000000 +0200
@@ -246,3 +246,17 @@ Why:	The interface no longer has any cal
 Who:	Nick Piggin <npiggin@suse.de>
 
 ---------------------------
+
+What:	blkmtd
+When:	April 2006
+Files:	drivers/mtd/devices/blkmtd.c
+Why:	o An alternative exists that hasn't had  bug report for > 1 year.
+	o Most embedded people tend to use ancient kernels with custom patches
+  	  from mtd cvs and elsewhere, so the 1 year warning period neither
+  	  helps nor hurts them too much.
+	o It's in the way of klibc.  The problems caused by pulling blkmtd
+  	  support are fairly low, while the problems caused by delaying klibc
+  	  can be fairly substantial.  At best, this would be a severe burden
+  	  on hpa's time.
+
+Who:	Joern Engel <joern@wh.fh-wedel.de>
