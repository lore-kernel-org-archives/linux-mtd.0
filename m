Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13WH4U-0000Hc-00
	for mtd-list@infradead.org; Tue, 05 Sep 2000 12:39:22 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13WH4Q-0000HW-00
	for mtd@infradead.org; Tue, 05 Sep 2000 12:39:19 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1000904191526.ZM12687@bristol.st.com> 
References: <1000904191526.ZM12687@bristol.st.com> 
To: Stuart Menefy <Stuart.Menefy@st.com>
Cc: mtd@infradead.org
Subject: Re: JEDEC support 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 05 Sep 2000 08:38:14 +0100
Message-ID: <5095.968139494@passion.cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Stuart.Menefy@st.com said:
>  I'm new to MTD, and unfortunately to get it running on my hardware
> I'm going to need the JEDEC support. I see the code has atrophied a
> little, so before I embark on trying to resurrect it, I was just
> wondering if anyone else had done this work? Alternatively any hints
> on how best to do it would be welcome.

It shouldn't be _too_ much out of date. It just needs you to make it take 
the 'bank_size' parameter as an argument to the probe function rather than 
storing it in the map_info structure.


>  Longer term, I also need to support Intel 28F016 (which is not JEDEC
> or CFI compatible). Anybody else implemented support for these? 

The (very) old doc1000 driver does it, I think. Can you probe for these 
chips?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
