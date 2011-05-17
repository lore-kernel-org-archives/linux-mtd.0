Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QMEnL-0004eP-Ad
	for linux-mtd@lists.infradead.org; Tue, 17 May 2011 07:34:19 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-da02.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4H7YFWp006045
	for <linux-mtd@lists.infradead.org>; Tue, 17 May 2011 10:34:16 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 00/11] fs-tests: integck: check files in power cut testing
Date: Tue, 17 May 2011 10:38:05 +0300
Message-Id: <1305617896-23711-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When we are in power cut emulation testing, check the contents of files and
directories which had been synchronized before the power cut - the contents
should be intact. This series implements this feature plus does few cleanups
and fixes which were spotted. As usually for the tests - the series is not
perfect form the patch split/quality POW.

Artem.
