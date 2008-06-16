Received: from wa-out-1112.google.com ([209.85.146.180])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K88xd-0000jj-HP
	for linux-mtd@lists.infradead.org; Mon, 16 Jun 2008 07:17:06 +0000
Received: by wa-out-1112.google.com with SMTP id v33so3593115wah.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 16 Jun 2008 00:16:58 -0700 (PDT)
Message-ID: <ac8af0be0806160016p85be687n50110e2b9ce637df@mail.gmail.com>
Date: Mon, 16 Jun 2008 15:16:58 +0800
From: "Zhao Forrest" <forrest.zhao@gmail.com>
To: Artem.Bityutskiy@nokia.com
Subject: Re: A question about UBIFS
In-Reply-To: <48560B69.4080704@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <ac8af0be0806102116l5918c48ax279d456b4de1d061@mail.gmail.com>
	<48560B69.4080704@nokia.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 16, 2008 at 2:42 PM, Artem Bityutskiy
<Artem.Bityutskiy@nokia.com> wrote:
> Hi,
>
> Zhao Forrest wrote:
>>
>> Hi Artem,
>> I have a basic question about NAND flash page update in UBIFS/UBI,
>> take the following as an example:
>> 1 a NAND flash with page size of 4KB, erase block size of 256KB, so
>> there're 64 pages within an erase block
>> 2 page 0 - page 10 has invalid data content, page 11 - page 63 has
>> valid data content from FS's point of view
>> 3 UBIFS attempts to update(or rewrite) page 11
>> My question is how page 11 is updated by UBIFS/UBI?
>> I only read the design docs of UBI and guess that for this particular
>> case a new physical eraseblock is got by UBI, then new content of page
>> 11 is written to page 11 of new physical eraseblock, page 12 - page 63
>> in original physical eraseblock are copied to new physical eraseblock,
>> lastly the mapping between logical eraseblock and physical eraseblock
>> is updated. Am I right?
>
> Right. All updates are out-of-place.
>
So when only page 11 is rewritten, are pages 12-63 rewritten at the same time?
Or page 11 is updated by wandering tree mechanism, and pages 12-63 are
untouched?

Thanks,
Forrest
