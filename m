Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13LmO0-0000nA-00
	for mtd-list@infradead.org; Mon, 07 Aug 2000 13:52:08 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13LmNz-0000n4-00
	for mtd@infradead.org; Mon, 07 Aug 2000 13:52:07 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <398E8115.6FDC06BF@arcom.co.uk> 
References: <398E8115.6FDC06BF@arcom.co.uk> 
To: David Vrabel <dvrabel@arcom.co.uk>
Cc: mtd@infradead.org
Subject: Re: CFI chip detection 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 07 Aug 2000 13:51:51 +0100
Message-ID: <19240.965652711@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dvrabel@arcom.co.uk said:
>  Removing the `* cfi.interleave' caused additional chips to be
> detected.  Is this a quirk particular to this board or is the above
> code wrong?

> The SBC-MediaGX has:
>   1x 28F640 in x8 mode for the 8 Mbyte board
>   2x 28F640 in x8 mode for the 16 Mbyte board 

Odd. How exactly are the chips mapped in the 16 MB board? Are they 
interleaved, or just concurrently mapped?

Can you show the output when it fails to detect the second chip?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
