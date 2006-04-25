From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060425134822.GC3781@wohnheim.fh-wedel.de>
References: <20060424161529.GR7570@earth.li>
	<1145972592.11909.392.camel@pmac.infradead.org>
	<20060425134822.GC3781@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Apr 2006 14:58:24 +0100
Message-Id: <1145973504.11909.394.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Tue, 2006-04-25 at 15:48 +0200, Jörn Engel wrote:
> We could have a nand_read_byte()/nand_write_byte() pair of macros that
> are defined to readb/writeb for the generic case and to
> read_byte/write_byte for CONFIG_FIND_SOME_SANE_NAME.

That makes nand.o non-generic, and prevents you from using it for
multiple 'board drivers' in the same kernel build.

-- 
dwmw2
