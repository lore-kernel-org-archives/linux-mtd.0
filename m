Return-path: <David.Woodhouse@mvhi.com>
Received: from localhost ([127.0.0.1] ident=root)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 10q6Ph-00015L-00
	for mtd@imladris.demon.co.uk; Sat, 5 Jun 1999 03:42:25 +0100
Received: from pop3.mail.demon.net
	by localhost with POP3 (fetchmail-5.0.0)
	for mtd@imladris.demon.co.uk (multi-drop); Sat, 05 Jun 1999 03:42:25 +0100 (BST)
Received: from punt-1.mail.demon.net by mailstore for mtd@imladris.demon.co.uk
          id 928550533:10:19025:10; Sat, 05 Jun 99 02:42:13 GMT
Date: Fri, 4 Jun 1999 20:41:56 -0600 (MDT)
From: Jason Gunthorpe <jgg@deltatee.com>
To: David Woodhouse <David.Woodhouse@mvhi.com>
cc: Linux-MTD mailing list <mtd@imladris.demon.co.uk>
Subject: Re: RFC: kernel-based PCMCIA ... 
In-Reply-To: <E10kQCS-0001AQ-00@devel2.axiom.internal>
Message-ID: <Pine.LNX.3.96.990604203916.23430B-100000@white.priv.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: David Woodhouse <David.Woodhouse@mvhi.com>
List-ID: <linux-mtd.lists.infradead.org>


On Thu, 20 May 1999, David Woodhouse wrote:

> We will attempt to make this provide all the functionality required by the
> existing MTD layer in the PCMCIA code, with a view to including it in the 2.3
> kernels, and converting the PCMCIA code to use it (when present).

Has there been an talk of a FFS driver for linux? Also, has anyone done
any work on writing drivers for ordinary flash chips (ie on embedded
systems) 

Thanks,
Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
