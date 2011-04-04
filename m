Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6kyM-0003I1-R4
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 14:41:46 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/5] UBIFS: fix failure in dbg_check_space_info
Date: Mon,  4 Apr 2011 17:44:52 +0300
Message-Id: <1301928297-2246-1-git-send-email-dedekind1@gmail.com>
Cc: Caizhiyong <caizhiyong@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch has to fix the failure in 'dbg_check_space_info()' which
I can reproduce myself with the 'integck' test and which has also been
reported here:

http://lists.infradead.org/pipermail/linux-mtd/2011-April/034647.html

The fix is in the last patch and it is quite trivial. It also describes
the reason for the failure.

Patches 1-4 mostly improve the debugging output which helps to diagnose
the problem quicker. So they are preparational patches.

Artem.
