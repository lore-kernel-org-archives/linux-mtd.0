Received: from mail.fh-wedel.de ([213.39.232.194])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Al8jh-00011W-Cm
	for linux-mtd@lists.infradead.org; Mon, 26 Jan 2004 15:33:13 +0000
Date: Mon, 26 Jan 2004 16:32:48 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20040126153248.GA8856@wohnheim.fh-wedel.de>
References: <m3u12jr8y4.fsf@maxwell.lnxi.com>
	<1075099329.17157.97.camel@lapdancer.baythorne.internal>
	<m3bror89u9.fsf@maxwell.lnxi.com>
	<1075102799.17157.209.camel@lapdancer.baythorne.internal>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1075102799.17157.209.camel@lapdancer.baythorne.internal>
cc: linux-mtd@lists.infradead.org
cc: "Eric W. Biederman" <ebiederman@lnxi.com>
Subject: Re: Q: Filesystem choice..
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 26 January 2004 07:40:00 +0000, David Woodhouse wrote:
>
> You want resv_blocks_write to be larger than resv_blocks_deletion, and I
> suspect you could get away with values of 2 and 1.5 respectively, if we
> were counting bytes rather than whole eraseblocks.

Hmm.  Any special reason, why you don't always count in bytes?  That
would even remove code, such as this line:

>         size += c->sector_size - 1; /* ... and round up */

Jörn

-- 
Write programs that do one thing and do it well. Write programs to work
together. Write programs to handle text streams, because that is a
universal interface. 
-- Doug MacIlroy
