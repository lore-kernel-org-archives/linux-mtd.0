Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 141Wk7-0007AA-00
	for mtd-list@infradead.org; Thu, 30 Nov 2000 16:39:31 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 141Wk6-0007A3-00
	for mtd@infradead.org; Thu, 30 Nov 2000 16:39:30 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <LAW-F154GeU75iMaUfO000040f1@hotmail.com> 
References: <LAW-F154GeU75iMaUfO000040f1@hotmail.com> 
To: "Levi Khatskevitch" <lkhatskevitch@hotmail.com>
Cc: linuxbios@lanl.gov, mtd@infradead.org
Subject: Re: init_doc2001 and init_doc2000 are hidden from init_mtd 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 30 Nov 2000 16:39:23 +0000
Message-ID: <5894.975602363@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


lkhatskevitch@hotmail.com said:
>  I removed 'static' from those declarations and now it compiles  both
> ways. I still have to test how the new kernel runs I'll do tomorrow
> morning. 

Fixed. As is the increasingly negative use count. 



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
