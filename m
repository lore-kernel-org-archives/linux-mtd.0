Received: from fmr06.intel.com ([134.134.136.7] helo=caduceus.jf.intel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cSf8-0001tE-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2002 16:23:50 +0100
Received: from talaria.jf.intel.com (talaria.jf.intel.com [10.7.209.7])
	by caduceus.jf.intel.com (8.11.6/8.11.6/d: outer.mc,v 1.48 2002/05/24 00:39:04 root Exp $) with ESMTP id g77FLd724067
	for <linux-mtd@lists.infradead.org>; Wed, 7 Aug 2002 15:21:39 GMT
Received: from pdsmsxvs01.pd.intel.com (pdsmsxvs01.pd.intel.com [172.16.12.122])
	by talaria.jf.intel.com (8.11.6/8.11.6/d: inner.mc,v 1.22 2002/05/24 00:38:22 root Exp $) with SMTP id g77FJBf19356
	for <linux-mtd@lists.infradead.org>; Wed, 7 Aug 2002 15:19:11 GMT
Message-ID: <957BD1C2BF3CD411B6C500A0C944CA2601499C3E@pdsmsx32.pd.intel.com>
From: "Yuan, Cain" <cain.yuan@intel.com>
To: "'Gu Susan-w15879'" <w15879@motorola.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: RE: JFFS2 peoblems with K3 strata flash on Dalhart 
Date: Wed, 7 Aug 2002 23:21:40 +0800 
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

No,  but if we don't configure it as" burst" mode,  It will always fail with
write???
Thanks for your useful  information. 



-----Original Message-----
From: Gu Susan-w15879 [mailto:w15879@motorola.com]
To: 'David Woodhouse'; Yuan, Cain
Cc: linux-mtd@lists.infradead.org
Subject: RE: JFFS2 peoblems with K3 strata flash on Dalhart 


Does K3 (and Dalhart) be configured as "burst" read mode when system is
reset?
