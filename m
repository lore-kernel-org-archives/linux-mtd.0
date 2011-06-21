Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QZ3AN-00081G-D0
	for linux-mtd@lists.infradead.org; Tue, 21 Jun 2011 15:47:08 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH v2 0/7] new nanddump defaults
Date: Tue, 21 Jun 2011 08:46:34 -0700
Message-ID: <1308671201-18197-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I sent a few of these patches without CC'ing the mailing list. Sorry for the
resend...

This series adds, changes, and deprecates several nanddump options, helping
keep them more in line with being an "inverse to nandwrite."

Brian Norris (7):
  nanddump: add --bb=METHOD option
  nanddump: remove --skipbad, leaving --bb=skipbad
  nanddump: deprecation messages for old BB options
  nanddump: warn about new default BB handling
  feature-removal-schedule: describe nanddump changes
  nanddump: add --oob option
  nanddump: document, warn about future default --omitoob

 feature-removal-schedule.txt |   36 +++++++++++
 nanddump.c                   |  136 +++++++++++++++++++++++++++++++-----------
 2 files changed, 137 insertions(+), 35 deletions(-)
