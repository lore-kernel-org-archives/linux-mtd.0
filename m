Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17PAon-00036K-00
	for <linux-mtd@lists.infradead.org>; Tue, 02 Jul 2002 00:42:53 +0100
Received: from zeus.mvista.com (av [127.0.0.1])
	by av.mvista.com (8.9.3/8.9.3) with ESMTP id QAA17598
	for <linux-mtd@lists.infradead.org>; Mon, 1 Jul 2002 16:42:52 -0700
Subject: Atmel 49BV1614A parts
From: Pete Popov <ppopov@mvista.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 01 Jul 2002 16:46:32 -0700
Message-Id: <1025567192.16123.78.camel@zeus.mvista.com>
Mime-Version: 1.0
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I'm having a problem with the above parts which I finally debugged to a
different sector scheme from the older 49BV1614 parts.  The 1614 has 8
8KB sectors, 2 32KB sectors, and 30 64B sectors.  The newer 1614A has 8
8KB sectors, and 31 64KB sectors.  But both parts have the same
manufacturer and device IDs so I don't see any way of differentiating
the two.  Any ideas on how to best handle this?   There is some sort of
"additional" id in the newer part, but the current mtd layer has no
support for this.

I'm not on the list so a direct reply would be appreciated.

Thanks a lot.

Pete
