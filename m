Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W83Jo-00060z-Ny
 for linux-mtd@lists.infradead.org; Tue, 28 Jan 2014 07:42:50 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH v1 0/2] mtd: nand: omap: booting from NAND using u-boot
Date: Tue, 28 Jan 2014 07:42:09 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA6B567@DBDE04.ent.ti.com>
References: <1386925978-23705-1-git-send-email-pekon@ti.com>
 <20140125085537.GA3162@norris-Latitude-E6410>
In-Reply-To: <20140125085537.GA3162@norris-Latitude-E6410>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Artem Bityutskiy <dedekind1@gmail.com>, "Balbi, Felipe" <balbi@ti.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Enric Balletbo Serra <eballetbo@iseebcn.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-omap <linux-omap@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

>From: Brian Norris
>
>Hi Pekon,
>
>Sorry, I'm revisiting your patch series a bit late. There are a few
>factors that contributed to this, though.
>
>1. This patch series talks extensively about U-Boot. U-Boot is not my
>   interest, nor should it be the focus of kernel (driver) development.
>   Any work done here should be framed in the kernel driver context. [1]
>
>2. You have previously CC'd me on U-Boot patches. Or at least, I think
>   so. More about this in the next point...
>
>3. The U-Boot source code structure is rather similar to pieces of Linux
>   subsystems. So without additional effort, it is hard to discern
>   whether a patch is intended for Linux MTD or U-Boot MTD.
>
>4. You cross-posted to both the U-Boot and Linux-MTD mailing lists.
>
>So the sum of all this is that I ignored these patches at first, as they
>weren't clearly intended for me.
>
>On Fri, Dec 13, 2013 at 02:42:56PM +0530, Pekon Gupta wrote:
>> As there were parallel set of patches running between u-boot and kernel.
>
>I don't know what patches you're talking about.
>
Following patch-sets touched ecc.layout while cleaning up OMAP NAND driver.
u-boot: http://lists.denx.de/pipermail/u-boot/2013-November/167551.html
kernel: http://lists.infradead.org/pipermail/linux-mtd/2013-October/049414.=
html


>> hence, some patch-sets caused regression for OMAP3x platforms when booti=
ng
>
>"Hence" is not the right word. The previous sentence doesn't imply that
>there were regressions.
>
>> using u-boot specifically for ecc-schemes (like BCH4_SW).
>
>Huh? What does "specifically for ecc-schemes" mean? You mean that only
>some schemes had regressions? Can you be more specific? What are these
>regressions?
>
It was reported by Enric Balletbo Serra <eballetbo@iseebcn.com> [2] that
when using 'OMAP_ECC_BCH8_CODE_HW_DETECTION_SW' ecc-scheme
there was a mismatch in ECC layout between mainline u-boot and kernel.
This caused boot failure when kernel tried to mount UBIFS with image
flashed from u-boot.

This was missed while testing earlier patch-sets because only OMAP3 boards
use above ecc-scheme as OMAP3 SoC do not have ELM hardware engine.
All the later platforms use 'OMAP_ECC_BCH8_CODE_HW' ecc-scheme.
Both ecc-scheme are based on same algorithm of BCH8 ECC code except that:
(1) 'OMAP_ECC_BCH8_CODE_HW_DETECTION_SW' uses /lib/bch.c software
library for ecc-correction.
(2) 'OMAP_ECC_BCH8_CODE_HW' uses ELM hardware engine for ecc-correction.

This regression affects following ecc-schemes, as ecc.layout logic is just
copy-paste of each-other.
- 'OMAP_ECC_BCH4_CODE_HW_DETECTION_SW' and
- 'OMAP_ECC_BCH8_CODE_HW_DETECTION_SW'


>The rest of this cover letter (and most of the patch descriptions)
>describes the configurations and testing (which is all very good, don't
>get me wrong), with a lot of focus on things I don't follow (namely,
>U-Boot), but you omit many of the important details, like
>
> * What is the regression? I honestly don't see a description of the
>   actual regression. (I can read the code to intuit that, but what's
>   the point of your pages of description if it doesn't mention this?)
>   Please give some logical description of the problem
>
[Patch 1/2] of this series actually simplification of 'ecclayout->oobfree->=
offset'
It does not fix the regression, but it's important to clean it, before any =
new
feature additions.
[Patch 2/2] Actually fixes the regression for affected ecc-schemes. But
"this patch also touches other ecc-schemes as the fix required
 refactoring common code, into ecc-scheme specific code."


> * What are the effects of the regression? ECC bytes in the wrong place,
>   so you see correction failures/corruption? JFFS2 failures? (The
>   "oobfree" changes, for instance, should only affect something like
>   JFFS2.)
>
As mentioned above [PATCH 1/2] which touches 'ecclayout->oobfree->offset'
is a clean-up not affecting regression, but it should be taken in before
any further feature or ecc-scheme changes.
Now, what is your preference?
(a)  Take [PATCH 1/2] ecc.layout clean-up separately.
(b) Take ecc.layout as part of this series, but may be with different patch=
 title.


> * What Linux commit caused the regression?
> * Should this patch set be marked for -stable? And for what kernel
>   release? (the previous question would help answer this)
>
This regression was caused in=20
	commit b491da7233d5dc1a24d46ca1ad0209900329c5d0
	 mtd: nand: omap: clean-up ecc layout for BCH ecc schemes
So, this should be applicable from 3.13.x+


>> Hence this patch series fixes those regressions, and tests complete
>[...] snip
>
>I'm preparing a 3.14 pull request soon, and since you seem committed to
>fixing and properly testing a known regression here, I'd like to see
>this go in. But given the late timing and the unanswered questions, I
>think it's unlikely to go in -rc1. Perhaps I can send a later pull
>request if we can get it together properly.
>
Yes, if the above details are sufficient, then I'll:
(1) re-word [PATCH 1/2] commit log & title to mention that it's a clean-up
(2) Add above description and details of regression into commit log of [PAT=
CH 2/2]
(3) Include your other comments on individual patches.


>So I'd like to first of all get a few answers to my questions, and then
>I think we might want to refresh this patch series with a little better
>commit messages and perhaps a separate documentation file (not
>necessarily in the same patch series, as the fix is more urgent).
>
Yes, I plan to get some documentation in kernel docs. But for now
I do have a 'un-polished' page for OMAP NAND driver on TI wiki [3].
Please let me know if you would like something similar for kernel docs.

I'm happy that you are scrutinizing each patch and their commit logs wisely=
.
Thanks much for that. This helps me and probably everyone else to tighten-u=
p
so that only good quality patch-sets go in. This eventually will make the
sub-system and the drivers more stable for long-term.

Also, if you don't mind, I'll still continue to cross-post this particular
Patch-series on both u-boot and kernel mailing lists just to maintain
continuity, as I know there are lot of OMAP3 users which are following
only one of the two lists.. (but I'm cutting down on the CC list).
I'll avoid cross posting in future.


>Brian
>
>   [1] For instance, rather than saying "the ECC layout doesn't match
>   U-Boot", you should probably describe what the intended ECC layout
>   should look like and show that Linux does not match it. Perhaps it's
>   time for some better documentation, like Ezequiel stashed under
>   Documentation/mtd/nand/ for pxa3xx. You could also take some cues
>   from Huang's comments on ECC layouts, etc., in gpmi-nand.c.


[2] http://lists.denx.de/pipermail/u-boot/2013-December/168440.html
[3] https://processors.wiki.ti.com/index.php/Linux_Core_NAND_User%27s_Guide=
 (under construction)


with regards, pekon
