Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mNrv-0000GO-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 01:18:04 +0100
From: David Woodhouse <dwmw2@redhat.com>
In-Reply-To: <16232.1031056191@redhat.com> 
References: <16232.1031056191@redhat.com>  <541025071C7AC24C84E9F82296BB9B952D23@OPTEX1.optex.local> 
Cc: "John Hall" <John.Hall@optionexist.co.uk>,
    "Linux MTD list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: Stable cvs version for 2.4 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 04 Sep 2002 01:18:02 +0100
Message-ID: <21107.1031098682@redhat.com>
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

dwmw2@infradead.org said:
>  The head of CVS as of yesterday (cvs up -D yesterday) should be fine.
>  Don't use the stuff I committed at 1 o'clock this morning without
> testing it.  That would not be advisable :)

The current code now seems to be passing my stress tests again. I think I 
may have ironed out the rbtree bugs. So anyone who was previously 
complaining that the performance went to pot after files got quite large, 
suck this one and see. Should now have O(log N) lookup and insertion costs 
instead of O(N), N obviously being the size of the file.

You may have to nab a copy of lib/rbtree.c from a vaguely recent 2.4 kernel 
if you're using ancient ones, or maybe just export its contents. I'm going 
to clean that up later; I don't like the existing one because it wastes 
sizeof(int) for a single bit of colour information which could easily be 
packed into the low bits of one of the pointers. :)

--
dwmw2
