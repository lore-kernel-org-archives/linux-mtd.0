Received: from fmr05.intel.com ([134.134.136.6] helo=hermes.jf.intel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cQRU-0001N7-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2002 14:01:36 +0100
Received: from talaria.jf.intel.com (talaria.jf.intel.com [10.7.209.7])
	by hermes.jf.intel.com (8.11.6/8.11.6/d: outer.mc,v 1.48 2002/05/24 00:39:04 root Exp $) with ESMTP id g77CxGo08527
	for <linux-mtd@lists.infradead.org>; Wed, 7 Aug 2002 12:59:16 GMT
Received: from pdsmsxvs01.pd.intel.com (pdsmsxvs01.pd.intel.com [172.16.12.122])
	by talaria.jf.intel.com (8.11.6/8.11.6/d: inner.mc,v 1.22 2002/05/24 00:38:22 root Exp $) with SMTP id g77CuuR26792
	for <linux-mtd@lists.infradead.org>; Wed, 7 Aug 2002 12:56:57 GMT
Message-ID: <957BD1C2BF3CD411B6C500A0C944CA2601499C3B@pdsmsx32.pd.intel.com>
From: "Yuan, Cain" <cain.yuan@intel.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: RE: JFFS2 peoblems with K3 strata flash on Dalhart 
Date: Wed, 7 Aug 2002 20:59:23 +0800 
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

cain.yuan@intel.com said:
> 	According to your email  I  rebuild a JFFS2 image with the   block
> size 0x10000,  same as the datasheet saids. but the problem still
> exist.  First bootup will success without any error message. but when
> I reset the board and boot it again, many errors occurs.

Looks like you should be using 0x20000. 0x10000 is fine but triggers 
harmless messages about 'Empty block at 0x.... '. I think you were using 
0x40000 before which would have caused problems.
~~~~~~~~~~  yes, I am using 0x40000 before.


The other problem still remains, and isn't related, though...

> Write of 68 bytes at 0x0035e908 failed. returned 0, retlen 0
> Not marking the space at 0x0035e908 as dirty because the flash driver
returned retlen zero

The hardware driver seems broken -- it's returning success but not actually 
reporting that it's written any data. What driver, what version?

---  Since using CFI  with Ks flash, I think  it is CFI driver and
cfi_cmdset_001.c,  the  code   reside in  linux2.4.18-rmk6-pxa2.
      Should I download  newest   code from CVS server and merge them into
the   kernel src tree?


Thanks!!



--
dwmw2
