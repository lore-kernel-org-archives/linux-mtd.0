Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12Zb2Q-0000pQ-00
	for mtd-list@infradead.org; Mon, 27 Mar 2000 16:02:42 +0100
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12Zb2O-0000pK-00
	for mtd@infradead.org; Mon, 27 Mar 2000 16:02:40 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <14559.30337.712005.925126@4x1.lucid> 
References: <14559.30337.712005.925126@4x1.lucid>  <38DF5BE8.1700BEE8@zentropix.com> <1389.954162535@devel2.axiom.internal> 
To: Dvir Oren <dvir@hotpop.net>
Cc: mtd@infradead.org
Subject: Re: GRUB vs LILO 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 27 Mar 2000 16:02:24 +0100
Message-ID: <9987.954169344@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


dvir@hotpop.net said:
>  Does Grub already work? 

Not yet. It detects the DiskOnChip hardware, and scans it until it finds an 
NFTL Media Header. I haven't coded any more than that yet.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
