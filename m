Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FYOAO-00030K-NG
	for linux-mtd@lists.infradead.org; Tue, 25 Apr 2006 10:05:30 -0400
Date: Tue, 25 Apr 2006 16:05:21 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20060425140521.GD3781@wohnheim.fh-wedel.de>
References: <20060424161529.GR7570@earth.li>
	<1145972592.11909.392.camel@pmac.infradead.org>
	<20060425134822.GC3781@wohnheim.fh-wedel.de>
	<1145973504.11909.394.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1145973504.11909.394.camel@pmac.infradead.org>
Cc: Jonathan McDowell <noodles@earth.li>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] Add Amstrad Delta NAND support.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 25 April 2006 14:58:24 +0100, David Woodhouse wrote:
> On Tue, 2006-04-25 at 15:48 +0200, Jörn Engel wrote:
> > We could have a nand_read_byte()/nand_write_byte() pair of macros that
> > are defined to readb/writeb for the generic case and to
> > read_byte/write_byte for CONFIG_FIND_SOME_SANE_NAME.
> 
> That makes nand.o non-generic, and prevents you from using it for
> multiple 'board drivers' in the same kernel build.

Valid concern.  Still, I'd like some method to at least share all the
identical source code.  You know the usual problems when two copies of
essentially the same get out of sync.

Jörn

-- 
Beware of bugs in the above code; I have only proved it correct, but
not tried it.
-- Donald Knuth
