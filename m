Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K8wdd-00053N-Ot
	for linux-mtd@lists.infradead.org; Wed, 18 Jun 2008 12:19:46 +0000
Date: Wed, 18 Jun 2008 13:19:36 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Iwo Mergler <iwo@call-direct.com.au>
Subject: Re: [BUG] JFFS2 power loss recovery issues on NAND
Message-ID: <20080618121936.GD305@shareable.org>
References: <alpine.LFD.1.10.0806101438520.27550@casper.infradead.org>
	<48570D5A.1050906@call-direct.com.au> <48577212.9070004@parrot.com>
	<48584DE9.3000709@call-direct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48584DE9.3000709@call-direct.com.au>
Cc: linux-mtd@lists.infradead.org, joern@logfs.org, dwmw2@infradead.org,
	Alexey Korolev <akorolev@infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Iwo Mergler wrote:
> Forgive my ignorance - does that mean that not everything in JFFS2 is 
> CRC protected?

I think every _individual_ record is CRC protected in JFFS2

_But_ that doesn't always detect file corruption.  If JFFS2 records
don't match their CRC, they are treated as if not there.

If there's corrupt data records, that causes holes in files.  There's
no I/O error reported to the application, just blocks of zero bytes.

There's no mechanism in JFFS2 to detect that.  It requires checksums
at a higher level than individual records.

-- Jamie
