Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QBiCH-0008Qy-JJ
	for linux-mtd@lists.infradead.org; Mon, 18 Apr 2011 06:44:37 +0000
Received: from localhost (localhost [127.0.0.1])
	by anubis.se.axis.com (Postfix) with ESMTP id 3E4E719D09
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Apr 2011 08:44:30 +0200 (CEST)
Received: from anubis.se.axis.com ([127.0.0.1])
	by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5VAK9DOA8ffY for <linux-mtd@lists.infradead.org>;
	Mon, 18 Apr 2011 08:44:25 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by anubis.se.axis.com (Postfix) with ESMTP id 71B8019CF7
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Apr 2011 08:44:25 +0200 (CEST)
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.88.7.1])
	by thoth.se.axis.com (Postfix) with ESMTP id 70091341B5
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Apr 2011 08:44:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lnxricardw.se.axis.com (8.14.3/8.14.3/Debian-5+lenny1) with ESMTP id
	p3I6iPTD019655
	for <linux-mtd@lists.infradead.org>; Mon, 18 Apr 2011 08:44:25 +0200
Date: Mon, 18 Apr 2011 08:44:25 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: UBI partitioning in embedded device?
Message-ID: <Pine.LNX.4.64.1104180839510.30071@lnxricardw.se.axis.com>
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


Are there any opinions here on the partitioning of a flash memory in an=20
embedded device when using UBI?

Principially, one could let UBI manage the whole flash as one mtd=20
partition, except possibly some boot area due to restriction in the boot=20
ROM of the system in question. But is it wise to do so, assuming for=20
instance there is data in part of the flash that you really want to avoid=
=20
loosing, such as calibration data? Of course, theoretically, once the=20
kernel has access to one part of the flash it could clobber anything,=20
still, the mtd code has been proven for years whereas UBI is relatively=20
young, so one idea would be to partition that flash into several mtd=20
partitions (e.g. boot, running system, and calibration data), and let UBI=
=20
handle these separately. That could minimize the risk of UBI clobbering=20
the calibration data when operating on the running system, for instance.

Any thoughts?

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
