Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13k6s6-0007ou-00
	for mtd-list@infradead.org; Fri, 13 Oct 2000 16:35:46 +0100
Received: from [194.130.39.252] (helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13k6s5-0007on-00
	for mtd@infradead.org; Fri, 13 Oct 2000 16:35:45 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <000b01c03529$edc4c1c0$0800a8c0@win95.inteloop.se> 
References: <000b01c03529$edc4c1c0$0800a8c0@win95.inteloop.se> 
To: "Bjorn Eriksson" <mdeans@algonet.se>
Cc: mtd@infradead.org
Subject: Re: Three change suggestions to nand.c and friends. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 13 Oct 2000 16:35:35 +0100
Message-ID: <21265.971451335@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>




mdeans@algonet.se said:
>  1) Right now the code needs the moddi3() helper to perform it's
> checks. I suggest adding the requirement that {.oobblock} must be a
> power of two. 

That's sensible, but best just to require it. Don't piss about with config
options.

>  2) I've also rewritten nand.c changing all 'NAND_CTRL |= this->CLE;'
> -> NAND_SET_CMD et.al. Different hardware different support code. 

Check with sjhill but that sounds reasonable.

>  3) I moved nand_flash_ids[] to a new file, nand_ids.h since nand.h is
> included in several different places and not all .c-files that
> #include it needs nand_flash_ids[] (thus creating dups). 

OK.



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
