Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HCZdX-0005i5-TP
	for linux-mtd@lists.infradead.org; Thu, 01 Feb 2007 05:57:54 -0500
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexander Schmidt <alexs@linux.vnet.ibm.com>
Date: Thu, 01 Feb 2007 12:21:05 +0200
Message-Id: <20070201102105.15629.61206.sendpatchset@localhost.localdomain>
Subject: [RFC] [PATCH 0/1] [MTD] UBI: implement per-volume update
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Alexander,

I've implemented per-volume update based on your patch. Thank you for
your work - I have added a credit statement for you in the code.

In addition to what your patch does, this patch cleans-up and more
comments and makes them consistent to new update marker stuff. It
also removes the insane ivol_data from the VID header. It refines
semantics of 'corrupted' flag better.

Please, review it and try it.
