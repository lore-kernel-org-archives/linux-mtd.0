Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JzCRc-0000nH-SZ
	for linux-mtd@lists.infradead.org; Thu, 22 May 2008 15:11:05 +0000
Date: Thu, 22 May 2008 17:10:51 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Alex Dubov <oakad@yahoo.com>
Subject: Re: Support of removable MTD devices and other advanced features
	(follow-up from lkml)
Message-ID: <20080522151051.GA15015@logfs.org>
References: <20080521084144.GA20195@logfs.org>
	<612512.56176.qm@web36708.mail.mud.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <612512.56176.qm@web36708.mail.mud.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 21 May 2008 18:30:44 -0700, Alex Dubov wrote:
> 
> > So here is a lightly modified version of your mtd_request bits.  Apart
> > from reformatting and adding some documentation, the changes are:
> > 
> > - No flag for MTD_DATA, as this should be the default
> 
> # Nope. What about the case where you only want to read the oob (block scan) or
> have no data to transfer (block invalidate)? Of course, this "flags" field may
> be omitted outright, and the drivers could rely on error returned from
> mtd_get_buf/mtd_get_oob, but this may turn out awkward.

Fair enough.

> # You have to retain logical block address when using FTLs. This also makes
> "struct mtd_address" confusing - the offset applies the same both to physical
> and logical block. User level driver may want to fill in only logical block
> address + offset, FTL will put in the actual physical block.

But nothing below the FTL should ever know about a logical block at all.
Why pass it on?

> # And it's not clear to me why would you need pointer to data in the request
> struct. Data is delivered through the additional (quite often more than one)
> call to mtd_get_buf. I think, it's imperative to support fragmented buffers -
> block device often submits requests that are larger than eraseblock (can be
> read/written in one go) but fragmented across several memory buffers.

We can replace the data pointer with a struct bio_vec.  In fact, I am
wondering whether we could just use a struct bio instead of struct
mtd_request.

Jörn

-- 
Mundie uses a textbook tactic of manipulation: start with some
reasonable talk, and lead the audience to an unreasonable conclusion.
-- Bruce Perens
