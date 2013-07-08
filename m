Received: from mail-bk0-x232.google.com ([2a00:1450:4008:c01::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uw7YT-0004Cl-Rg
 for linux-mtd@lists.infradead.org; Mon, 08 Jul 2013 09:16:22 +0000
Received: by mail-bk0-f50.google.com with SMTP id ik8so1752600bkc.9
 for <linux-mtd@lists.infradead.org>; Mon, 08 Jul 2013 02:15:58 -0700 (PDT)
Subject: Add "UBIFS: fix a horrid bug" to 3.2 branch?
From: Christoph Fritz <chf.fritz@googlemail.com>
To: Ben Hutchings <ben@decadent.org.uk>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 08 Jul 2013 11:15:54 +0200
Message-ID: <1373274954.4186.38.camel@mars>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, Al Viro <viro@zeniv.linux.org.uk>,
 stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ben,

 I can't find an incarnation of commit "UBIFS: fix a horrid
bug" (605c912) in current stable branch 3.2 but 3.0, 3.4, 3.9 and
current.

Are there any concerns adding these commits:

    UBIFS: prepare to fix a horrid bug
    UBIFS: fix a horrid bug

Thanks
 -- Christoph
