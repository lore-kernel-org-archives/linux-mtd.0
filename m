Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14sLRx-0007VU-00
	for mtd-list@infradead.org; Wed, 25 Apr 2001 10:19:05 +0100
Message-ID: <3AE69E21.CDCF90A1@crossnet.co.jp>
Date: Wed, 25 Apr 2001 18:51:29 +0900
From: Masami Komiya <mkomiya@crossnet.co.jp>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>, mtd@infradead.org
Subject: Re: (No Subject)
References: <20010424113037.FQCK11909.t21mta02-app.talk21.com@t21mtaV-lrs> <3311.988123586@redhat.com>
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
> 
> simon.munton@talk21.com said:
> >  I've also noticed that CFI_DEVICETYPE_X8 is used in several places,
> > where it seems that cfi->device_type should be used instead (one
> > instance is in issuing the enter bypass mode commands).
> 
> The unlock addresses are set with that fact taken into consideration. The
> reason is that some devices with DEVICETYPE_16 need unlock addresses which
> are odd, for which the 'multiply by two' doesn't help us much :)

Our hardware has one flash memory in 16bit mode. CPU is SH4 of Hitachi.
That is 32bit type CPU and can connect the device in 16bit mode.
In this case, interleave is 1 and bus width is 2.

Before using  cfi->device_type instead of CFI_DEVICETYPE_X8
MTD driver cannot calculate the address of the CFI command correctly.

Masami Komiya


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
