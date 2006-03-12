Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FIYpv-0007Qa-Aw
	for linux-mtd@lists.infradead.org; Sun, 12 Mar 2006 17:15:01 -0500
Date: Sun, 12 Mar 2006 23:14:42 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Chuck Meade <chuckmeade@mindspring.com>
Message-ID: <20060312221442.GB7525@wohnheim.fh-wedel.de>
References: <IIEEICKJLNEPBBDJICNGAEHLKDAA.chuckmeade@mindspring.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <IIEEICKJLNEPBBDJICNGAEHLKDAA.chuckmeade@mindspring.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: cmdlinepart.c patch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 6 March 2006 10:46:30 -0500, Chuck Meade wrote:
> 
> The cmdlinepart.c logic treats a partition offset that has been explicitly
> specified as zero the same as an unspecified offset.  This causes the
> partitioning logic to fail if your partition that starts at 0x0 is not the
> first partition listed on the cmdline.
> 
> For example, if you have several partitions, and you want the third partition
> to be an all-encompassing partition covering the whole device, then you
> would give it offset 0x0.  The cmdlinepart.c logic treats this the same as
> if you had not specified an offset, and instead tries to start the third
> partition after the end of your second partition.  This is because the logic
> uses zero as the "unspecified offset" value.  However, zero is not a good
> choice for "unspecified offset" -- it is quite valid as a "specified" offset.
> 
> The attached patch defines the "unspecified offset" value as 0xffffffff and
> makes the changes needed to support partitions that explicitly start at
> offset 0x0, but are not necessarily listed first on the cmdline.

I don't have any objections against your patch.  And seeing that it
was submitted at least three times without any other objections
either, it looks like it could go in.

And it also appears to indicate that few people care much about
cmdline.c. ;)

Any objections against inclusion?

Jörn

-- 
To recognize individual spam features you have to try to get into the
mind of the spammer, and frankly I want to spend as little time inside
the minds of spammers as possible.
-- Paul Graham
