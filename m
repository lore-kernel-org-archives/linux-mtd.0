Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12l9db-0004JH-00
	for mtd-list@infradead.org; Fri, 28 Apr 2000 13:12:51 +0100
Received: from colo.asti-usa.com ([205.252.89.99] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12l9dZ-0004JB-00
	for mtd@infradead.org; Fri, 28 Apr 2000 13:12:49 +0100
Message-ID: <39098147.5D14144C@zentropix.com>
Date: Fri, 28 Apr 2000 13:17:11 +0100
From: Trevor Woolven <trevw@zentropix.com>
MIME-Version: 1.0
To: Jamey Hicks <jamey@crl.dec.com>, MTD <mtd@infradead.org>
Subject: Re: TODO List
References: <D1674834F25BD3118B3208002BB90CD4440250@yen.crl.dec.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Jamey Hicks wrote:
> 
> > 2     FTL fix
> 
> What's wrong with FTL?
> What's the state of it wrt licensing M-Systems patents?  Can it be used for
> systems with onboard flash?
> 
> -Jamey
DW thinks FTL needs to be Big-Endian on BE machines and Little-Endian on
LE machines and never the twain shall meet, which seems strange. He
posted this observation to the list a while back and would like further
information on it before proceeding with a fix.

I'm not sure about the licensing issue, is this another subject for the
TODO list?

Best regards

Trevor.
-- 
Zentropix Inc - a Lineo company

Tel: +44 (0)1273 234 647	 Fax: +44 (0)1273 704 482

Visit http://www.zentropix.com/ for Real Time Linux Tools
Visit http://www.realtimelinux.org/ for Real Time Linux Information


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
