Received: from motgate4.mot.com ([144.189.100.102])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cRnJ-0001hB-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2002 15:28:14 +0100
Received: [from pobox3.mot.com (pobox3.mot.com [10.64.251.242]) by motgate4.mot.com (motgate4 2.1) with ESMTP id HAA13737 for <linux-mtd@lists.infradead.org>; Wed, 7 Aug 2002 07:28:11 -0700 (MST)]
Received: [from zch07exm05.corp.mot.com (ZCH07EXM05.corp.mot.com [200.3.1.211]) by pobox3.mot.com (MOT-pobox3 2.0) with ESMTP id HAA09291 for <linux-mtd@lists.infradead.org>; Wed, 7 Aug 2002 07:26:27 -0700 (MST)]
Message-ID: <89DEFCC5DB33D411A27F00508BCF8A8205EE3C7D@ZCH07EXM05.corp.mot.com>
From: Gu Susan-w15879 <w15879@motorola.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>,
        "Yuan, Cain"
	 <cain.yuan@intel.com>
Cc: linux-mtd@lists.infradead.org
Subject: RE: JFFS2 peoblems with K3 strata flash on Dalhart 
Date: Wed, 7 Aug 2002 22:28:08 +0800 
MIME-Version: 1.0
Content-Type: text/plain
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

Does K3 (and Dalhart) be configured as "burst" read mode when system is reset?

-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org]
Sent: Wednesday, August 07, 2002 10:20 PM
To: Yuan, Cain
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 peoblems with K3 strata flash on Dalhart 



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



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
