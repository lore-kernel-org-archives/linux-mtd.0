Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DL4KZ-0004j0-5X
	for linux-mtd@lists.infradead.org; Mon, 11 Apr 2005 15:12:20 -0400
Date: Mon, 11 Apr 2005 15:09:59 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <1113238871.7520.3.camel@windu.rchland.ibm.com>
Message-ID: <Pine.LNX.4.61.0504111509070.26633@localhost.localdomain>
References: <Pine.LNX.4.61.0504101735390.8617@localhost.localdomain>
	<f96d234e050411035522064e02@mail.gmail.com>
	<Pine.LNX.4.61.0504110725540.6265@localhost.localdomain>
	<1113238871.7520.3.camel@windu.rchland.ibm.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: how little do i have to do to define flash layout on my system?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 11 Apr 2005, Josh Boyer wrote:

> See drivers/mtd/maps/mphysmap.c

ah, there is no such map file in my kernel source tree 2.6.11.7, so
that's obviously new.  CVS?

rday
