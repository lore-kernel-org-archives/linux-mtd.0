Received: from hex.linuxgrrls.org ([212.18.228.73] ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15o4HR-00007t-00
	for <linux-mtd@lists.infradead.org>; Mon, 01 Oct 2001 15:42:49 +0100
Date: Mon, 1 Oct 2001 15:50:58 +0100 (BST)
From: kira brown <kira@hex.linuxgrrls.org>
To: Cristiano Paris <c.paris@libero.it>
Cc: <linux-mtd@lists.infradead.org>
Subject: Re: MTD newbie
In-Reply-To: <Pine.LNX.4.33.0110011244210.527-100000@lisa.rhpk.springfield.inwind.it>
Message-ID: <Pine.LNX.4.33.0110011550130.888-100000@hex.linuxgrrls.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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


On Mon, 1 Oct 2001, Cristiano Paris wrote:

> I'm wondering if something like /dev/loop or /dev/ram can be used. At
> first I decided to write an MTD interface to a virtual MTD device, but I
> don't want to re-invent the wheel. Is anything like this out there ?

Yes.

There's an MTD driver that works from a block of RAM.

It's in the standard sources.

kira.
