Received: from [62.98.230.58] (helo=lisa.rhpk.springfield.inwind.it ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15o0ac-0008Gn-00
	for <linux-mtd@lists.infradead.org>; Mon, 01 Oct 2001 11:46:23 +0100
Received: from localhost (paris@localhost)
	by lisa.rhpk.springfield.inwind.it (8.11.4/8.11.4) with ESMTP id f91Anan00537
	for <linux-mtd@lists.infradead.org>; Mon, 1 Oct 2001 12:49:36 +0200
Date: Mon, 1 Oct 2001 12:49:35 +0200 (CEST)
From: Cristiano Paris <c.paris@libero.it>
To: <linux-mtd@lists.infradead.org>
Subject: MTD newbie
Message-ID: <Pine.LNX.4.33.0110011244210.527-100000@lisa.rhpk.springfield.inwind.it>
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

Hi everyone.

I have a question about the Linux MTD layer. I'm mainly interested in the
JFFS2 development and, as a private user, I cannot count on enterprise
level resources.

I own a iPAQ but I don't want to waste write operations to the Flash so
I'm looking for a way to mount and operate JFFS2 filesystems without a
flash.

I'm wondering if something like /dev/loop or /dev/ram can be used. At
first I decided to write an MTD interface to a virtual MTD device, but I
don't want to re-invent the wheel. Is anything like this out there ?

If not, I can write a new module.

Thanks

Cristiano
