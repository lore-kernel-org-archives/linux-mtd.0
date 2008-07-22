Received: from mail51.messagelabs.com ([216.82.244.179])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KLCSk-0006XA-6V
	for linux-mtd@lists.infradead.org; Tue, 22 Jul 2008 07:39:10 +0000
From: =?utf-8?q?Uwe=20Kleine-K=C3=B6nig?= <Uwe.Kleine-Koenig@digi.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/4] some mtd fixes
Date: Tue, 22 Jul 2008 09:38:57 +0200
Message-ID: <1216712341-25869-1-git-send-email-Uwe.Kleine-Koenig@digi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hello,

In the past I send a few problem reports and patches but only got a
single response that one of the patches was already submitted without
making it into upstream, though.

So I'm resending in the hope that continuous reminding will help in the
end :-)

Shortlog and overall diffstat can be found below.

You can also pull or fetch these patches from

	git://www.modarm9.com/gitsrc/pub/people/ukleinek/linux-2.6.git mtd-fixes

and look at them at

	http://www.modarm9.com/git/people/ukleinek/linux-2.6.git?a=shortlog;h=refs/heads/mtd-fixes

Best regards and thanks for your attention,
Uwe

Robert Jarzmik (1):
      [MTD] physmap: Fix suspend/resume/shutdown bugs.

Uwe Kleine-König (3):
      [MTD] remove bogus warning about missing boot bank location
      [RFC] [MTD] cfi_probe: remove Intel chip workaround
      [MTD] physmap: resume already suspended chips on failure to suspend


 drivers/mtd/chips/cfi_cmdset_0002.c |    5 -----
 drivers/mtd/chips/cfi_probe.c       |    8 --------
 drivers/mtd/maps/physmap.c          |   22 ++++++++++++++++++----
 3 files changed, 18 insertions(+), 17 deletions(-)
