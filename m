Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cRfZ-0001gL-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2002 15:20:13 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <957BD1C2BF3CD411B6C500A0C944CA2601499C3B@pdsmsx32.pd.intel.com> 
References: <957BD1C2BF3CD411B6C500A0C944CA2601499C3B@pdsmsx32.pd.intel.com> 
To: "Yuan, Cain" <cain.yuan@intel.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 peoblems with K3 strata flash on Dalhart 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 07 Aug 2002 15:20:10 +0100
Message-ID: <24862.1028730010@redhat.com>
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

--
dwmw2
