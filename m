Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FPF9f-0000zm-2u
	for linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 03:39:01 -0500
Date: Fri, 31 Mar 2006 10:38:27 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <20060331083827.GA11367@wohnheim.fh-wedel.de>
References: <20060329232520.1677d2b3.akpm@osdl.org>
	<442C0494.2040609@zytor.com>
	<20060330114014.53150d1b.akpm@osdl.org>
	<442C6B78.3060706@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <442C6B78.3060706@zytor.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Subject: Re: blkmtd and name_to_dev_t
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 30 March 2006 15:36:24 -0800, H. Peter Anvin wrote:
> 
> I talked to Jörg Engel about this; he indicated that the blkmtd driver 
                 ^
*grumble* ;)

> There seems to be a few options, in order from least work to more work:
> 
> - Removing the blkmtd driver and tell people to use block2mtd;

Fair enough.  No objections from my side.
Most users of mtd tend to use ancient kernels anyway, so there is less
reason for a warning period, compared to other parts of the kernel.

> - Have kinit intercept blkmtd configuration options and emulate them 
> using block2mtd;
> - Adjust blkmtd to have a configuration interface, and then make kinit 
> configure it.

Jörn

-- 
I don't understand it. Nobody does.
-- Richard P. Feynman
