Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 158kjv-0001b0-00
	for <linux-mtd@lists.infradead.org>; Sat, 09 Jun 2001 16:33:27 +0100
Received: from router-100m.swansea.linux.org.uk ([194.168.151.17] helo=the-village.bc.nu)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 158OlG-00027R-00
	for linux-mtd@lists.infradead.org; Fri, 08 Jun 2001 17:05:23 +0100
Subject: Re: Earyly Cyrix CPUs was Re: Missing cache flush.
To: pavel@suse.cz (Pavel Machek)
Date: Fri, 8 Jun 2001 17:00:18 +0100 (BST)
Cc: alan@lxorguk.ukuu.org.uk (Alan Cox), kira@linuxgrrls.org (kira brown),
	dwmw2@infradead.org (David Woodhouse),
	davem@redhat.com (David S. Miller), cw@f00f.org (Chris Wedgwood),
	jgarzik@mandrakesoft.com (Jeff Garzik), bjornw@axis.com,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
In-Reply-To: <20010606194434.A38@toy.ucw.cz> from "Pavel Machek" at Jun 06, 2001 07:44:34 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-Id: <E158OgN-0002pI-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> What is list of cpu's not supported? I want one ;-).
> [It is even more broken than 386? Wow!]

Some of the early Cyrix cpus get cache corruption. I dont know of any work
around. These are the CPU's that won't run some versions of gcc (optimised
egcs 1.1.2 segfaulted at random non optimised worked, both work on other
cpus)
