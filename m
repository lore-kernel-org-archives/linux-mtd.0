Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13SFSa-00011k-00
	for mtd-list@infradead.org; Fri, 25 Aug 2000 10:07:36 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13SFSZ-00011e-00
	for mtd@infradead.org; Fri, 25 Aug 2000 10:07:35 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <39A627FB.85689FFE@arcom.co.uk> 
References: <39A627FB.85689FFE@arcom.co.uk> 
To: David Vrabel <dvrabel@arcom.co.uk>
Cc: mtd@infradead.org, jffs-dev@axis.com
Subject: Re: Latest JFFS fixes bug 
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Fri, 25 Aug 2000 10:07:32 +0100
Message-ID: <21071.967194452@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



dvrabel@arcom.co.uk said:
>  Something positive for a change...

hehe

> Latest JFFS from CVS fixes a `running out of free space' bug I
> encountered last night.

It's still not _quite_ right here. We seem to have swapped rôles.

I came in this morning to find:
Free size accounting screwed
free_chunk_size1 == 0x10fed0, free_chunk_size2 == 0x0, fmc->free_size == 0x12fe68
jffs_flash_erasable_size() given non-aligned offset 1dff98 (erasesize 20000)

I think the new logic to avoid marking huge free areas as dirty is giving
us two free areas on the flash in certain circumstances, and isn't ensuring 
that the dirty areas are sector-aligned.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
