Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q0Y1z-0006qR-QD
	for linux-mtd@lists.infradead.org; Fri, 18 Mar 2011 11:39:48 +0000
Received: from eru.research.nokia.com (esdhcp03787.research.nokia.com
	[172.21.37.87])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2IBdjmP026183
	for <linux-mtd@lists.infradead.org>; Fri, 18 Mar 2011 13:39:45 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/2] mkfs.ubifs: remove features
Date: Fri, 18 Mar 2011 13:42:38 +0200
Message-Id: <1300448560-4166-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We have the feature-removal-schedule.txt file where we documented
the plan for changing API for some mtd tools. We made some preparations
for this by printing warnings, and now it is time to actually commit
the changes.

Artem.
