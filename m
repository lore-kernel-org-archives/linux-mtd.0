Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ki8q-0008SW-HT
	for <linux-mtd@lists.infradead.org>; Thu, 07 Aug 2003 11:37:08 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Stefano Babic <stefano.babic@siemens.com>
In-Reply-To: <1060078328.1717.233.camel@mhw42463>
References: <1060078328.1717.233.camel@mhw42463>
Message-Id: <1060252618.25209.31.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 07 Aug 2003 11:36:58 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Concurrency erase/write on the same AMD chip with not aligned
	words
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-08-05 at 11:12, Stefano Babic wrote:
> Hi all,
> 
> I have seen a problem when I am writing not-aligned words on AMD chips
> while on the same chip another process starts an erase procedure for
> other sectors or a different MTD device. 

 <...>

> I set the check with the cfi status before the copy_from() as usual with
> (mutex omissis):
> 
>         if (cfi->chips[chipnum].state != FL_READY) {
> 		.....
> 
> to be sure that the chip is not in FL_ERASING and everything is working
> fine. 
> 
> Has anybody had the same problem ? 

I haven't seen it personally, but it definitely looks like you're right.
Please could you send a patch?

-- 
dwmw2
