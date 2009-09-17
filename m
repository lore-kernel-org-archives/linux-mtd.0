Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MoFyL-0008Rw-7s
	for linux-mtd@lists.infradead.org; Thu, 17 Sep 2009 12:20:29 +0000
Received: from esebh106.NOE.Nokia.com (esebh106.ntc.nokia.com [172.21.138.213])
	by mgw-mx09.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	n8HCJbSO008064
	for <linux-mtd@lists.infradead.org>; Thu, 17 Sep 2009 07:19:39 -0500
From: Artem Bityutskiy <dedekind@infradead.org>
To: Adrian Hunter <Adrian.Hunter@nokia.com>
Subject: [PATCH 0/5] UBIFS: few minor changes
Date: Thu, 17 Sep 2009 15:19:51 +0300
Message-Id: <1253189996-14191-1-git-send-email-dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Adrian,

here is a short patch-set which mostly contain debugging
code changes - debugging messages and dumps improvements
and fixes. One patch contains just commentaries changes,
and one introduces new macro definitions which are useful
in user-space.

I know it is a bit late, but the patches are not changing
any real functionality and are useful, so I'd like to merge
them this window, if you are OK.

Artem.
