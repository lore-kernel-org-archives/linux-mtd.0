Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bf1G8-0000Fp-Va
	for linux-mtd@lists.infradead.org; Mon, 28 Jun 2004 14:53:41 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: "Robert P. J. Day" <rpjday@mindspring.com>
In-Reply-To: <Pine.LNX.4.60.0406281424320.3644@localhost.localdomain>
References: <Pine.LNX.4.60.0406281424320.3644@localhost.localdomain>
Content-Type: text/plain
Message-Id: <1088448813.4636.147.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Mon, 28 Jun 2004 19:53:33 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: the state of MTD at the moment?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-06-28 at 14:27 -0400, Robert P. J. Day wrote:
>    a colleague, who wants to upgrade JFFS2 in his 2.4.22 kernel, just 
> handed me a copy of an april 2004 posting to this list, concerned 
> because it said:
> 
> 1.  Wait till the MTD CVS code is actually stable.  It's not at the
>      moment; cfi_cmdset_0002.c is known to be broken ...

You use AMD flash? I think that's fixed now anyway. What else do you
use?

> first, i've enabled IPv6 on my FC2 system, and still can't get access 
> to the CVS repo, is it even alive?

Yes, it's alive.

> also, i pointed out that, since that posting was a couple months old,
> just getting the latest snapshot was probably sufficient.

The latest snapshot should be fine for NOR flash. It's got some
relatively new code in for NAND flash which could do with some more
testing, but should be OK. And we've just switched the DiskOnChip driver
to work in the generic NAND flash code, so be very careful with that --
you should be able to safely use JFFS2 on DiskOnChip now though.

-- 
dwmw2
