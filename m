Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14QYvY-0001hK-00
	for mtd-list@infradead.org; Wed, 07 Feb 2001 18:02:48 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14QYvX-0001hE-00
	for mtd@infradead.org; Wed, 07 Feb 2001 18:02:48 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <13874.010207@mik.ru> 
References: <13874.010207@mik.ru>  <8344.981531778@redhat.com> 
To: Ruslan Satlykov <ruslan@mik.ru>
Cc: mtd@infradead.org
Subject: Re: M-Sys's driver and public driver 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 07 Feb 2001 18:01:07 +0000
Message-ID: <18419.981568867@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


ruslan@mik.ru said:
> DiskOnChip 2000....

Ouch. No clue ATM what's caused that.

> And, can I ask the mailing list? I had downloaded
> the newest MTD distribution by the CVS, and - how I can add this set
> to the fresh copy of the linux kernel? Yes, I maked the patch, and
> what I must t do next? :)) Thank you, Ruslan

Drop the contents of the kernel/ directory over the top of your kernel's 
drivers/mtd directory. Likewise the include/linux/mtd directory.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
