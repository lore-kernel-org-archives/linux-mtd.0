Received: from [213.39.233.138] (helo=wohnheim.fh-wedel.de)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19edA9-00026V-Cq
	for <linux-mtd@lists.infradead.org>; Mon, 21 Jul 2003 17:05:21 +0100
Date: Mon, 21 Jul 2003 18:04:53 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: andrzej.mialkowski@inetia.pl
Message-ID: <20030721160453.GA3677@wohnheim.fh-wedel.de>
References: <1058792691.3f1be4f31ca98@imail.internetia.pl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1058792691.3f1be4f31ca98@imail.internetia.pl>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: hardcoded maximum number of CFI chips - continued
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 21 July 2003 15:04:51 +0200, andrzej.mialkowski@inetia.pl wrote:
> 
> Jörn,
>   You of course right that limit proposed in patch too high. With current 
> typical stack size (8K) and structure size (36 bytes - on ARM) it is safe to 
> handle this way about 160 chips. This is much more what can be expected in 
> resonable designs (and what I need). On the other hand placing kmalloc for 
> chips structure effectively leeds to solution with realloc. Drawback of this 
> will be creation of heap fragment, it also still has problem with the constant 
> limit.

Heap fragmentation should not be a problem in kernel space, but you
have to copy the array around each time you "realloc".

> For me attractive are two solutions:
> 1) Cleaned previous proposal, becuse it is simple and solves problem probably 
> fits for all designs.
> 2) Rewrite genprobe_ident_chips to use realloc emulation to allow expansion 
> structure and handling any number of chips.
3) Rewrite genprobe_ident_chips to use a linked list with struct
list_head.

Usually 3) is a little awkward at first, but when you are done, the
code looks a lot nicer than before.  I'm not sure if it would work
here as well.  It should, but you never know before you actually try
it.

> diff -Nru --minimal prev/drivers/mtd/chips/Config.in 
> linux/drivers/mtd/chips/Config.in
> --- prev/drivers/mtd/chips/Config.in	Fri Mar 14 17:21:15 2003
> +++ linux/drivers/mtd/chips/Config.in	Mon Jul 21 14:23:49 2003
> @@ -40,6 +40,7 @@
>         bool '    Support 4-chip flash interleave' CONFIG_MTD_CFI_I4
>         bool '    Support 8-chip flash interleave' CONFIG_MTD_CFI_I8
>       fi
> +     int '  Maximum number of flash chips' CONFIG_MTD_CFI_MAX_CHIPS 8 1 32
>    fi
>  fi

This should with 4k kernel stack, but it is still an ugly solution,
imo.  The complexety for the problem is all over the place, Makefile
Kconfig, header, source file.  If I only had more time to do a proper
fix myself...

Jörn

-- 
The cost of changing business rules is much more expensive for software
than for a secretaty.
-- unknown
