Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fhj8u-0000Gx-30
 for linux-mtd@lists.infradead.org; Mon, 23 Jul 2018 22:17:37 +0000
Received: by mail-wm0-x241.google.com with SMTP id h20-v6so579026wmb.4
 for <linux-mtd@lists.infradead.org>; Mon, 23 Jul 2018 15:17:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87tvoppqwa.fsf@notabene.neil.brown.name>
References: <874lkmw54j.fsf@notabene.neil.brown.name>
 <61e255fa-ece4-5566-d63a-730aaa25f18c@gmail.com>
 <87sh85uzu3.fsf@notabene.neil.brown.name>
 <a3bb28f9-1185-3dbb-1a1f-1bfe03a8798c@gmail.com>
 <87efjnvpjl.fsf@notabene.neil.brown.name>
 <CAN8TOE9Pr2i4tXu8mGuY7xSY5bU_r7UhQ9SxfqYg_M4YDUt0ew@mail.gmail.com>
 <87tvoppqwa.fsf@notabene.neil.brown.name>
From: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 23 Jul 2018 15:17:11 -0700
Message-ID: <CAN8TOE-+XpeQ0eLEW3YdAGGtuw5reeuJRZvnMb+QquJycJWLQA@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: clear Extended Address Reg on switch to
 3-byte addressing.
To: NeilBrown <neil@brown.name>
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Neil,

On Mon, Jul 23, 2018 at 2:45 PM, NeilBrown <neil@brown.name> wrote:
> On Mon, Jul 23 2018, Brian Norris wrote:
>> On Mon, Apr 9, 2018 at 6:05 PM, NeilBrown <neil@brown.name> wrote:
>>> On Mon, Apr 09 2018, Marek Vasut wrote:
>>>> On 04/08/2018 11:56 PM, NeilBrown wrote:
>>>>> were added to Linux.  They appear to be designed to address a very
>>>>> similar situation to mine.  Unfortunately they aren't complete as the
>>>>> code to disable 4-byte addressing doesn't follow documented requirements
>>>>> (at least for winbond) and doesn't work as intended (at least in one
>>>>> case - mine). This code should either be fixed (e.g. with my patch), or removed.
>>
>> I would (and already did) vote for removal. The shutdown() hook just
>> papers over bugs and leads people to think that it is a good solution.
>> There's a reason we rejected such patches repeatedly in the past. This
>> one slipped through.
>
> Hi Brian,
>  thanks for your thoughts.
>  Could you just clarify what you see as the end-game.
>  Do you have an alternate approach which can provide reliability for the
>  various hardware which currently seems to need these patches?
>  Or do you propose that people with this hardware should suffer
>  a measurably lower level of reliability than they currently enjoy?

I'd suggest following the original thread, which I resurrected:

[PATCHv3 2/2] mtd: m25p80: restore the status of SPI flash when exiting
https://lkml.org/lkml/2018/7/23/1207
https://patchwork.ozlabs.org/patch/845022/

I suppose I could CC you on future replies...

My current summary: I'd prefer the hack be much more narrowly applied,
with a big warning, if we apply it at all. But if we don't merge
something to narrow the use of the hack, then yes, I'd prefer a
degraded experience for crappy products over today's status quo.

Brian
