Received: from fmr06.intel.com ([134.134.136.7] helo=caduceus.jf.intel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cEaU-0007xd-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2002 01:22:06 +0100
Received: from petasus.jf.intel.com (petasus.jf.intel.com [10.7.209.6])
	by caduceus.jf.intel.com (8.11.6/8.11.6/d: outer.mc,v 1.48 2002/05/24 00:39:04 root Exp $) with ESMTP id g770JsM01066
	for <linux-mtd@lists.infradead.org>; Wed, 7 Aug 2002 00:19:54 GMT
Received: from pdsmsxvs01.pd.intel.com (pdsmsxvs01.pd.intel.com [172.16.12.122])
	by petasus.jf.intel.com (8.11.6/8.11.6/d: inner.mc,v 1.22 2002/05/24 00:38:22 root Exp $) with SMTP id g770JD109993
	for <linux-mtd@lists.infradead.org>; Wed, 7 Aug 2002 00:19:13 GMT
Message-ID: <957BD1C2BF3CD411B6C500A0C944CA2601499C37@pdsmsx32.pd.intel.com>
From: "Yuan, Cain" <cain.yuan@intel.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: RE: JFFS2 peoblems with K3 strata flash on Dalhart 
Date: Wed, 7 Aug 2002 08:19:56 +0800 
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

Does  this concerned with the fails of JFFS2?  If is, why I can use JFFS2
system   just after burn JFFS2 fs image into  flash with the help of
redboot?


-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org]
To: Yuan, Cain
Cc: 'nico@cam.org'; linux-mtd@lists.infradead.org
Subject: Re: JFFS2 peoblems with K3 strata flash on Dalhart 



cain.yuan@intel.com said:
> 	I am now test JFFS2 file system on Dalhart with Redboot as
> boorloader, Linux version 2.4.18-rmk6-pxa2 and some patches for
> dalhart.

What erase size did you create your JFFS2 image with?

--
dwmw2
