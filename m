Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cvea6-0000Dh-Eq
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2005 11:39:20 -0500
Date: Mon, 31 Jan 2005 17:39:19 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Robert P. J. Day" <rpjday@mindspring.com>
Message-ID: <20050131163919.GH6694@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.61.0501311010180.3552@localhost.localdomain>
	<1107184897.7567.20.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.61.0501311038140.3730@localhost.localdomain>
	<Pine.LNX.4.58.0501311553590.17207@phoenix.infradead.org>
	<Pine.LNX.4.61.0501311109050.13936@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.61.0501311109050.13936@localhost.localdomain>
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: running out of space dd'ing JFFS2 image to /dev/mtdblock/0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 31 January 2005 11:14:49 -0500, Robert P. J. Day wrote:
> 
> first, it's necessary to define a simple standard, so what about
> something like the following?  any size values in *any* of the
> JFFS2-related programs shall be in one of the following formats:
> 
>   ###		(interpreted as bytes)
>   ###KiB	(obvious)
>   ###MiB	(obvious)
> 
> at the moment, this is not being followed.  for instance, mkfs.jffs2
> has the --pad=SIZE option, where a simple number is treated as KiB.
> anyway, you get idea -- it's pretty confusing.
> 
> so, do we at least have some agreement on a standard?  which would
> hold across *all* programs and modules?  i'm not even going to
> *consider* looking at patches to do this unless i'm convinced everyone
> agrees, since changes like this will clearly force people to change
> the way they do some things.  and i know how fond some people are of
> *that* idea. :-)

I agree on a standard, if that helps you:

0x[0-9]...	hex
0[1-9]...	octal
[1-9]...	decimal

If followed by "ki", "Mi", or "Gi", they are multiplied by 1024, etc.

Example code, taken from phram:

static int ustrtoul(const char *cp, char **endp, unsigned int base)
{
	unsigned long result = simple_strtoul(cp, endp, base);

	switch (**endp) {
	case 'G':
		result *= 1024;
	case 'M':
		result *= 1024;
	case 'k':
		result *= 1024;
	/* By dwmw2 editorial decree, "ki", "Mi" or "Gi" are to be used. */
		if ((*endp)[1] == 'i')
			(*endp) += 2;
	}
	return result;
}

static int parse_num32(uint32_t *num32, const char *token)
{
	char *endp;
	unsigned long n;

	n = ustrtoul(token, &endp, 0);
	if (*endp)
		return -EINVAL;

	*num32 = n;
	return 0;
}

This allows different people with different taste to specify numbers
in various simple formats.  If you think you can improve on this,
please send me a patch.

Jörn

-- 
But this is not to say that the main benefit of Linux and other GPL
software is lower-cost. Control is the main benefit--cost is secondary.
-- Bruce Perens
