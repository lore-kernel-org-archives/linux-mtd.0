Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13CHlF-00078v-00
	for mtd-list@infradead.org; Wed, 12 Jul 2000 09:20:53 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13CHlE-00078p-00
	for mtd@infradead.org; Wed, 12 Jul 2000 09:20:52 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <396BC59F.47F1B14F@evoserve.com> 
References: <396BC59F.47F1B14F@evoserve.com>  <20000710221950.8117.qmail@web5304.mail.yahoo.com> 
To: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>
Cc: mtd@infradead.org
Subject: Re: mtd devices & jffs 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 12 Jul 2000 09:20:50 +0100
Message-ID: <21762.963390050@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


rogelio@evoserve.com said:
> The same happens to me and im using a DOC2000. The second time i mount
> jffs fails to build the tree. 

Doc2000 doesn't currently support writes which aren't 512 bytes long, which 
isn't particularly useful for JFFS. S'fairly trivial to fix. Just that 
nobody's done it yet. You don't need to know anything about the DiskOnChip 
to do it - just read the datasheet for the flash chips it's using.



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
