Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 1433UU-0005Rf-00
	for mtd-list@infradead.org; Mon, 04 Dec 2000 21:49:42 +0000
Received: from modemcable248.137-200-24.mtl.mc.videotron.ca ([24.200.137.248] helo=xanadu.gn.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 1433US-0005RZ-00
	for mtd@infradead.org; Mon, 04 Dec 2000 21:49:40 +0000
Date: Mon, 4 Dec 2000 16:49:36 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: <mark.langsdorf@amd.com>
cc: <mtd@infradead.org>
Subject: Re: Odd behavior of JFFS with AMD chips - kernel panic!
In-Reply-To: <Pine.LNX.4.30.0012041525460.16670-100000@xanadu.gn.com>
Message-ID: <Pine.LNX.4.30.0012041646241.16670-100000@xanadu.gn.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Mon, 4 Dec 2000, Nicolas Pitre wrote:

> Beware that /dev/mtd2 (char 90:2) and /dev/mtdblock2 (block 31:2) aren't
> pointing to the same MTD object...

I'm apparently on drugs...

I just discovered mtd/util/MAKEDEV, and it apparently contains:

for a in `seq 0 16` ; do
        mknod /dev/mtd$a c 90 `expr $a + $a`
        mknod /dev/mtdr$a c 90 `expr $a + $a + 1`
        mknod /dev/mtdblock$a b 31 $a
done

Sorry for being stupid.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
