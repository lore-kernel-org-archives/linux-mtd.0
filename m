Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14ZoaV-0006i7-00
	for mtd-list@infradead.org; Mon, 05 Mar 2001 06:35:19 +0000
Received: from [212.87.56.100] (helo=mail.taytron.net)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14ZoaT-0006i1-00
	for mtd@infradead.org; Mon, 05 Mar 2001 06:35:17 +0000
Message-ID: <000f01c0a542$c91205c0$0d3318b5@jolt>
From: "Florian Schirmer / TayTron" <schirmer@taytron.net>
To: "Subodh Nijsure" <subodh@best.com>,
	<mtd@infradead.org>
References: <200103042109.NAA07230@shell9.ba.best.com>
Subject: Re: What should value of CONFIG_MTD_CFIB* be?
Date: Mon, 5 Mar 2001 08:05:25 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi ...

> What should my values be for above variables
> if my hardware is two Intel 28F160S3
> (sector size 64K) flash devices, configured to operate in
> 16-bit mode giving me 4Mb, 32-bit wide memory?
>
>
> This is how my MTD config looks like and cfi_probe is not able to
> detect these intel chips.

CFI probe needs CONFIG_MTD_CFI_INTELEXT=y to find the chips. I dont know
about the JEDEC code, wether it is working already or work in progress.
Maybe you want to disable CONFIG_MTD_CSTM_CFI_JEDEC and CONFIG_MTD_JEDEC.
You dont need it for CFI chips.

If it still doesn't work check out the latest code from cvs. (But there is a
small bug which prevents in cfi_cmdset_0001 from compiling - look at my next
message).

Hope that helps,
   Florian Schirmer



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
