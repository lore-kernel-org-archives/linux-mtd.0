Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K37Vj-0007nX-D8
	for linux-mtd@lists.infradead.org; Mon, 02 Jun 2008 10:43:31 +0000
Date: Mon, 2 Jun 2008 11:43:30 +0100
From: Jamie Lokier <jamie@shareable.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: big flash disks?
Message-ID: <20080602104330.GD31032@shareable.org>
References: <20080601184239.GA11135@shareable.org>
	<1212386359.31023.154.camel@sauron>
	<20080602082346.GB20259@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080602082346.GB20259@logfs.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel wrote:
> At the moment, the flash one can sensibly attach to a notebook is an
> SSD with SATA interface.  It has a bunch of disadvantages and there is
> no point in listing them all.  But it is the reality and denying it
> doesn't change that.  And this reality is the reason why logfs needs
> another format change and Linus doesn't want to have it merged yet.
> Making it perform well on SSDs comes first. :)

I'm surprised.
What sort of format change does SSD require, relative to NOR/NAND flash?

For SSD I would like to see a filesystem that combines the best
characteristics of btrfs and logfs - the are enough similarities
between them.

-- Jamie
