Received: from jffdns01.or.intel.com ([134.134.248.3] helo=ganymede.or.intel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17XGZs-0007PF-00
	for <linux-mtd@lists.infradead.org>; Wed, 24 Jul 2002 08:28:56 +0100
Received: from pdsmsxvs01.pd.intel.com (pdsmsxvs01.pd.intel.com [172.16.12.122])
	by ganymede.or.intel.com (8.11.6/8.11.6/d: solo.mc,v 1.42 2002/05/23 22:21:11 root Exp $) with SMTP id g6O7SNr08414
	for <linux-mtd@lists.infradead.org>; Wed, 24 Jul 2002 07:28:24 GMT
Received: from pdsmsx17.pd.intel.com ([172.16.12.121])
 by pdsmsxvs01.pd.intel.com (NAVGW 2.5.2.11) with SMTP id M2002072415282232002
 for <linux-mtd@lists.infradead.org>; Wed, 24 Jul 2002 15:28:22 +0800
Message-ID: <957BD1C2BF3CD411B6C500A0C944CA2601499C18@pdsmsx32.pd.intel.com>
From: "Yuan, Cain" <cain.yuan@intel.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: about intel K3 strata falsh.
Date: Wed, 24 Jul 2002 15:26:48 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
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

Hi all,
	in drivers/mtd there is no corresponding code for Intel starta
flash. As intel's datasheet said, strata K3/K18 flash has an  write buffer
and Sync mode that can improve 
the performance, I decide to drive it. So  should I write an "driver module"
for it?  Any ideas?  TIA!!
