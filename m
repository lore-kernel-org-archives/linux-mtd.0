Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14ScLj-0004oT-00
	for mtd-list@infradead.org; Tue, 13 Feb 2001 10:06:19 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14ScLi-0004oL-00
	for mtd@infradead.org; Tue, 13 Feb 2001 10:06:18 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <003f01c095a0$08f12020$0a070d0a@axis.se> 
References: <003f01c095a0$08f12020$0a070d0a@axis.se>  <3A886BED.9339AC4F@danielind.com> <10792.982055747@redhat.com> 
To: "Johan Adolfsson" <johan.adolfsson@axis.com>
Cc: "mtd" <mtd@infradead.org>
Subject: Re: MTD device minor numbers, documentation wrong? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 13 Feb 2001 10:05:45 +0000
Message-ID: <17771.982058745@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


johan.adolfsson@axis.com said:
> The 2.4.0 Documentation/devices.txt says that even MTD minor numbers
> are readonly, but that doesn't seem to be correct when trying things
> in real life. Is the documentation wrong, or do I have the wrong
> version of it? Or are we doing something wrong when registering
> partitions? 

It's correct for the character device, because that's what I inherited from 
the original allocation in devices.txt. Not for the block devices. See 
util/MAKEDEV in my CVS tree. That tends to agree with the code, regardless 
of the state of the documentation - unless some helpful person has 'fixed' 
it to match the docs :)

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
