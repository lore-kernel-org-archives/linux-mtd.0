Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14MsS4-0007rS-00
	for mtd-list@infradead.org; Sun, 28 Jan 2001 14:05:08 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14MsS3-0007rM-00
	for mtd@infradead.org; Sun, 28 Jan 2001 14:05:07 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <01012616124100.01883@tim.tpi.com> 
References: <01012616124100.01883@tim.tpi.com> 
To: timg@tpi.com
Cc: mtd@infradead.org
Subject: Re: What flash file system on uCLinux 2.0.38? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 28 Jan 2001 14:05:01 +0000
Message-ID: <8422.980690701@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


timg@tpi.com said:
>  Does anyone have a suggestion for a flash filesystem that I might
> use? Using a regular file system on the flash translation layer is not
> an option since this is not a PCMCIA platform (patent issues I guess).
> 

Correct, unless you live (and only want to ship your product) in the Free 
World.

It shouldn't be too difficult to merge the latest JFFS code back into 2.0. 
You're welcome to provide 'inode-v20.c' if you want, and I'll even try not 
to break it later :)

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
