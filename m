Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14fGiv-0004Fg-00
	for mtd-list@infradead.org; Tue, 20 Mar 2001 07:38:33 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14fGiu-0004Fa-00
	for mtd@infradead.org; Tue, 20 Mar 2001 07:38:32 +0000
Date: Tue, 20 Mar 2001 07:38:27 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Raymond Danks <ray@rbtech.org>
cc: <mtd@infradead.org>, 'Stephen Brasher' <sbrasher@cirilium.com>,
    "Brian Otteman (E-mail)" <brian@rbtech.org>
Subject: RE: MTD,JFFS on JEDEC devices with uClinux-2.0.38.1pre7
In-Reply-To: <000201c0b0eb$e5a9fda0$a34c57d8@rbtech.org>
Message-ID: <Pine.LNX.4.30.0103200734200.8401-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


On Mon, 19 Mar 2001, Raymond Danks wrote:

> I checked the spec for the part I am using and there is no mention of this
> being a CFI device.  I was unable to determine for sure, however that this
> device is not a CFI device or if it is NOT a CFI device, then can I still
> use MTD and JFFS on the device?

I don't think it is. Change the do_cfi_probe to do_jedec_probe in 
physmap.c and enable CONFIG_MTD_JEDEC.

I've Cc'd the MTD mailing list because people there are likely to correct
me if I'm wrong.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
