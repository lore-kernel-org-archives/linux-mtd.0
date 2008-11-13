Received: from wf-out-1314.google.com ([209.85.200.172])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L0dQo-0006hj-O2
	for linux-mtd@lists.infradead.org; Thu, 13 Nov 2008 14:44:26 +0000
Received: by wf-out-1314.google.com with SMTP id 28so897026wfc.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 13 Nov 2008 06:44:25 -0800 (PST)
Message-ID: <8bd0f97a0811130644q47260290pdf5af54dd8967af9@mail.gmail.com>
Date: Thu, 13 Nov 2008 09:44:25 -0500
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "Atsushi Nemoto" <anemo@mba.ocn.ne.jp>
Subject: Re: [PATCH] mtd/physmap: use parse_mtd()
In-Reply-To: <20081113.225101.14979944.anemo@mba.ocn.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1226533133-7405-1-git-send-email-vapier@gentoo.org>
	<1226533189-8492-1-git-send-email-vapier@gentoo.org>
	<20081113.225101.14979944.anemo@mba.ocn.ne.jp>
Cc: linux-mtd@lists.infradead.org, vapier@gentoo.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 13, 2008 at 08:51, Atsushi Nemoto wrote:
> On Wed, 12 Nov 2008 18:39:48 -0500, Mike Frysinger wrote:
>> Call parse_mtd() to handle partition/device registration rather than doing
>> it all ourself.
>>
>> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
>> ---
>>  drivers/mtd/maps/physmap.c |   21 +--------------------
>>  1 files changed, 1 insertions(+), 20 deletions(-)
>
> You should adjust physmap_flash_remove() too.
>
> * remove kfree(info->parts)
> * call del_mtd_partitions() or del_mtd_device()
>
> Maybe del_parsed_mtd() or something is required?

yeah, this last bit sounds good
-mike
