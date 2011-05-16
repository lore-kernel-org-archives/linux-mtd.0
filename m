Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QLxGV-0005vj-MA
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 12:51:16 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-da01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4GCpDUk021378
	for <linux-mtd@lists.infradead.org>; Mon, 16 May 2011 15:51:13 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/4] UBIFS: fix very rare recovery failure
Date: Mon, 16 May 2011 15:55:09 +0300
Message-Id: <1305550513-27990-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

finally after all the preparation and clean-up work I can fix the very rare
recovery failure which I observed when doing power-cut emulation testing with
integck. The symptoms of the failure is that we are unable to mount the FS with
the ENOSPC (no space) error.

I am not really able to confirm the issue was fixed, because I could reproduce
it only once in a week. But at least I can confirm that this does not break the
recovery :-) We'll see if I'll be ever able to hit this issue.

More detailed description of the issue and the way I chose to fix it can be
found in the last patch "UBIFS: fix extremely rare mount failure".

Artem.
