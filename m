Received: from fmr01.intel.com ([192.55.52.18] helo=hermes.fm.intel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16CV3r-0005KL-00
	for <linux-mtd@lists.infradead.org>; Sat, 08 Dec 2001 00:09:47 +0000
Received: from petasus.fm.intel.com (petasus.fm.intel.com [10.1.192.37])
	by hermes.fm.intel.com (8.11.6/8.11.6/d: outer.mc,v 1.25 2001/11/20 18:48:29 root Exp $) with ESMTP id fB80KYa23002
	for <linux-mtd@lists.infradead.org>; Sat, 8 Dec 2001 00:20:34 GMT
Received: from fmsmsxvs040.fm.intel.com (fmsmsxv040-1.fm.intel.com [132.233.48.108])
	by petasus.fm.intel.com (8.11.6/8.11.6/d: inner.mc,v 1.11 2001/11/09 23:28:01 root Exp $) with SMTP id fB80Ka523453
	for <linux-mtd@lists.infradead.org>; Sat, 8 Dec 2001 00:20:36 GMT
Received: from FMSMSX018.fm.intel.com ([132.233.42.197])
 by fmsmsxvs040.fm.intel.com (NAVGW 2.5.1.16) with SMTP id M2001120716195826785
 for <linux-mtd@lists.infradead.org>; Fri, 07 Dec 2001 16:19:58 -0800
Message-ID: <D9223EB959A5D511A98F00508B68C20C1F9639@ORSMSX108>
From: "Carlson, Kristen" <kristen.carlson@intel.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: caching questions with jffs2
Date: Fri, 7 Dec 2001 16:20:17 -0800 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hi,
Can someone describe to me the algorithm used for freeing memory that has
been cached due to file activity in jffs2?  Is this done as part of the
garbage collector?  How long does the cached memory stay around?  Is this
tunable?
Thanks,
Kristen Carlson
