Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PaSQL-0003Zl-DK
	for linux-mtd@lists.infradead.org; Wed, 05 Jan 2011 12:25:09 +0000
Message-ID: <4D2462F5.3020505@nokia.com>
Date: Wed, 05 Jan 2011 14:24:21 +0200
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 1/7] mtd: OneNAND: OMAP2/3: add support for command line
	partitioning
References: <20101213122042.20685.52929.sendpatchset@ahunter-work.research.nokia.com>	
	<20101213122051.20685.46383.sendpatchset@ahunter-work.research.nokia.com>	
	<1292421869.2512.56.camel@localhost>
	<4D244FD0.4010208@nokia.com> <1294229560.2179.20.camel@koala>
In-Reply-To: <1294229560.2179.20.camel@koala>
Content-Type: multipart/mixed; boundary="------------070206040603010806080204"
Cc: Tony Lindgren <tony@atomide.com>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------070206040603010806080204
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/01/11 14:12, ext Artem Bityutskiy wrote:
> On Wed, 2011-01-05 at 13:02 +0200, Adrian Hunter wrote:
>> On 15/12/10 16:04, ext Artem Bityutskiy wrote:
>>> On Mon, 2010-12-13 at 14:20 +0200, Adrian Hunter wrote:
>>>>    From d27a88c5f9f18a7c38784c085889c3e1053340cf Mon Sep 17 00:00:00 2001
>>>> From: Adrian Hunter<adrian.hunter@nokia.com>
>>>> Date: Wed, 30 Dec 2009 07:40:16 +0100
>>>> Subject: [PATCH 1/7] mtd: OneNAND: OMAP2/3: add support for command line partitioning
>>>>
>>>> Add the ability to parse MTD partition information from the
>>>> kernel command line.
>>>>
>>>> Note that a pointless BUG_ON is removed, as are redundant
>>>> calls to 'del_mtd_partitions()' and 'del_mtd_device()'
>>>> because they are also done by 'onenand_release()'.
>>>>
>>>> Finally note that 'add_mtd_device()' returns 1 on failure
>>>> so the error condition was incorrect.
>>>>
>>>> Signed-off-by: Adrian Hunter<adrian.hunter@nokia.com>
>>>
>>> I've pushed patches 1 and 7 to l2-mtd-2.6, but patch #2 is not
>>> applicable. I think this is because of changes Kyungmin made recently.
>>> Could you please re-send patches 2 and 3 on top of the l2 tree?
>>
>> I just tried to apply them to l2 and they applied fine as is.
>> Has something changed?  Do I have the wrong tree?
>
> Just tried to apply patch 2 which you re-sent on "Wed, 05 Jan 2011
> 13:02:40 +0200"

I guess the patches got munched.  Here they are tarred

>
> [dedekind@koala l2-mtd-2.6]$ git am -i -s ~/tmp/adrian.mbox
> Commit Body is:
> --------------------------
> mtd: OneNAND: add enable / disable methods to onenand_chip
>
>   From ece28a7fdec36fb40d60d35a5639326871c162f6 Mon Sep 17 00:00:00 2001
> From: Adrian Hunter<adrian.hunter@nokia.com>
> Date: Fri, 19 Feb 2010 15:39:52 +0100
> Subject: [PATCH V2 2/7] mtd: OneNAND: add enable / disable methods to
> onenand_chip
>
> Add enable / disable methods called from get_device() /
> release_device().
> These can be used, for example, to allow the driver to prevent the
> voltage
> regulator from being put to sleep while OneNAND is in use.
>
> Signed-off-by: Adrian Hunter<adrian.hunter@nokia.com>
> Signed-off-by: Artem Bityutskiy<Artem.Bityutskiy@nokia.com>
> --------------------------
> Apply? [y]es/[n]o/[e]dit/[v]iew patch/[a]ccept all e
> Commit Body is:
> --------------------------
> mtd: OneNAND: add enable / disable methods to onenand_chip
>
>   From ece28a7fdec36fb40d60d35a5639326871c162f6 Mon Sep 17 00:00:00 2001
> From: Adrian Hunter<adrian.hunter@nokia.com>
> Date: Fri, 19 Feb 2010 15:39:52 +0100
> Subject: [PATCH V2 2/7] mtd: OneNAND: add enable / disable methods to
> onenand_chip
>
> Add enable / disable methods called from get_device() /
> release_device().
> These can be used, for example, to allow the driver to prevent the
> voltage
> regulator from being put to sleep while OneNAND is in use.
>
> Signed-off-by: Adrian Hunter<adrian.hunter@nokia.com>
> Signed-off-by: Artem Bityutskiy<Artem.Bityutskiy@nokia.com>
> --------------------------
> Apply? [y]es/[n]o/[e]dit/[v]iew patch/[a]ccept all y
> Applying: mtd: OneNAND: add enable / disable methods to onenand_chip
> error: patch failed: drivers/mtd/onenand/onenand_base.c:948
> error: drivers/mtd/onenand/onenand_base.c: patch does not apply
> error: patch failed: include/linux/mtd/onenand.h:118
> error: include/linux/mtd/onenand.h: patch does not apply
> Patch failed at 0001 mtd: OneNAND: add enable / disable methods to
> onenand_chip
> When you have resolved this problem run "git am --resolved".
> If you would prefer to skip this patch, instead run "git am --skip".
> To restore the original branch and stop patching run "git am --abort".
> [dedekind@koala l2-mtd-2.6]$ patch -p1<  .git/rebase-apply/patch
> patching file drivers/mtd/onenand/onenand_base.c
> Hunk #1 FAILED at 948.
> Hunk #2 FAILED at 974.
> 2 out of 2 hunks FAILED -- saving rejects to file
> drivers/mtd/onenand/onenand_base.c.rej
> patching file include/linux/mtd/onenand.h
> Hunk #1 FAILED at 118.
> 1 out of 1 hunk FAILED -- saving rejects to file
> include/linux/mtd/onenand.h.rej
> [dedekind@koala l2-mtd-2.6]$ cat drivers/mtd/onenand/onenand_base.c.rej
> --- drivers/mtd/onenand/onenand_base.c
> +++ drivers/mtd/onenand/onenand_base.c
> @@ -948,6 +948,8 @@
>                  if (this->state == FL_READY) {
>                          this->state = new_state;
>                          spin_unlock(&this->chip_lock);
> +                       if (new_state != FL_PM_SUSPENDED&&
> this->enable)
> +                               this->enable(mtd);
>                          break;
>                  }
>                  if (new_state == FL_PM_SUSPENDED) {
> @@ -974,6 +976,8 @@
>    {
>          struct onenand_chip *this = mtd->priv;
>
> +       if (this->state != FL_PM_SUSPENDED&&  this->disable)
> +               this->disable(mtd);
>          /* Release the chip */
>          spin_lock(&this->chip_lock);
>          this->state = FL_READY;
> [dedekind@koala l2-mtd-2.6]$ cat include/linux/mtd/onenand.h.rej
> --- include/linux/mtd/onenand.h
> +++ include/linux/mtd/onenand.h
> @@ -118,6 +118,8 @@
>          int (*chip_probe)(struct mtd_info *mtd);
>          int (*block_markbad)(struct mtd_info *mtd, loff_t ofs);
>          int (*scan_bbt)(struct mtd_info *mtd);
> +       int (*enable)(struct mtd_info *mtd);
> +       int (*disable)(struct mtd_info *mtd);
>
>          struct completion       complete;
>          int                     irq;
> [dedekind@koala l2-mtd-2.6]$ git log
> commit 5fca82e7d3827249e840393fb28d19404d337fbf
> Author: Aleksandr Koltsoff<aleksandr.koltsoff@ebts.fi>
> Date:   Tue Jan 4 10:42:35 2011 +0200
>
>      mtd: m25p80: Fix JEDEC ID for AT26DF321
>
>      The last byte of the ID should be zero for this chip. Was added in
>      commit d0e8c47c58575b9131e786edb488fd029eba443e . Reported by Tomi
>      Varjo.
>
>      Signed-off-by: Aleksandr Koltsoff<aleksandr.koltsoff@ebts.fi>
>


--------------070206040603010806080204
Content-Type: application/x-gzip;
 name="huh.tar.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="huh.tar.gz"

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
tK/X/gP/CcS/ACgAAA==
--------------070206040603010806080204--
