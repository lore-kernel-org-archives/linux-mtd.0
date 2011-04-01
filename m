Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5YgX-0002O3-0c
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 07:22:21 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p317MHfN026122
	for <linux-mtd@lists.infradead.org>; Fri, 1 Apr 2011 10:22:17 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Phil Carmody <ext-phil.2.carmody@nokia.com>,
	MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/2] UBIFS: fix error path in dbg_debugfs_init_fs
Date: Fri,  1 Apr 2011 10:25:28 +0300
Message-Id: <1301642730-9582-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Phil,

I was not completely happy about your fix and here is the fix I like
more. It consists of 2 patches - the first one is preparational and
the second one is the fix. Please, take a look.

Artem.
