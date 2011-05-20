Received: from ra.se.axis.com ([195.60.68.13])
	by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QNOMV-0005a7-Uk
	for linux-mtd@lists.infradead.org; Fri, 20 May 2011 11:59:24 +0000
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id 2611311F97
	for <linux-mtd@lists.infradead.org>;
	Fri, 20 May 2011 13:59:05 +0200 (CEST)
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DK+IxsvaF-zB for <linux-mtd@lists.infradead.org>;
	Fri, 20 May 2011 13:59:04 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by ra.se.axis.com (Postfix) with ESMTP id A367C11F99
	for <linux-mtd@lists.infradead.org>;
	Fri, 20 May 2011 13:59:04 +0200 (CEST)
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.88.7.1])
	by thoth.se.axis.com (Postfix) with ESMTP id 992333414C
	for <linux-mtd@lists.infradead.org>;
	Fri, 20 May 2011 13:59:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lnxricardw.se.axis.com (8.14.3/8.14.3/Debian-5+lenny1) with ESMTP id
	p4KBx4of031150
	for <linux-mtd@lists.infradead.org>; Fri, 20 May 2011 13:59:04 +0200
Date: Fri, 20 May 2011 13:59:04 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: power cut resiliency - ubifs vs. jffs2
Message-ID: <Pine.LNX.4.64.1105201357010.15966@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I'm trying to get some grip on how jffs2 fares in comparison with ubifs=20
when it comes to managing unexpected power cuts when the system is=20
operating. What I've found in the UBIFS FAQ is encouraging, but I was=20
wondering if anyone has any practical experience comparing the two in a=20
real system?

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
