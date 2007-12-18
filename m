Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J4dRS-0007UE-5h
	for linux-mtd@lists.infradead.org; Tue, 18 Dec 2007 14:29:12 +0000
Date: Tue, 18 Dec 2007 15:23:35 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Alexey Korolev <akorolev@infradead.org>
Subject: Re: Limited support of NAND features in MTD.
Message-ID: <20071218142335.GD1741@lazybastard.org>
References: <Pine.LNX.4.64.0712121107010.19025@pentafluge.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.64.0712121107010.19025@pentafluge.infradead.org>
Cc: dwmw2@infradead.org, joern@logfs.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 12 December 2007 11:51:40 +0000, Alexey Korolev wrote:
> 
> It is not a secret that current MTD supports very limited set of NAND
> features. Some of missed features like partial page read or cached read
> are able to improve file system performance and its implementation do
> not require s/w redesign. 

What does cached read do?

Another feature that could become useful would be the on-chip copying.
With JFFS2 this is rare, but when doing GC or wear leveling in a fashion
that keeps certain alignments intact, it could improve performance.

Jörn

-- 
The cost of changing business rules is much more expensive for software
than for a secretaty.
-- unknown
