Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12xodl-0001JQ-00
	for mtd-list@infradead.org; Fri, 02 Jun 2000 11:25:21 +0100
Date: Fri, 2 Jun 2000 11:07:12 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
To: David Woodhouse <dwmw2@infradead.org>
cc: Bjorn Wesen <bjorn.wesen@axis.com>,
        Finn Hakansson <finn.hakansson@axis.com>, mtd@infradead.org,
        alan@redhat.com
Subject: Re: JFFS - ready for submission into 2.[34]?
In-Reply-To: <27238.959876711@devel2.axiom.internal>
Message-ID: <Pine.LNX.4.10.10006021101080.751-100000@tammy.signum.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Thu, 1 Jun 2000, David Woodhouse wrote:

> I'm fairly happy with the current state of the MTD code - my remaining
> niggles are lack of certain functionality rather than stupidities in the
> code, so I'm submitting it to Alan in the hope that he'll include it into
> his 2.4.0-test1-ac kernels - after all, it's "only new drivers."

After some testing today i think its *not* ready for public consumption. I
managed to break one test where i truncated a file giving very strange
results, and al viros hashlist cleanup (which just replaced a home-grown
list with a list_head) made jffs freeze X for me (but it worked in the
console), which is something that simple patch shouldn't be able to do.
I've reverted that, but I want to look closer at it (no time today
though). 

But the filesystem does seem to work passably without you having to
implement half of VFS to test it, so I'd definitely would be interested in
a few people on the mtd-list testing it out.

Also, is anyone aware of a filesystem stress-test program i could try?

/ Alex





To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
