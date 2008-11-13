Received: from wf-out-1314.google.com ([209.85.200.169])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L0dXD-0007ud-1t
	for linux-mtd@lists.infradead.org; Thu, 13 Nov 2008 14:51:03 +0000
Received: by wf-out-1314.google.com with SMTP id 28so899272wfc.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 13 Nov 2008 06:51:02 -0800 (PST)
Message-ID: <8bd0f97a0811130651k11c52a53j91c80cf196e9f66a@mail.gmail.com>
Date: Thu, 13 Nov 2008 09:51:01 -0500
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "Atsushi Nemoto" <anemo@mba.ocn.ne.jp>
Subject: Re: [PATCH] mtd: unify mtd partition/device registration
In-Reply-To: <20081113.232823.125897716.anemo@mba.ocn.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1226533133-7405-1-git-send-email-vapier@gentoo.org>
	<20081113.224350.18312549.anemo@mba.ocn.ne.jp>
	<20081113.232823.125897716.anemo@mba.ocn.ne.jp>
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

On Thu, Nov 13, 2008 at 09:28, Atsushi Nemoto wrote:
> On Thu, 13 Nov 2008 22:43:50 +0900 (JST), Atsushi Nemoto wrote:
>> On Wed, 12 Nov 2008 18:38:53 -0500, Mike Frysinger wrote:
>> > Rather than having every map/mtd driver doing the same sequence of
>> > registering partitions and/or devices, implement common parse_mtd().
>> >
>> > Signed-off-by: Mike Frysinger <vapier@gentoo.org>
>> > ---
>> >  drivers/mtd/mtdcore.c   |   37 +++++++++++++++++++++++++++++++++++++
>> >  include/linux/mtd/mtd.h |    3 +++
>> >  2 files changed, 40 insertions(+), 0 deletions(-)
>>
>> I like this idea.
>
> Some drivers call both add_mtd_device() and add_mtd_partitions().  The
> mtd_device is used to access whole flash area (like /dev/hda).  How do
> you think of these usage patterns?
>
> maps/edb7312.c
> maps/mbx860.c
> maps/plat-ram.c
> nand/cafe_nand.c
> nand/diskonchip.c
> nand/ndfc.c
>
> Automatic fallback to mtd_device in parse_mtd() is convenient but
> somewhat unflexible...

we could just have it do it all the time.  i dont see a problem with
exposing the entire block device the whole time ?  i know for the
driver or two of mine, i'm fine with it.

...
       ret = parse_mtd_partitions(mtd, probe_types, &parts, 0);
       if (ret > 0) {
               ret = add_mtd_partitions(mtd, parts, ret);
               kfree(parts);
       } else if (nr_parts)
               ret = add_mtd_partitions(mtd, parts, nr_parts);
       if (ret)
               return ret;
#endif

       return add_mtd_device(mtd);
-mike
