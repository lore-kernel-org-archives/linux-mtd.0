Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14IDVW-0002eZ-00
	for mtd-list@infradead.org; Mon, 15 Jan 2001 17:33:26 +0000
Date: Mon, 15 Jan 2001 20:04:03 +0100 (CET)
From: Bjorn Wesen <bjorn.wesen@axis.com>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org, ahennessy@mvista.com
Subject: Re: mtdpart.c 
In-Reply-To: <2692.979573697@redhat.com>
Message-ID: <Pine.LNX.4.21.0101152003060.31216-100000@godzilla.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Mon, 15 Jan 2001, David Woodhouse wrote:
> The changes over the weekend to fix cfi_read_query() broke it. I've cleaned 
> them all up and removed the extra argument from cfi_read_query, because 
> it's pointless now it's not doing any scaling of its own.
> 
> It should work for all types of device now.

Yup! Thanks.

Axis flash mapping: 200000 at 50000000
Axis flash: Found 1 x16 CFI device at 0x0 in 16 bit mode
 Amd/Fujitsu Extended Query Table v1.0 at 0x0040
number of CFI chips: 1
 Using default partition table
mtd: Giving out device 0 to boot firmware
mtd: Giving out device 1 to kernel
mtd: Giving out device 2 to filesystem

Now on to seeing if JFFS works on it :)

/BW




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
