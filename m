Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E7ZYz-0001W0-CR
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2005 10:15:49 -0400
Message-ID: <430B2F84.30307@inf.u-szeged.hu>
Date: Tue, 23 Aug 2005 16:15:32 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Cc: dedekind@yandex.ru, dwmw2@infradead.org
Subject: [PATCH] summary
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Here is the latest version of summary patch:
http://www.inf.u-szeged.hu/jffs2/jffs2-summary-20050823.patch
Some additional comment has been added, and if we are right all of the
mentioned thing have been fixed. There is only one exception: we still
use own lists rather than the kernel's ones. Now they are o(1), too.
(will be changed in the next round)

Does any official decision about the new virtual erase block handling
(or 1:1 mapping) of JFFS2?

Bye,
Ferenc
