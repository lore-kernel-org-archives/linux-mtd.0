Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14hVfm-0001Tk-00
	for mtd-list@infradead.org; Mon, 26 Mar 2001 13:00:34 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14hVfl-0001Te-00
	for mtd@infradead.org; Mon, 26 Mar 2001 13:00:33 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <NEBBKJHOALKOLCFPGELEMEFGCIAA.ajlennon@arcom.co.uk> 
References: <NEBBKJHOALKOLCFPGELEMEFGCIAA.ajlennon@arcom.co.uk> 
To: "Alex Lennon" <ajlennon@arcom.co.uk>
Cc: mtd@infradead.org
Subject: Re: CFI Devices in x8 mode 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 26 Mar 2001 13:00:24 +0100
Message-ID: <32701.985608024@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


ajlennon@arcom.co.uk said:
>  Running cfi_probe() from the mediagx driver now results in no CFI
> chip being found. A brief look through the detection code shows that
> we are writing 0x98 (Read Query Command) to offset 0x55. Next we read
> back and expect to see 'Q', 'R' 'Y' starting at 0x10 (given a device
> type of x8 (equ 1) and an interleave of 1).

The 8-bit buswidth probe doesn't attempt to probe for a device type X16 any 
more. It should. Someone gave me a patch for that a few days ago, I think - 
but I can't find it. I've just committed what I think is the correct fix to 
CVS.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
