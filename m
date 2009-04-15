Received: from sj-iport-2.cisco.com ([171.71.176.71])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LtyKb-0002pM-Ld
	for linux-mtd@lists.infradead.org; Wed, 15 Apr 2009 06:10:51 +0000
Received: from sj-core-1.cisco.com (sj-core-1.cisco.com [171.71.177.237])
	by sj-dkim-1.cisco.com (8.12.11/8.12.11) with ESMTP id n3F6Agv7022685
	for <linux-mtd@lists.infradead.org>; Tue, 14 Apr 2009 23:10:42 -0700
Received: from sj-webmail-9.cisco.com (sj-webmail-9.cisco.com [171.71.183.158])
	by sj-core-1.cisco.com (8.13.8/8.13.8) with ESMTP id n3F6AfMI014598
	for <linux-mtd@lists.infradead.org>; Wed, 15 Apr 2009 06:10:41 GMT
Received: from sj-webmail-9.cisco.com (localhost.localdomain [127.0.0.1])
	by sj-webmail-9.cisco.com (8.13.1/8.13.1) with ESMTP id n3F6AfV7011873
	for <linux-mtd@lists.infradead.org>; Tue, 14 Apr 2009 23:10:41 -0700
Received: from sj-webmail-9 (root@localhost)
	by sj-webmail-9.cisco.com (8.13.1/8.13.1/Submit) with ESMTP id
	n3F6Aft8011872
	for <linux-mtd@lists.infradead.org>; Tue, 14 Apr 2009 23:10:41 -0700
Date: Tue, 14 Apr 2009 23:10:40 -0700
From: Subodh Nijsure <sunijsur@cisco.com>
To: <linux-mtd@lists.infradead.org>
Message-ID: <000001c9bd90$e726cdb0$0470150a@cisco.com>
Subject: Run UBIFS on top of IDE mode NAND disk?
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
 
I have board with 4GB NAND memory chip, it is configured to operate in IDE
mode. And currently I am creating ext3 file-system on it. 
This chip also have on-board controller that does wear-levelling, ECC so the
quesitons are:
 
Can I (Should I) run UBIFS on of it and gain more of wear-levelling or its
not worth it? 
 
/Subodh Nijsure
(Standard Disclaimers Apply)
