Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 141n1n-0002Pr-00
	for mtd-list@infradead.org; Fri, 01 Dec 2000 10:02:51 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 141n1m-0002Pl-00
	for mtd@infradead.org; Fri, 01 Dec 2000 10:02:50 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <LAW-F91NtDEJmGzrLCC00005522@hotmail.com> 
References: <LAW-F91NtDEJmGzrLCC00005522@hotmail.com> 
To: "Levi Khatskevitch" <lkhatskevitch@hotmail.com>
Cc: linuxbios@lanl.gov, mtd@infradead.org
Subject: Re: blk_dev[93].request_fn == NULL bug is still there 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 01 Dec 2000 10:02:44 +0000
Message-ID: <2160.975664964@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


lkhatskevitch@hotmail.com said:
>  Now I've just reproduced the blk_dev[93].request_fn == NULL bug in
> the  latest code. Here is how:

Works for me now. Check you've rebuilt it all with the latest patch.

Note init/main.c should now look like this:


        /* Set up devices .. */
        device_setup();

#ifdef CONFIG_MTD
        init_mtd();
#endif


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
