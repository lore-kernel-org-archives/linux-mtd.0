Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JzxzM-0000s9-62
	for linux-mtd@lists.infradead.org; Sat, 24 May 2008 17:57:05 +0000
Date: Sat, 24 May 2008 19:56:48 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Alex Dubov <oakad@yahoo.com>
Subject: Re: Support of removable MTD devices and other advanced features
	(follow-up from lkml)
Message-ID: <20080524175647.GA7366@logfs.org>
References: <20080523132853.GC22384@logfs.org>
	<380082.38285.qm@web36708.mail.mud.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <380082.38285.qm@web36708.mail.mud.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 24 May 2008 06:12:23 -0700, Alex Dubov wrote:
> 
> Do UBI and JFFS always operate in terms of whole eraseblocks or they may
> attempt  partial block writes? Different flash chips have different
> capabilities in regard to writing and this can be used to some advantage.

Writes happen in multiples of mtd->writesize.  Which for NAND is
pagesize.  There are also special cases with subpage writes.  AFAIK only
UBI exploits that feature.

Jörn

-- 
Joern's library part 15:
http://www.knosof.co.uk/cbook/accu06a.pdf
