Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13N3Ir-0005UN-00
	for mtd-list@infradead.org; Fri, 11 Aug 2000 02:08:05 +0100
Received: from [63.91.110.227] (helo=kona.xsilogy.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13N3Ip-0005UH-00
	for mtd@infradead.org; Fri, 11 Aug 2000 02:08:03 +0100
Message-ID: <007f01c00331$fb859390$6700010a@office.xsilogy.com>
From: "Jon Burford" <jburford@xsilogy.com>
To: <dwmw2@redhat.com>, "Mike Kilburn" <mkilburn@ftel.net>
Cc: <sigurdur@ifi.uio.no>, <mtd@infradead.org>
References: <200008102356.QAA02347@devel.ftel.com>
Subject: Re: Re[2]: Has MTD production quality support for DOC2000?
Date: Thu, 10 Aug 2000 18:17:56 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I use the M-Systems driver with an RT-Linux-pacthed box and my RT threads
execute just fine.  Since the driver runs in kernel space and since the
kernel is just another RT thread, I can run higher priority threads which
preempt the kernel and therefore the driver itself.  We found the interrupt
disable quite annoying and moved all our RT stuff to RT threads and have not
had a problem.

Regards,
Jon

----- Original Message -----
From: "Mike Kilburn" <mkilburn@ftel.net>
To: <dwmw2@redhat.com>
Cc: <sigurdur@ifi.uio.no>; <mtd@infradead.org>
Sent: Thursday, August 10, 2000 4:56 PM
Subject: Re[2]: Has MTD production quality support for DOC2000?


> David Woodhouse <dwmw2@redhat.com> wrote:
> >
> > Linking the M-Systems drivers into your kernel will place _you_ in
violation
> > of the GPL and you may be sued, so why not help out with the MTD
drivers?
> >
>
> Also, last I checked, the M-Systems driver disables interrupts for quite
> a long time while writing to the device. This makes it unusable in
> a real-time embedded system. Switch to a SanDisk if you can.
>
>
>
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
