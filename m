Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13d8hf-0006Vm-00
	for mtd-list@infradead.org; Sun, 24 Sep 2000 11:08:11 +0100
Received: from roma.axis.se ([193.13.178.2])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13d8hd-0006Vg-00
	for mtd@infradead.org; Sun, 24 Sep 2000 11:08:10 +0100
Message-ID: <004f01c0260f$fa7af160$1e2614ac@johanado.axis.se>
From: "Johan Adolfsson" <johan.adolfsson@axis.com>
To: "Steven J. Hill" <sjhill@cotw.com>, "JFFS List" <jffs-dev@axis.com>,
        "MTD List" <mtd@infradead.org>
Subject: Re: Humble question on actual journalling mechanism...
Date: Sun, 24 Sep 2000 12:12:42 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

The jffs-dev list is archived on:
http://mhonarc.axis.se/jffs-dev/threads.html
Information about that should be at the JFFS pages as well (but it isn't).
Currently it's only in the "Contact Us" section of our developer site -
we'll fix that.
/Johan


-----Original Message-----
From: Steven J. Hill <sjhill@cotw.com>
To: JFFS List <jffs-dev@axis.com>; MTD List <mtd@infradead.org>
Date: den 23 september 2000 15:32
Subject: Humble question on actual journalling mechanism...


>Greetings again.
>
>I have been reading the JFFS code solid for the past two days
>now. I am about 1/4 the way through 'intrep.c' which is just
>huge. The function that I am currently looking at is
>'jffs_insert_node'. I must humbly ask for how the underlying
>journaling/versioning works. In the explanation, if the
>manipulation of the members in the 'jffs_node' structure with
>regards to versioning could be explained, that would be great.
>
>All the other files were easy to understand because it was just
>the basic calls for working with the flash and providing the
>upper level functions for superblock and inode interfacing with
>the kernel's VFS layer. 'intrep.c' is where the core is really
>at and I would appreciate some simple understanding.
>
>Yes, I did look through the MTD archives. No, I did not look
>through the JFFS mailing list archives because they do not seem
>to exist anywhere off of the Axis page or anywhere else for
>that matter. I also apologize for the cross-post.
>
>-Steve
>
>--
> Steven J. Hill - Embedded SW Engineer
> Public Key: 'finger sjhill@mail.cotw.com'
> FPR1: E124 6E1C AF8E 7802 A815
> FPR2: 7D72 829C 3386 4C4A E17D
>



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
