Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12fewQ-0003Vn-00
	for mtd-list@infradead.org; Thu, 13 Apr 2000 09:25:34 +0100
Received: from gate.mvhi.com
	([194.205.184.34] helo=server.axiom.internal ident=mail)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12fewP-0003Vh-00
	for mtd@infradead.org; Thu, 13 Apr 2000 09:25:33 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <38F4D0AA.3FEA3BCF@tsai.es> 
References: <38F4D0AA.3FEA3BCF@tsai.es> 
To: Rodrigo Moya <rmoya@tsai.es>
Cc: MTD List <mtd@infradead.org>
Subject: Re: problems compiling 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 13 Apr 2000 09:25:36 +0100
Message-ID: <16135.955614336@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


_Please_ turn off the base64 :)


rmoya@tsai.es said:
>  1 - I had to comment the definition of DECLARE_WAITQUEUE in mtd.h, as
> it's also defined in compatmac.h.

> 2 - Compiler complained about 'add' not being a member of mtd_notifier.

You say later that you're using CVS. DECLARE_WAITQUEUE isn't in my version, 
and the add/remove members of the struct mtd_notifier _are_:

/* $Id: mtd.h,v 1.8 2000/03/31 14:40:42 dwmw2 Exp $ */



> 3 - Then, in doc2000.c, it complained about CDSNControl and
> CDSN_CTRL_FR_B not being defined.

> 4 - Again in doc2000.c, doc->nextdoc (struct DiskOnChip *doc) does not
> exist. I couldn't figure out this one.


For each of these two, I changed the include files at the same time as I
changed the C files. It's OK in the current CVS:

/* $Id: doc2000.h,v 1.4 2000/03/31 14:40:42 dwmw2 Exp $ */


rmoya@tsai.es said:
> I suppose all these errors are because I took the sources from CVS,
> and that this is development code. 

You seem to have an old copy of the include directory. Try 'cvs update -A'

Note that the IO request handling in the current NFTL code (v1.26) is not
working. You need to revert to v1.25 ('cvs update -r 1.25 nftl.c'). 
Alternatively, you could fix it :)




--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
