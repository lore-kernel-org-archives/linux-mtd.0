Received: from pu90.internetdsl.tpnet.pl ([80.55.20.90]
	helo=evo.evopolska.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Q5OG-0004Mg-JR
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 14:11:49 +0100
Date: Wed, 11 Jun 2003 15:13:55 +0200 (CEST)
From: angainor@evo.evopolska.com
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.44.0306111257110.10908-100000@evo.evopolska.com>
Message-ID: <Pine.LNX.4.44.0306111500380.14555-100000@evo.evopolska.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: linux-mtd@lists.infradead.org
Subject: Re: MTD drivers for DoC Millenium Plus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


After delving a little more into the code...

I have managed to cheat a little through the INFTL_mount,
so now I'm back in inftlcode.c/inftl_add_mtd().
Discovered inftl->mbd.size is correct, M-Systems 
driver did discover same size. Next, calculation of
cylinders/heads/sectors fails, but never mind that.
Below is the code that worries me a lot:

	...
        if (add_mtd_blktrans_dev) {
                if (inftl->PUtable)
	...

Guys, really, has nobody even run this code once
to see if it works? add_mtd_blktrans_dev is a function.
It needs arguments. Specifically, it needs to feed on
&inftl->mbd. So this should actually be:

	...
        if (add_mtd_blktrans_dev(&inftl->mdb)) {
                if (inftl->PUtable)
	...

Checking if a pointer to a function is not zero will 
in most cases return true under linux. This COULD NOT 
possibly work, not once. What's more scary, exactly the 
same code is present in nftlcore.c. And that driver must 
have been tested. What's going on? I've checked out CVS today. 
Am I missing something? 

Regards

Marcin
