Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14TMJt-0004AL-00
	for mtd-list@infradead.org; Thu, 15 Feb 2001 11:11:29 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14TMJr-0004AD-00
	for mtd@infradead.org; Thu, 15 Feb 2001 11:11:27 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E6FE4E054F02D511818E00025558B61D429E20@cluster01.axis.se> 
References: <E6FE4E054F02D511818E00025558B61D429E20@cluster01.axis.se> 
To: Jonas Holmberg <jonas.holmberg@axis.com>
Cc: mtd@infradead.org
Subject: Re: Problems with cfi_cmdset_0002.c 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 15 Feb 2001 11:10:47 +0000
Message-ID: <30024.982235447@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


jonas.holmberg@axis.com said:
>  I cannot find any info on relationship between CFI version numbers
> and bootloc. I looked through the CFI 1.0 and 1.1 spec, but found
> nothing. Does anybody know? 

Only AMD. My datasheet for the AM29LV320D says the vendor-specific extended
query table version is 1.1 and includes bootloc (AMD pub #23579 Rev A, p23).
If the datasheets for other chips say v1.0 and omit bootloc, then that's
good enough, isn't it?

> Otherwise my suggestion is still "if (!bootloc)" until proven wrong. I
> think it's safer than "cfi_version < 1.1". What do you think?

That means you're depending on the contents of a byte which is not defined. 
If it's off the end of the v1.0 table, it doesn't have to be zero in all 
cases. It's theoretically safer to look for the version number first, and 
only read bootloc if it's at least v1.1.

But I don't care enough to argue :) As long as it works, it's OK by me. 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
