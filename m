Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13SzPa-0007bP-00
	for mtd-list@infradead.org; Sun, 27 Aug 2000 11:11:34 +0100
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13SzPY-0007bJ-00
	for mtd@infradead.org; Sun, 27 Aug 2000 11:11:33 +0100
Date: Sun, 27 Aug 2000 11:09:48 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: Nick Ivanter <nick@auriga.ru>
cc: mtd <mtd@infradead.org>, jffs-dev@axis.com
Subject: Re: gc_minfree_threshold
In-Reply-To: <39A7A51A.63F2BCBB@auriga.ru>
Message-ID: <Pine.LNX.4.21.0008271104290.946-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Sat, 26 Aug 2000, Nick Ivanter wrote:

> David,
> I have just noticed some strange things in the code dealing
> with gc_minfree_threshold. I guess you added that code that is
> why I am addressing my questions to you.
> 
> First, when you initialize c->gc_minfree_threshold to 5%
> of the total Flash size, you then make sure that it is not less
> than a sector size. Why? Shouldn't it rather be not less than
> fmc->min_free_size?

Yes, it probably should.

> Second, when you evaluate a gc starting criteria in
> thread_should_wake(), you compare gc_minfree_threshold with
> dirty_size. I guess there should be free_size instead.

It was once. Between v1.44 and 1.45, this happened:
-       if (nfree < c->gc_minfree_threshold)
+       if (c->fmc->dirty_size < c->gc_minfree_threshold)

Mea Culpa. I got the replacement wrong.

Actually I was thinking of dropping both of those and changing it to
something like:
	if (dirty_size > free_size)
		return 1;

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
