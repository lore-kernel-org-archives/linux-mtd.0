Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14s45K-0008UO-00
	for mtd-list@infradead.org; Tue, 24 Apr 2001 15:46:34 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14s45J-0008UI-00
	for mtd@infradead.org; Tue, 24 Apr 2001 15:46:34 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010424113037.FQCK11909.t21mta02-app.talk21.com@t21mtaV-lrs> 
References: <20010424113037.FQCK11909.t21mta02-app.talk21.com@t21mtaV-lrs> 
To: simon.munton@talk21.com
Cc: mtd@infradead.org
Subject: Re: (No Subject) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 24 Apr 2001 15:46:26 +0100
Message-ID: <3311.988123586@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


simon.munton@talk21.com said:
> Back in January, I posted a similar question about the unlock bypass
> mode.

> Unfortunately, I've been busy on other things since then, so I've not
> been able to follow up on it.

Yes, it's currently broken. It should probably be disabled unless someone 
cares sufficiently to fix it, and can show that it's actually an advantage to 
disable interrupts in return for the (probably minimal) speedup.



simon.munton@talk21.com said:
>  I've also noticed that CFI_DEVICETYPE_X8 is used in several places,
> where it seems that cfi->device_type should be used instead (one
> instance is in issuing the enter bypass mode commands).

The unlock addresses are set with that fact taken into consideration. The 
reason is that some devices with DEVICETYPE_16 need unlock addresses which 
are odd, for which the 'multiply by two' doesn't help us much :)


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
