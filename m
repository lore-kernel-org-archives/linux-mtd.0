Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QGvpY-0007B1-FE
	for linux-mtd@lists.infradead.org; Mon, 02 May 2011 16:18:41 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p42GIb6t008162
	for <linux-mtd@lists.infradead.org>; Mon, 2 May 2011 19:18:37 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/2] UBIFS: fix recovery mounting
Date: Mon,  2 May 2011 19:22:18 +0300
Message-Id: <1304353340-2054-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Hi,

I've sent these patches here already, but now I've re-written the commit
message, tested them, see that recovery does not fail anymore, and I am
going to merge them upstream and to the -stable trees.

Artem.
