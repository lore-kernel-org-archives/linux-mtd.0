Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pz8ze-0000nG-8n
	for linux-mtd@lists.infradead.org; Mon, 14 Mar 2011 14:43:36 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2EEhTSZ004474
	for <linux-mtd@lists.infradead.org>; Mon, 14 Mar 2011 16:43:29 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
Subject: [PATCH 0/6] UBIFS: save a bit of RAM
Date: Mon, 14 Mar 2011 16:46:06 +0200
Message-Id: <1300113972-4507-1-git-send-email-dedekind1@gmail.com>
Cc: MTD list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

this is a simple patch series which makes UBIFS use a bit less
RAM. It gets rid of a debugging buffer of PEB size, which is in
most cases 128KiB, but can be larger as well.

When UBIFS is compiled with debugging support (most typical setup
I believe), UBIFS allocate a PEB size buffer for miscellaneous
purposes. But mostly it uses the buffer in various self-checks.

However, most people never enable the self-checks, so the RAM is
wasted. This patch series makes UBIFS always allocate the RAM when
it is needed, and free it afterwords.

Artem.
