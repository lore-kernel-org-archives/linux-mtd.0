Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HFB3f-0002mc-MV
	for linux-mtd@lists.infradead.org; Thu, 08 Feb 2007 10:19:38 -0500
Received: from esebh108.NOE.Nokia.com (esebh108.ntc.nokia.com [172.21.143.145])
	by mgw-ext13.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l18FGo0X000997
	for <linux-mtd@lists.infradead.org>; Thu, 8 Feb 2007 17:17:08 +0200
Message-ID: <45CB3F4C.8080001@nokia.com>
Date: Thu, 08 Feb 2007 17:18:36 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: OneNAND test modules
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There are 4 test modules in users/ahunter/nand-tests.git
that I have found useful for testing OneNAND.  They are:

oobtest		Test reading and writing oob with auto-placement
pagetest	Test reading and writing some pages
subpagetest	Test reading and writing some sub-pages
torture		Artem's torture test (here at Artem's request)
