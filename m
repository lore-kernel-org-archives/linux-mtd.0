Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmMZg-0006EK-3L
 for linux-mtd@lists.infradead.org; Mon, 19 May 2014 12:21:48 +0000
Date: Mon, 19 May 2014 09:20:52 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH v2] mtd: nand: omap: fix BCHx ecc.correct to return
 detected bit-flips in erased-page
Message-ID: <20140519122052.GA698@arch.cereza>
References: <1395730699-14687-1-git-send-email-pekon@ti.com>
 <20140512203626.GS28907@ld-irv-0074>
 <20980858CB6D3A4BAE95CA194937D5E73EACDE66@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EACDE66@DBDE04.ent.ti.com>
Cc: Stefan Roese <sr@denx.de>, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pekon,

On 19 May 05:00 AM, Gupta, Pekon wrote:
> >From: Brian Norris [mailto:computersforpeace@gmail.com]
> >
> >On Tue, Mar 25, 2014 at 12:28:19PM +0530, Pekon Gupta wrote:
> >> fixes: commit 62116e5171e00f85a8d53f76e45b84423c89ff34
> >>        mtd: nand: omap2: Support for hardware BCH error correction.
> >>
> >> In omap_elm_correct_data(), if bitflip_count in an erased-page is within the
> >> correctable limit (< ecc.strength), then it is not indicated back to the caller
> >> ecc->read_page().
> >> This mis-guides upper layers like MTD and UBIFS layer to assume erased-page as
> >> perfectly clean and use it for writing even if actual bitflip_count was
> >> dangerously high (bitflip_count > mtd->bitflip_threshold).
> >>
> >> This patch fixes this above issue, by returning 'stats' to caller
> >> ecc->read_page() under all scenarios.
> >>
> >> Reported-by: Brian Norris <computersforpeace@gmail.com>
> >> Signed-off-by: Pekon Gupta <pekon@ti.com>
> >
> >Pushed to l2-mtd.git. Thanks!
> >
> 
> Just forgot to ask, Is this patch candidate for stable? 
> 
> This one fixes the long standing issue of returning bit-flip count of an
> erased-page to upper layers. So that upper layers take correct decision.
> 

Yes, if the commit fixes a bug then it can be marked for stable.
There's some instructions on this subject, please take a look at [1] and [2].
I think this patch qualifies the stable rules.

In particular, if a patch fixes a bug and you know the culprit commit you
can add a Fixes tag to pass such information, with a 12-digit commit ID and
the commit title enclosed in double-quotes [1]:

  Fixes: 62116e5171e0 ("mtd: nand: omap2: Support for hardware BCH error correction")

To mark it for stable [2], you need add a Cc tag like this:

  Cc: <stable@vger.kernel.org> # 3.x.y

You can use something like this to find the releases that contain the bug:

git tag -l --contains 62116e5171e0 | grep ^v3

It's handy to add that as a git alias:

[alias]
  ..
  ontags = !sh -c 'git tag -l --contains $1 | grep ^v[23]' -

However, now that Brian has pushed the patch, you don't need to do any of
this. AFAIK, maintainers usually take care of all the above.

[1] Documentation/SubmittingPatches
[2] Documentation/stable_kernel_rules.txt.

Hope this helps,
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
