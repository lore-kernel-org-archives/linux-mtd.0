Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14SbSZ-0004Qr-00
	for mtd-list@infradead.org; Tue, 13 Feb 2001 09:09:19 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14SbSY-0004Qk-00
	for mtd@infradead.org; Tue, 13 Feb 2001 09:09:18 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3A886BED.9339AC4F@danielind.com> 
References: <3A886BED.9339AC4F@danielind.com> 
To: Vipin Malik <vmalik@danielind.com>
Cc: mtd <mtd@infradead.org>
Subject: Re: First cut at MTD/JFFS HOWTO 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 13 Feb 2001 09:09:18 +0000
Message-ID: <9849.982055358@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


vmalik@danielind.com said:
>  An example of multiple banks of flash chips being mapped into
> seperate /dev/mtdn devices can be found in the file mtd/kernel/
> oct5066_map.c

mtd/kernel/octagon-5066.c

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
