Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13lyPE-000315-00
	for mtd-list@infradead.org; Wed, 18 Oct 2000 19:57:40 +0100
Received: from brutus.conectiva.com.br ([200.250.58.146] helo=burns.conectiva)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13lyP9-00030z-00
	for mtd@infradead.org; Wed, 18 Oct 2000 19:57:37 +0100
Date: Wed, 18 Oct 2000 15:57:52 -0200 (BRST)
From: Fernando Fuganti <fuganti@conectiva.com.br>
To: Kevin Moore <kevin@moore-and-moore.com>
cc: mtd@infradead.org, Volker Sonn <mlist@sonn-online.de>,
    Alessandro GARDICH <gremlin@gremlin.it>
Subject: Re: Kernel change for booting off DOC 2000 and Millenium
In-Reply-To: <20001018094821.A29254@flapjack>
Message-ID: <Pine.LNX.4.21.0010181552450.10242-100000@ze.distro.conectiva>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Wed, 18 Oct 2000, Kevin Moore wrote:

> be specified as a root device on the command line.  Without this,
> the kernel is unable to parse "root=/dev/nftla1" and can't find
> it's root filesystem (for any DOC).  Booting using an rdev'ed
> kernel should work without any kernel change, since it doesn't rely
> on parsing the kernel command line options.

passing  "root=5d01" should work, without any kernel modifications

Fernando Fuganti 





To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
