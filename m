Received: from mail-vb0-x236.google.com ([2607:f8b0:400c:c02::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UUOP2-0002aY-CK
 for linux-mtd@lists.infradead.org; Mon, 22 Apr 2013 21:36:02 +0000
Received: by mail-vb0-f54.google.com with SMTP id w16so6335568vbf.41
 for <linux-mtd@lists.infradead.org>; Mon, 22 Apr 2013 14:35:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAN8TOE_unte2BFxuXTyUg==7QUTwxXwPsTieaVAD74xixk65CA@mail.gmail.com>
References: <1363605534-24776-1-git-send-email-b32955@freescale.com>
 <1366120517.2768.109.camel@sauron.fi.intel.com>
 <516E04B0.7010508@freescale.com>
 <CAN8TOE_unte2BFxuXTyUg==7QUTwxXwPsTieaVAD74xixk65CA@mail.gmail.com>
Date: Mon, 22 Apr 2013 14:35:58 -0700
Message-ID: <CAN8TOE-Nt1HrWBN+HeeJAE0UDKBwCXiEEc5+kPtjBM5hXF4d+A@mail.gmail.com>
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

Hi again Huang,

I had some initial comments a week ago (below) which haven't been
addressed. Can you please address them? I see that you are continuing
to send out v2 patches based on l2-mtd, where Artem already pulled in
your first 3 patches. But further work depends on the answer to my
questions for the first 3 patches.

On Tue, Apr 16, 2013 at 8:56 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Tue, Apr 16, 2013 at 7:10 PM, Huang Shijie <b32955@freescale.com> wrot=
e:
>> =D3=DA 2013=C4=EA04=D4=C216=C8=D5 21:55, Artem Bityutskiy =D0=B4=B5=C0:
>>
>>> Unfortunately no-one reviewed your patches. Let me CC Brian.
>>>
>> I CCed Brian already.
>> I also hope some one could reviews this patch set.
>
> Things go by the wayside at times... sigh. Sorry for the delay. I do
> plan to fully review this series.
>
> Initial comments:
>
> What are the semantics for these new ecc_strength and ecc_size fields
> for chips which aren't encoded in nand_ids.c (or aren't
> ONFI-compliant)? We can't necessarily say that '0' means "no data
> provided" - it is perfectly valid to have a value of 0, e.g., for EZ
> NAND (or something like that) which manages its own ECC on-die. I
> think there are even a few words in the ONFI spec about it. Basically,
> I'm trying to point out that there is a difference between those chips
> which we can't/don't detect their ecc_{strength,size} and those which
> need no ECC.

We need to straighten out these semantics now. Perhaps the fields in
struct nand_chip can be signed, where -1 is "unknown" and 0 is "no ECC
required."

> Also, I might consider different names for these fields so that you
> don't just rely on the in-code comments to differentiate the nand_chip
> and nand_ecc_ctrl values. Perhaps min_ecc_strength and ecc_size?
> (can't think of a great distinguishing name for the second one)

The naming can be changed after your series, if it seems worth it.

> Finally, it's probably fine to increase NAND_MAX_OOBSIZE (and
> MTD_MAX_ECCPOS_ENTRIES_LARGE) yet again, but these really need to
> die... I have a (yet untested) patch series for killing
> NAND_MAX_OOBSIZE ready.
>
> I'll try to fully review the series within the week.
>
> Brian
