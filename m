Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13lwLq-0001pZ-00
	for mtd-list@infradead.org; Wed, 18 Oct 2000 17:46:02 +0100
Received: from [194.130.39.252] (helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13lwLp-0001pT-00
	for mtd@infradead.org; Wed, 18 Oct 2000 17:46:01 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20001004042629.A2152@napri.sk> 
References: <20001004042629.A2152@napri.sk>  <E13eFI9-0003GD-00@pearl.tao.co.uk> <6998.970054171@passion.cygnus.co.uk> 
To: Peter Kundrat <kundrat@pkx.sk>
Cc: mtd@infradead.org
Subject: Re: small nftl fix 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 18 Oct 2000 17:45:55 +0100
Message-ID: <26998.971887555@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


kundrat@pkx.sk said:
> When writing to an empty fs on nftl, I always got garbled partition
> table. Looking at the nftl.c, there seems to be a problem with
> overwriting media header (which seems to be at the FirstPhysicalEUN).
> 

Sorry for the delayed response. Your patch looks good. However, I believe 
the spec allows the header units to be in places other than the first two 
physical units of the NFTL, so it would be better to make sure we don't use 
(EUN == nftl->MediaUnit || EUN == nftl->SpareMediaUnit) rather than 
hardcoding that to not use (EUN < nftl->MediaHdr.FirstPhysicalEUN + 2)

In practice, I don't really expect that to happen, but we might as well be 
pedantic in our adherence to the NFTL spec. 

In the meantime, could anyone else who's seen NFTL corruption please try 
Peter's patch?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
