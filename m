Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16cjZS-0002iQ-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Feb 2002 08:54:50 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0202180915200.5439-100000@dagobert.svc.sysgo.de> 
References: <Pine.LNX.4.21.0202180915200.5439-100000@dagobert.svc.sysgo.de> 
To: Robert Kaiser <rob@sysgo.de>
Cc: "Brian J. Fox" <bfox@ua.com>, linux-mtd@lists.infradead.org,
    J?rn Engel <joern@wohnheim.fh-wedel.de>
Subject: Re: MTD concat layer 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 18 Feb 2002 09:05:55 +0000
Message-ID: <16804.1014023155@redhat.com>
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

rob@sysgo.de said:
>  Now, here comes the problem. In the context of an erase function,
> what does "predictable behavior" mean ? If it returns EINVAL, the
> caller can see that they passed a faulty parameter, so does it make
> any difference wether some of the specified flash range have been
> erased in the process ? By specifying a certain area of flash to be
> erased, the user has by definition given up any hope of seeing the
> data in that area again.

There is never any excuse for passing invalid offset/length to the erase
function - even the ioctl code can do a sanity check before passing through
the values provided by the user.

For errors which can understandably occur, your concerns are valid and we 
should ensure sanity by failing the request as safely as possible, doing 
nothing else.

This is not such an error. As long as the ioctl() has an appropriate sanity 
check, the occurrence of such an error indicates that the kernel code is 
completely broken. Better to BUG() than return an error, in that case - 
that way, there's no chance that the broken code will try again, and happen 
to pick a range which _does_ look valid, but which it still shouldn't be 
erasing.


--
dwmw2
