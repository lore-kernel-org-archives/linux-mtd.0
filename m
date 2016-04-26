Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auvOD-0001ju-FQ
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 05:18:26 +0000
Subject: Re: [U-Boot] Porting Linux's MTD/NAND changes into U-Boot
To: Tom Rini <trini@konsulko.com>
References: <20160425164314.15c3fc94@bbrezillon>
 <20160425173646.GM3732@bill-the-cat>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marex@denx.de>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Scott Wood <oss@buserror.net>,
 u-boot@lists.denx.de,
 "linux-sunxi@googlegroups.com" <linux-sunxi@googlegroups.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Scott Wood <scottwood@freescale.com>, Alexander Kaplan <alex@nextthing.co>,
 Brian Norris <computersforpeace@gmail.com>
Reply-To: hs@denx.de
From: Heiko Schocher <hs@denx.de>
Message-ID: <571EFA04.4000803@denx.de>
Date: Tue, 26 Apr 2016 07:17:56 +0200
MIME-Version: 1.0
In-Reply-To: <20160425173646.GM3732@bill-the-cat>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Tom, Boris,

Am 25.04.2016 um 19:36 schrieb Tom Rini:
> On Mon, Apr 25, 2016 at 04:43:14PM +0200, Boris Brezillon wrote:
>
>> Hi Scott,
>>
>> I've recently contributed a lot of MTD/NAND related patches (and intend
>> to continue doing so). Some of them are transversal changes touching the
>> MTD and NAND framework internals, which implies patching all NAND
>> drivers along with the core changes.
>>
>> All those changes are required to properly handle modern NANDs (MLC/TLC
>> NANDs), and I need them to add proper NAND support to the sunxi
>> platform (and more particularly to the C.H.I.P from NextThing Co.).
>>
>> So my question is, how should I port those changes to U-Boot? I see
>> that your doing "synchronization commits", but in my case this mean
>> including a bunch of driver specific changes into this "sync commit".
>>
>> I think it's also worth mentioning that I plan to heavily rework the
>> Linux NAND framework to improve NAND performances on modern NAND
>> controllers and clarify the NAND chip / NAND controller concepts, and
>> other people are also working on merging the BBT code of the NAND and
>> OneNAND framework. Which unfortunately means that we're not done porting
>> invasive changes to U-Boot :-/.
>>
>> Any advice is welcome.
>
> I suppose my first suggestion would be to sync the kernel back into
> U-Boot more frequently.  With our bi-monthly release cycle it shouldn't
> be too hard to pick a window to grab the current kernel release and
> bring it over.  I think the more stuff we let build up prior to syncing
> the harder it will be.

Yes, the same applies for UBI/UBIFS. I have no real strategy yet for
this. I think also, we need when doing such a sync a better testframe-
work, which tests on ideally a lot of boards the new versions ...

Without this, it is very difficult not to break existing boards with
such a sync ... especially MTD is tricky, I think, because a lot of
boards use it ...

I know I am nerving with my tbot [1], but it is may a solution for this.

Also, as the UBI/UIFS case may show, it is not always a trivial job
to do such a sync, as concepts in Linux changes ...

bye,
Heiko
[1] https://github.com/hsdenx/tbot
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
