Received: from rv-out-0708.google.com ([209.85.198.242])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K6Hks-0003Ki-Mu
	for linux-mtd@lists.infradead.org; Wed, 11 Jun 2008 04:16:14 +0000
Received: by rv-out-0708.google.com with SMTP id b17so3938475rvf.42
	for <linux-mtd@lists.infradead.org>;
	Tue, 10 Jun 2008 21:16:13 -0700 (PDT)
Message-ID: <ac8af0be0806102116l5918c48ax279d456b4de1d061@mail.gmail.com>
Date: Wed, 11 Jun 2008 12:16:12 +0800
From: "Zhao Forrest" <forrest.zhao@gmail.com>
To: Artem.Bityutskiy@nokia.com
Subject: A question about UBIFS
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,
I have a basic question about NAND flash page update in UBIFS/UBI,
take the following as an example:
1 a NAND flash with page size of 4KB, erase block size of 256KB, so
there're 64 pages within an erase block
2 page 0 - page 10 has invalid data content, page 11 - page 63 has
valid data content from FS's point of view
3 UBIFS attempts to update(or rewrite) page 11
My question is how page 11 is updated by UBIFS/UBI?
I only read the design docs of UBI and guess that for this particular
case a new physical eraseblock is got by UBI, then new content of page
11 is written to page 11 of new physical eraseblock, page 12 - page 63
in original physical eraseblock are copied to new physical eraseblock,
lastly the mapping between logical eraseblock and physical eraseblock
is updated. Am I right?
I know I omit many details in UBIFS/UBI for this updating operation.
I'd like to know the cost of rewrite in UBIFS/UBI.

Thanks,
Forrest
