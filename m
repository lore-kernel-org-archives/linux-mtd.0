Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YqUcQ-0008HP-Ao
 for linux-mtd@lists.infradead.org; Thu, 07 May 2015 22:50:14 +0000
Received: by pabsx10 with SMTP id sx10so52130087pab.3
 for <linux-mtd@lists.infradead.org>; Thu, 07 May 2015 15:49:53 -0700 (PDT)
Date: Thu, 7 May 2015 15:49:46 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] mtd: m25p80: remove unused flash entries from id_table
Message-ID: <20150507224946.GS32500@ld-irv-0074>
References: <1428395981-21012-1-git-send-email-zajec5@gmail.com>
 <20150407175406.GK32500@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20150407175406.GK32500@ld-irv-0074>
Cc: Marek Vasut <marex@denx.de>, Ben Hutchings <ben@decadent.org.uk>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 Ian Campbell <ijc@hellion.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 07, 2015 at 10:54:06AM -0700, Brian Norris wrote:
> + a few others, some who have had trouble with DT on this driver
> 
> On Tue, Apr 07, 2015 at 10:39:41AM +0200, Rafał Miłecki wrote:
> > We had many entries that were recently added just to allow selecting
> > some flashes directly but were never used. They weren't providing any
> > special flash handling, we just needed them due to the lack of some
> > generic binding string.
> > 
> > With the introduction of "nor-jedec" (in 1103b85) they won't be needed
> > unless we discover some faulty flash requiring workarounds.
> > As explained in m25p80 DT documentation we require specifying
> > "nor-jedec" now as less specific compatible entry.
> > 
> > Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
> > ---
> > To verify list of removed entries by yourself:
> > egrep -R "at25fs010|at25fs040|at25df041a|at26f004|at26df161a|at26df321|at45db081d" ./
> > egrep -R "en25f32|en25p32|en25q32b|en25p64|en25q64|en25qh128|en25qh256" ./
> > egrep -R "f25l32pa" ./
> > egrep -R "mr25h10" ./
> > egrep -R "gd25q32|gd25q64" ./
> > egrep -R "160s33b|320s33b|640s33b" ./
> > egrep -R "mx25l2005a|mx25l8005|mx25l3205d|mx25l3255e|mx25l12855e|mx25l25655e|mx66l1g55g" ./
> > egrep -R "n25q256a|n25q512ax3|n25q00" ./
> > egrep -R "pm25lv512|pm25lv010|pm25lq032" ./
> > egrep -R "s25sl032p|s25sl064p|s25fl256s0|s70fl01gs|s25sl12800|s25fl129p0|s25fl129p1|s25sl004a|s25sl008a|s25sl016a|s25sl032a|s25fl016k|s25fl132k" ./
> > egrep -R "sst25vf080b|sst25vf064c|sst25wf512|sst25wf010|sst25wf020" ./*
> > egrep -R "m25p05|m25p20|n25q032|m25pe20|m25pe80|m25pe16|m25px16|m25px32|m25px32-s0|m25px32-s1|m25px80" ./
> > egrep -R "m45pe10|m45pe80|m45pe16" ./
> > egrep -R "w25x10|w25x20|w25x40|w25x64|w25q64|w25q80" ./
> > egrep -R "cat25c11|cat25c03|cat25c09|cat25c17|cat25128" ./
> 
> The thing is, the kernel tree is not necessarily the definitive source
> for device tree files. Just because no one's using these in the kernel
> DTS (or board) files doesn't mean no one can. People can maintain
> out-of-tree DTS files, and even bake them into their firmware, as long
> as they use the standard bindings. That's kinda why DT becomes ABI...
> 
> That said, I don't expect most people using this could expect that kind
> of stability with the current situation (and that's why we'd like to
> improve it). And I think the Debian folks who tripped over the m25p80
> bindings were using the kernel-provided device trees. So I might be OK
> with this. I'd like to see if anyone else has comment to the contrary,
> though.

No objections, so pushed to l2-mtd.git. Thanks.

Brian
