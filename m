Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K88QR-0007qH-MS
	for linux-mtd@lists.infradead.org; Mon, 16 Jun 2008 06:42:48 +0000
Message-ID: <48560B69.4080704@nokia.com>
Date: Mon, 16 Jun 2008 09:42:49 +0300
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
MIME-Version: 1.0
To: Zhao Forrest <forrest.zhao@gmail.com>
Subject: Re: A question about UBIFS
References: <ac8af0be0806102116l5918c48ax279d456b4de1d061@mail.gmail.com>
In-Reply-To: <ac8af0be0806102116l5918c48ax279d456b4de1d061@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Zhao Forrest wrote:
> Hi Artem,
> I have a basic question about NAND flash page update in UBIFS/UBI,
> take the following as an example:
> 1 a NAND flash with page size of 4KB, erase block size of 256KB, so
> there're 64 pages within an erase block
> 2 page 0 - page 10 has invalid data content, page 11 - page 63 has
> valid data content from FS's point of view
> 3 UBIFS attempts to update(or rewrite) page 11
> My question is how page 11 is updated by UBIFS/UBI?
> I only read the design docs of UBI and guess that for this particular
> case a new physical eraseblock is got by UBI, then new content of page
> 11 is written to page 11 of new physical eraseblock, page 12 - page 63
> in original physical eraseblock are copied to new physical eraseblock,
> lastly the mapping between logical eraseblock and physical eraseblock
> is updated. Am I right?

Right. All updates are out-of-place.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
