Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12xJLe-0004VJ-00
	for mtd-list@infradead.org; Thu, 01 Jun 2000 02:00:34 +0100
Received: from gate.mvhi.com
	([194.205.184.34] helo=server.axiom.internal ident=exim)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12xJLe-0004VD-00
	for mtd@infradead.org; Thu, 01 Jun 2000 02:00:34 +0100
Received: from devel2.axiom.internal ([10.0.1.4])
	by server.axiom.internal with esmtp (Exim 3.12 #1)
	id 12xJLd-0001Fy-00
	for mtd@infradead.org; Thu, 01 Jun 2000 02:00:33 +0100
Received: from localhost ([127.0.0.1] helo=devel2.axiom.internal)
	by devel2.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@infradead.org
	id 12xJLd-0003oG-00; Thu, 1 Jun 2000 02:00:33 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E12xJAk-0004T1-00@infradead.org> 
References: <E12xJAk-0004T1-00@infradead.org> 
To: mtd@infradead.org
Subject: Re: MTD CVS update: 'mtd/grub doc_stage1.S' 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 01 Jun 2000 02:00:33 +0100
Message-ID: <14647.959821233@devel2.axiom.internal>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dwmw2@infradead.org said:
>  Also fix the segment registers in the actual copy, so that we put the
>  right stuff in place, rather than starting our copy at 0000:0000. 

It seems I lied about this one - that was right in the previous version, 
but I removed a 'push cs; pop ds' pair with some debugging cruft and didn't 
remember that fact when I later noticed that they ought to be there for 
other reasons. The perils of asm hacking at 2am :)

So I'm not _quite_ as stupid as I thought. Close, though. It _was_ 
copying the handler to the right place, but just pointing the IRQ vector at 
the old location.

Oh well, it ought to work now. Now we just need to finish hacking Grub so 
it can boot a kernel off the NFTL. So far, it finds the hardware and scans 
if for an NFTL Media Header. The rest should be simple.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
