Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14rd9M-0003SD-00
	for mtd-list@infradead.org; Mon, 23 Apr 2001 11:00:56 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14rd9L-0003S6-00
	for mtd@infradead.org; Mon, 23 Apr 2001 11:00:55 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <006701c0cbd3$85868ee0$4d02010a@lrpeople.com> 
References: <006701c0cbd3$85868ee0$4d02010a@lrpeople.com> 
To: "Alexander Melichenko" <AlexanderM@lrpeople.com>
Cc: mtd@infradead.org
Subject: Re: Fw: Elan SC520 - problem with MTD 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 23 Apr 2001 11:00:32 +0100
Message-ID: <10854.988020032@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


AlexanderM@lrpeople.com said:
>  Now I must place a kernel to a flash and booting from it. What steps
> should be undertaken to reach that result? 

You need a bootloader which is capable of doing so. RedBoot will probably 
do it - I'm not sure what others are using.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
