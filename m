Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14hoXP-00089E-00
	for mtd-list@infradead.org; Tue, 27 Mar 2001 09:09:11 +0100
From: "Alex Lennon" <ajlennon@arcom.co.uk>
To: <dwmw2@infradead.org>,
	"Eric" <ebrower@usa.net>
Cc: <mtd@infradead.org>
Subject: RE: [RE: CFI Devices in x8 mode ]
Date: Tue, 27 Mar 2001 09:08:30 +0100
Message-ID: <NEBBKJHOALKOLCFPGELEAEGGCIAA.ajlennon@arcom.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.30.0103262238030.27429-100000@imladris.demon.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Indeed it does thankyou - the system boots fine now and the three partitions
are
handed out as expected.

The issue now is that as soon as I access an MTD device (say 'cat
/dev/mtd0') my
system locks. I have an access LED on the flash which isn't pulsing so I
don't
think I'm getting as far as actually talking to the flash over the ISA bus.

At the moment I can see I'm OK up to MTD_READ - cfi_intelext_read() ? - and
I'll
continue tracing through.

Regards,

	Alex

-----Original Message-----
From: dwmw2@infradead.org [mailto:dwmw2@infradead.org]
Sent: 26 March 2001 10:39 PM
To: Eric
Cc: Alex Lennon; mtd@infradead.org
Subject: Re: [RE: CFI Devices in x8 mode ]


On 26 Mar 2001, Eric wrote:

> You may be referring to my proposed patch:

I was. Quite why I couldn't find it upon grepping my mail folders, I don't
know. Alex has confirmed that it cures his problem - thanks.

--
dwmw2







To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
