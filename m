Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Q1WE-0002Wz-TK
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 10:03:46 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Pantelis Antoniou <panto@intracom.gr>
In-Reply-To: <3EE6EF42.7030405@intracom.gr>
References: <3EE6EBA0.3080508@intracom.gr>
	 <1055321465.2097.9.camel@passion.cambridge.redhat.com>
	 <3EE6EF42.7030405@intracom.gr>
Message-Id: <1055322260.2097.13.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 11 Jun 2003 10:04:20 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Cram FS on NAND - How to do this?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-06-11 at 09:58, Pantelis Antoniou wrote:
> That is a valid approach.
> 
> I take it that you mean a new MTD block device over NAND that
> automatically skips over bad blocks and presents an error free
> block interface for use by read only filesystems.

Basically, yes. You can then either require the use of a special
userspace tool to program the file system images onto the flash, or
perhaps you could implement it as a writable block device, in the
expectation that people don't _actually_ use it in write mode in
production.

-- 
dwmw2
