Received: from mail-qc0-f177.google.com ([209.85.216.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1StWC6-0005w8-Ls
 for linux-mtd@lists.infradead.org; Tue, 24 Jul 2012 03:54:01 +0000
Received: by qcsu28 with SMTP id u28so3637468qcs.36
 for <linux-mtd@lists.infradead.org>; Mon, 23 Jul 2012 20:53:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4FF15BD1.9010109@parrot.com>
References: <1340898442-1585-1-git-send-email-matthieu.castet@parrot.com>
 <20120628213146.7d929204@halley> <4FED6A2E.9010603@parrot.com>
 <20120630230252.58ca6bb4@halley> <4FF15BD1.9010109@parrot.com>
Date: Mon, 23 Jul 2012 20:53:56 -0700
Message-ID: <CAN8TOE8GMMn+sPu4trUH_iT3=5uh_Of=bsYzXX50E3dyPfKitg@mail.gmail.com>
Subject: Re: [RFC] nand_btt : use nand chip->block_bad
From: Brian Norris <computersforpeace@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Ivan Djelic <ivan.djelic@parrot.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Matthieu,

Sorry for taking an extraordinarily long amount of time to respond.
This isn't a very easy issue to address, and I'm kind of behind on
email anyway. I'll respond directly to a few of your comments, and
then just include my general comments about this RFC.

On Mon, Jul 2, 2012 at 1:29 AM, Matthieu CASTET
<matthieu.castet@parrot.com> wrote:
> Shmulik Ladkani a =E9crit :
>> On Fri, 29 Jun 2012 10:41:18 +0200 Matthieu CASTET <matthieu.castet@parr=
ot.com> wrote:
>>>> - The new scheme lacks the potential error correction offered by the
>>>>   mtd_read_oob call (invoked from the original scan functions).
>>>>   OTOH, currently, AFAIK, it is only offered by an out-of-tree driver.
>>> Could you explain more here ?
>>> The current scheme doesn't handle bitflip in bad block. We don't care a=
bout
>>> error correction : bad block are not protected by ecc !
>>
>> I was refering to utilizing the ECC when reading the OOB, so we won't
>> get a false "bad" indication when reading the BBM from the OOB.
>>
>> See this post (and subsequent ones):
>> http://lists.infradead.org/pipermail/linux-mtd/2012-June/042203.html
>>
> But oob is not protected by ecc in normal configuration. I believe more t=
han 95%
> of current configuration don't protect bad block with ecc.
> Manufacturer bad block are also not protected by ecc.
>
> How could this work ?
> Do you have example of linux driver that protect bad block with ecc ?

I think we've been over this a few times...my out-of-tree driver
protects OOB ECC. This is partly a driver implementation choice and
partly a property of the ASIC. I won't re-explain here unless you're
really curious.

> Finally if there is a config with bad block protected by ecc, we can prov=
ide
> another chip->block_bad callback which use ecc.

It seems pointless to re-implement the entire chip->block_bad just to
enable/disable ECC: the rest of the function should be standard and
irreplaceable, I believe. So I would expect that overriding
chip->block_bad should be reserved for systems that need an entirely
new BBM position or pattern that is not standard in nand_base.

> Also note that the post speak of "nand_chip.badblockbits" [1] which can b=
e used
> with this patch.

Right, that is one positive side. But there are a few failings of the
current chip->block_bad implementation, I think. With a little more
work, though, it could be a sensible replacement for some portions of
nand_bbt.c.

General comments:

I think that the duplication of code between nand_bbt.c and
nand_base.c (nand_block_bad) is kind of absurd. And the nand_bbt.c
code is very much spaghetti code, IMO, with a sprinkling of strange
and/or little-understood features. So I agree with Matthieu that we
could unify to using chip->block_bad. I feel like this gives several
benefits. Some of this may be a little redundant:
* get rid of the difficult-to-understand spaghetti code seen in nand_bbt.c
* prevent code duplication in nand_base/nand_bbt
* fix the nand_block_bad implementation, which seems to be
inconsistent with nand_bbt (I'm not sure; see the second disadvantage
below...)
* make consistent use of the chip->badblockbits feature (this
addresses some bitflip issues from other thread(s))
* allow consistent overriding of chip->block_bad and
chip->block_markbad together [a]
* we can properly separate some BBM and BBT code (note the Marker vs.
Table) to nand_base and nand_bbt respectively

Disadvantages:
* need to improve nand_block_bad code [b]
* need to understand some NAND_BBT_* options better (e.g.,
NAND_BBT_SCANALLPAGES and NAND_BBT_SCANEMPTY). This may not really be
a disadvantage, as they should be understood/documented better or else
removed. See some problems we're having with SCANEMPTY:
http://lists.infradead.org/pipermail/linux-mtd/2012-July/042902.html

Now, I have a separate question:
Suppose we replace some nand_bbt code with the nand_block_bad code in
nand_base.c, and we make use of badblockbits to solve the bitflip
problems I brought up. I still don't see a reason we can't read/write
with MTD_OPS_PLACE_OOB instead of MTD_OPS_RAW. There is *no*
difference between these options for most current implementations,
regarding ECC protecting OOB as remarked previously. But it provides
only *benefit* for my driver and allows other systems (e.g., docg3,
docg4) to do the same if desired. So why can't the default
implementation use both badblockbits and MTD_OPS_PLACE_OOB
simultaneously?

Thanks,
Brian

[a] Does it really make sense to override both in the current code
base? It looks like chip->block_bad won't take effect if you have
*any* BBT (on-flash OR in-memory!). So you can't properly redefine new
BBM marking/checking for a non-standard scheme, as nand_bbt gives you
no choice...

[b] e.g., why does nand_block_bad manually run NAND_CMD_READOOB,
whereas nand_default_markbad uses the nand_do_write_oob() wrapper? I
feel like we could use nand_do_read_oob()...
