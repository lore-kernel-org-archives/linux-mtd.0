Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Zoy5-0006oE-00
	for mtd-list@infradead.org; Mon, 05 Mar 2001 06:59:41 +0000
Message-ID: <005901c0a546$367c8d80$0d3318b5@jolt>
From: "Florian Schirmer / TayTron" <schirmer@taytron.net>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <mtd@infradead.org>
References: <Pine.LNX.4.30.0103031754080.7202-100000@imladris.demon.co.uk>
Subject: Re: AW: Some bugs
Date: Mon, 5 Mar 2001 08:30:08 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi..

> > So please can you commit the 3 solved issues to cvs?
>
> The first was already there. The above two just joined it. Please confirm
> that the writew change is working.

Looks very good. We've tried Intel F640, 2x Intel F320 (interleaved) and 2x
AMD (interleaved). Everything is fine now.

There are still some points on my list:

1. cfi_cmdset_0001 broken:

/* We have to assume that all the erase blocks are the same size. */
mtd->erasesize = ((cfi.cfiq->EraseRegionInfo[i] >> 8) & ~0xff) *
cfi->interleave;

should be

mtd->erasesize = ((cfi->cfiq->EraseRegionInfo[0] >> 8) & ~0xff) *
cfi->interleave;

(cfi-> and  [0])

2. physmap (?) broken:

The inter_module stuff thems to have a problem somewhere. The modules cant
be unloaded since the usagecount wont decrement correctly. Dont know wether
it's the fault of physmap or not.

Happing hacking!
   Florian Schirmer



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
