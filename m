Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QqVe0-0000wg-Jw
	for linux-mtd@lists.infradead.org; Mon, 08 Aug 2011 19:37:49 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 0/9] mtd-www: various fixes, bug reporting info
Date: Mon, 8 Aug 2011 12:37:10 -0700
Message-ID: <1312832239-21759-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: brian.foster@maxim-ic.com, Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch series makes several updates to the MTD website. It's based
on top of some recent patches from Matthew Creech that affected similar
portions of the documentation.

The last patch, about bug reporting, is most likely under-informative
at the moment. To write it up, I copied a few portions from other parts
of the MTD website and tried to make them helpful as a "basic bug report"
FAQ. Some of this is in response to Brian Foster's requests, so speak
up if there are other instructions or information that you feel are
missing from this FAQ.

Brian

Brian Norris (9):
  UBIFS FAQ: spelling, grammar
  faq: general: update "pleonasm" description
  faq: general: turn statement into a question
  faq/doc: ubi(fs): move "bug report" questions to FAQ
  doc: nand: update YAFFS URL
  doc: update info on compiling mtd-utils
  faq: ubi(fs): sending bug reports using `mtdinfo'
  faq: ubi(fs): small spelling, URL fixups
  faq: general: add bug reporting FAQ

 doc/nand.xml    |    4 +-
 doc/ubi.xml     |   65 ++++--------------------------------------
 doc/ubifs.xml   |   71 ----------------------------------------------
 faq/general.xml |   84 +++++++++++++++++++++++++++++++++++++++++++++++++-----
 faq/ubi.xml     |   58 ++++++++++++++++++++++++++++++++++++-
 faq/ubifs.xml   |   85 ++++++++++++++++++++++++++++++++++++++++++++++++++----
 mail.xml        |    4 ++-
 7 files changed, 221 insertions(+), 150 deletions(-)
