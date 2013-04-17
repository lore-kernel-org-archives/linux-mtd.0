Received: from mail-ve0-f178.google.com ([209.85.128.178])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1USJTw-00046k-2m
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2013 03:56:29 +0000
Received: by mail-ve0-f178.google.com with SMTP id c13so1068246vea.37
 for <linux-mtd@lists.infradead.org>; Tue, 16 Apr 2013 20:56:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <516E04B0.7010508@freescale.com>
References: <1363605534-24776-1-git-send-email-b32955@freescale.com>
 <1366120517.2768.109.camel@sauron.fi.intel.com>
 <516E04B0.7010508@freescale.com>
Date: Tue, 16 Apr 2013 20:56:26 -0700
Message-ID: <CAN8TOE_unte2BFxuXTyUg==7QUTwxXwPsTieaVAD74xixk65CA@mail.gmail.com>
Subject: Re: [PATCH 00/11] mtd: add datasheet's ECC information to nand_chip{}
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, matthieu.castet@parrot.com,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 16, 2013 at 7:10 PM, Huang Shijie <b32955@freescale.com> wrote:
> =D3=DA 2013=C4=EA04=D4=C216=C8=D5 21:55, Artem Bityutskiy =D0=B4=B5=C0:
>
>> Unfortunately no-one reviewed your patches. Let me CC Brian.
>>
> I CCed Brian already.
> I also hope some one could reviews this patch set.

Things go by the wayside at times... sigh. Sorry for the delay. I do
plan to fully review this series.

Initial comments:

What are the semantics for these new ecc_strength and ecc_size fields
for chips which aren't encoded in nand_ids.c (or aren't
ONFI-compliant)? We can't necessarily say that '0' means "no data
provided" - it is perfectly valid to have a value of 0, e.g., for EZ
NAND (or something like that) which manages its own ECC on-die. I
think there are even a few words in the ONFI spec about it. Basically,
I'm trying to point out that there is a difference between those chips
which we can't/don't detect their ecc_{strength,size} and those which
need no ECC.

Also, I might consider different names for these fields so that you
don't just rely on the in-code comments to differentiate the nand_chip
and nand_ecc_ctrl values. Perhaps min_ecc_strength and ecc_size?
(can't think of a great distinguishing name for the second one)

Finally, it's probably fine to increase NAND_MAX_OOBSIZE (and
MTD_MAX_ECCPOS_ENTRIES_LARGE) yet again, but these really need to
die... I have a (yet untested) patch series for killing
NAND_MAX_OOBSIZE ready.

I'll try to fully review the series within the week.

Brian
