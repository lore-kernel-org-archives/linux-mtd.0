Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14GTzm-0002EU-00
	for mtd-list@infradead.org; Wed, 10 Jan 2001 22:45:30 +0000
Received: from adsl-63-192-223-74.dsl.snfc21.pacbell.net ([63.192.223.74] helo=gateway.berkeley.innomedia.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14GTzl-0002EO-00
	for mtd@infradead.org; Wed, 10 Jan 2001 22:45:29 +0000
Received: from berkeley.innomedia.com (imap.berkeley.innomedia.com [192.168.1.5])
	by gateway.berkeley.innomedia.com (8.9.1/8.9.1) with ESMTP id OAA02381
	for <mtd@infradead.org>; Wed, 10 Jan 2001 14:45:23 -0800
Received: (from mickey@localhost)
	by berkeley.innomedia.com (8.9.3/8.9.3) id OAA31035
	for mtd@infradead.org; Wed, 10 Jan 2001 14:45:23 -0800
From: Michael Thompson <mickey@berkeley.innomedia.com>
Message-Id: <200101102245.OAA31035@berkeley.innomedia.com>
Subject: Re: CFI problems with 32bit bus and 4 devices
To: mtd@infradead.org
Date: Wed, 10 Jan 2001 14:45:23 -0800 (PST)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dwmw2 wrote:
> 
> Technically, I think this setup would fit into the original model as
> buswidth == 8, and we should be using read64/write64 for accesses to the
> flash.
> 
> Just how crap is gcc's long long support these days? Could we use __u64
> for this?

Actually, I just got buswidth==8 working on a 32-bit ppc (my configuration
is 4 devices in 16 bit mode).  However, I found that I could use __u64 for
passing data around, but __u64 would not work when accessing the devices..
For this, I had to use a little trick: floating point loads and stores.
On the ppc, these are 64 bits wide.

I'd be willing to submit patches...  Shall I send them to you?

-Michael Thompson
mickey@berkeley.innomedia.com


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
