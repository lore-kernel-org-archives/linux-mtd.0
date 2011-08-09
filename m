Received: from na3sys009aog111.obsmtp.com ([74.125.149.205])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qqt4P-0008RS-Fk
	for linux-mtd@lists.infradead.org; Tue, 09 Aug 2011 20:38:38 +0000
Received: by mail-vw0-f51.google.com with SMTP id 20so458135vws.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 09 Aug 2011 13:38:30 -0700 (PDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/3] mtd-utils: bit errors in nandtest
Date: Tue,  9 Aug 2011 16:38:20 -0400
Message-Id: <cover.1312922073.git.bengardiner@nanometrics.ca>
Cc: Ben Gardiner <bengardiner@nanometrics.ca>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The first patch is a simple increase in the amount of information output by 
mtddebug: adding the eccbytes and oobavail fields.

The next two are updates to nandtest to 1) print the number of bits corrected
during test and 2) report an estimate of the raw bit error rate (BER) of the
flash.


Ben Gardiner (3):
  mtd_debug: report ecc layout
  nandtest: print number of bits corrected during test
  nandtest: report estimated BER

 mtd_debug.c |   22 ++++++++++++++++++++++
 nandtest.c  |   29 +++++++++++++++++++++++++++--
 2 files changed, 49 insertions(+), 2 deletions(-)

-- 
1.7.3.5
