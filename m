Received: from co1ehsobe006.messaging.microsoft.com ([216.32.180.189]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UUT2M-00063S-JZ
 for linux-mtd@lists.infradead.org; Tue, 23 Apr 2013 02:32:56 +0000
Message-ID: <5175F337.6010605@freescale.com>
Date: Tue, 23 Apr 2013 10:34:31 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 00/11] mtd: add datasheet's ECC information to nand_chip{}
References: <1363605534-24776-1-git-send-email-b32955@freescale.com>	<1366120517.2768.109.camel@sauron.fi.intel.com>	<516E04B0.7010508@freescale.com>	<CAN8TOE_unte2BFxuXTyUg==7QUTwxXwPsTieaVAD74xixk65CA@mail.gmail.com>
 <CAN8TOE-Nt1HrWBN+HeeJAE0UDKBwCXiEEc5+kPtjBM5hXF4d+A@mail.gmail.com>
In-Reply-To: <CAN8TOE-Nt1HrWBN+HeeJAE0UDKBwCXiEEc5+kPtjBM5hXF4d+A@mail.gmail.com>
Content-Type: text/plain; charset="GB2312"
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

=D3=DA 2013=C4=EA04=D4=C223=C8=D5 05:35, Brian Norris =D0=B4=B5=C0:
>> > Initial comments:
>> >
>> > What are the semantics for these new ecc_strength and ecc_size field=
s
>> > for chips which aren't encoded in nand_ids.c (or aren't
>> > ONFI-compliant)? We can't necessarily say that '0' means "no data
>> > provided" - it is perfectly valid to have a value of 0, e.g., for EZ
>> > NAND (or something like that) which manages its own ECC on-die. I
>> > think there are even a few words in the ONFI spec about it. Basicall=
y,
>> > I'm trying to point out that there is a difference between those chi=
ps
>> > which we can't/don't detect their ecc_{strength,size} and those whic=
h
>> > need no ECC.
> We need to straighten out these semantics now. Perhaps the fields in
> struct nand_chip can be signed, where -1 is "unknown" and 0 is "no ECC
> required."
>
IMHO, use -1 as "unknown" makes the things a little complexed.
You have to add a patch to fix the nand_ids or init these two fields in
nand_base.c.

For the ECC on-die case(sorry, i never meet this type of nand), I prefer
to add a
new flags to distinguish them.

For the "unknown" case, use the default 0.


>> > Also, I might consider different names for these fields so that you
>> > don't just rely on the in-code comments to differentiate the nand_ch=
ip
>> > and nand_ecc_ctrl values. Perhaps min_ecc_strength and ecc_size?
>> > (can't think of a great distinguishing name for the second one)
> The naming can be changed after your series, if it seems worth it.
If we use the min_ecc_strength, we'd better use the min_ecc_size too.


thanks
Huang Shijie
