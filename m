Received: from fmr06.intel.com ([134.134.136.7] helo=caduceus.jf.intel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cScS-0001sF-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2002 16:21:04 +0100
Received: from talaria.jf.intel.com (talaria.jf.intel.com [10.7.209.7])
	by caduceus.jf.intel.com (8.11.6/8.11.6/d: outer.mc,v 1.48 2002/05/24 00:39:04 root Exp $) with ESMTP id g77FIq723707
	for <linux-mtd@lists.infradead.org>; Wed, 7 Aug 2002 15:18:52 GMT
Received: from pdsmsxvs01.pd.intel.com (pdsmsxvs01.pd.intel.com [172.16.12.122])
	by talaria.jf.intel.com (8.11.6/8.11.6/d: inner.mc,v 1.22 2002/05/24 00:38:22 root Exp $) with SMTP id g77FGPf18933
	for <linux-mtd@lists.infradead.org>; Wed, 7 Aug 2002 15:16:25 GMT
Message-ID: <957BD1C2BF3CD411B6C500A0C944CA2601499C3D@pdsmsx32.pd.intel.com>
From: "Yuan, Cain" <cain.yuan@intel.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: RE: JFFS2 peoblems with K3 strata flash on Dalhart 
Date: Wed, 7 Aug 2002 23:18:53 +0800 
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

Dear David,
Please notice the fact:  
   at the first,  I burn JFFS2  into K3  flash, then load zImage It boot up
all ok, and   JFFS2 file system are all OK.
But after reset   and load zImage again  I can't create/del  files on JFFS2
file system.
SO I think   there is no much concern with the cfi_xxx_write function, maybe
the status is not  correctly set.
As to buffer writes, I  see  some  lines in  cfi_cmdset_001.c:

// debugging, turns off buffer write mode  #define      FORCE_WORD_WRITE
. . . . . . 
    mtd->read = cfi_intelext_read;
#ifndef FORCE_WORD_WRITE
    if ( cfi->cfiq->BufWriteTimeoutTyp ) {
        printk("Using buffer write method\n" );
        mtd->write = cfi_intelext_write_buffers;
    } else {
#else
    {
#endif
        printk("Using word write method\n" );
        mtd->write = cfi_intelext_write_words;
    }
 . . . . 

So I added #define      FORCE_WORD_WRITE     at hte begining of the file, so
I think   there is nothing concerned with   buffer write functions.
 



cain.yuan@intel.com said:
>  ---  Since using CFI  with Ks flash, I think  it is CFI driver and
> cfi_cmdset_001.c,  the  code   reside in  linux2.4.18-rmk6-pxa2.
>       Should I download  newest   code from CVS server and merge them
> into the   kernel src tree? 

Er, I don't think there have been significant changes since then. Updating 
to the latest code certainly can't hurt though.

The problem is that the chip write() call is returning zero (i.e. no error) 
but is setting the number of written bytes to zero. That doesn't make sense 
-- if it didn't write all the bytes we asked it to, then there must have 
been an error.

This chip supports buffer writes, doesn't it? Can you add some extra 
'printk' calls in cfi_intelext_write_buffers() to try to show what's 
happening to 'retlen' and when it returns.
