Received: from jffdns01.or.intel.com ([134.134.248.3] helo=ganymede.or.intel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZhkE-0005Zi-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 01:53:43 +0100
Received: from pdsmsxvs01.pd.intel.com (pdsmsxvs01.pd.intel.com [172.16.12.122])
	by ganymede.or.intel.com (8.11.6/8.11.6/d: solo.mc,v 1.42 2002/05/23 22:21:11 root Exp $) with SMTP id g6V0rAk26017
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 00:53:11 GMT
Received: from pdsmsx17.pd.intel.com ([172.16.12.121])
 by pdsmsxvs01.pd.intel.com (NAVGW 2.5.2.11) with SMTP id M2002073108531000598
 for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 08:53:10 +0800
Message-ID: <957BD1C2BF3CD411B6C500A0C944CA2601499C2C@pdsmsx32.pd.intel.com>
From: "Yuan, Cain" <cain.yuan@intel.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: RE: 64-bit support for Intel Strata Flash 
Date: Wed, 31 Jul 2002 08:51:35 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
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

Hello all,
	My question is, according to dwmw2's mail, where can I download the
code support Strata flash's Sync read mode and make use  of write buffer to
get better performance ?  TIA!!


cain.yuan@intel.com said:
> Does the code support Sync. read mode of Strata flash and  make use of
> write-buffer to get better performance?  TIA!

The write-buffer is used. Synchronous read mode has been used but no code 
was merged -- ask on the list about that.
--
dwmw2
