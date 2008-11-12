Received: from rn-out-0910.google.com ([64.233.170.191])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L0IG9-0002eC-Gs
	for linux-mtd@lists.infradead.org; Wed, 12 Nov 2008 16:08:01 +0000
Received: by rn-out-0910.google.com with SMTP id m7so442046rnd.3
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 Nov 2008 08:08:00 -0800 (PST)
Message-ID: <8bd0f97a0811120808p5858d5adleeef43b1d374bee1@mail.gmail.com>
Date: Wed, 12 Nov 2008 11:08:00 -0500
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "Atsushi Nemoto" <anemo@mba.ocn.ne.jp>
Subject: Re: [PATCH] physmap: Fix leak of memory returned by
	parse_mtd_partitions
In-Reply-To: <20081113.005534.56563769.anemo@mba.ocn.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20081112.235733.01917391.anemo@mba.ocn.ne.jp>
	<20081113.005534.56563769.anemo@mba.ocn.ne.jp>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 12, 2008 at 10:55, Atsushi Nemoto wrote:
> On Wed, 12 Nov 2008 23:57:33 +0900 (JST), Atsushi Nemoto wrote:
>> The mtd partition parser returns an allocated pointer array of
>> mtd_partition.  The caller must free it.  The array is used only for
>> add_mtd_partitions(), so free it just after the call.
>>
>> Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
>> ---
>>  drivers/mtd/maps/physmap.c |   17 ++++++++---------
>>  1 files changed, 8 insertions(+), 9 deletions(-)
>
> And many other callers of parse_mtd_partitions() also do not free the
> returned memory.  With a quick look, 21 of 36 have same defect.

i wonder why we duplicate this same code block in so many places.  and
why does every driver have to declare its own list of parsers ?  cant
we unify all of these in one place ?

> drivers/mtd/maps/bfin-async-flash.c

i can fix this one if no one else gets to it
-mikex
