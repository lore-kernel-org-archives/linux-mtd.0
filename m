Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13958x-0003Rj-00
	for mtd-list@infradead.org; Mon, 03 Jul 2000 13:16:07 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13958v-0003Rd-00
	for mtd@infradead.org; Mon, 03 Jul 2000 13:16:06 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <s9609fdf.057@mail.pel.dk> 
References: <s9609fdf.057@mail.pel.dk> 
To: "Arnold Christensen" <AKC@pel.dk>
Cc: jffs-dev@axis.com, mtd@infradead.org
Subject: Re: Using MTD + cfi_probe with RPXLite ? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 03 Jul 2000 13:19:43 +0100
Message-ID: <26501.962626783@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


AKC@pel.dk said:
>  Has anyone tried using MTD+jffs on the RPXLite?
> cfi_probe can't find anything. I have tried running though the right
> sequence using the RPXLite software, but no success.. 

Did you get a map driver to ioremap() the flash correctly and provide 
access to it?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
