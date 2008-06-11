Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K6JxJ-0003XM-ET
	for linux-mtd@lists.infradead.org; Wed, 11 Jun 2008 06:37:14 +0000
Message-ID: <484F7202.1010701@nokia.com>
Date: Wed, 11 Jun 2008 09:34:42 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Zhao Forrest <forrest.zhao@gmail.com>
Subject: Re: A question about UBIFS
References: <ac8af0be0806102116l5918c48ax279d456b4de1d061@mail.gmail.com>
In-Reply-To: <ac8af0be0806102116l5918c48ax279d456b4de1d061@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Artem.Bityutskiy@nokia.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Zhao Forrest wrote:
> Hi Artem,

Artem is on holiday til next week.

> I have a basic question about NAND flash page update in UBIFS/UBI,
> take the following as an example:
> 1 a NAND flash with page size of 4KB, erase block size of 256KB, so
> there're 64 pages within an erase block
> 2 page 0 - page 10 has invalid data content, page 11 - page 63 has
> valid data content from FS's point of view
> 3 UBIFS attempts to update(or rewrite) page 11

UBIFS does out-of-place updates. It never tries to update or rewrite
page 11. (Well, except in very rare circumstances that are not worth
going into)

> My question is how page 11 is updated by UBIFS/UBI?

As far as UBIFS goes, you need to learn about wandering trees and
garbage collection.

> I only read the design docs of UBI and guess that for this particular
> case a new physical eraseblock is got by UBI, then new content of page
> 11 is written to page 11 of new physical eraseblock, page 12 - page 63
> in original physical eraseblock are copied to new physical eraseblock,
> lastly the mapping between logical eraseblock and physical eraseblock
> is updated. Am I right?

Not for UBIFS.

> I know I omit many details in UBIFS/UBI for this updating operation.
> I'd like to know the cost of rewrite in UBIFS/UBI.

UBIFS rewrite is typically better than even JFFS2 - see
http://osl.sed.hu/wiki/ubifs/index.php/IOzone

Of course that assumes you are sync.ing the data.  UBIFS has writeback
which means rewrites will be much faster if you do not need to have
the data sync'ed.
