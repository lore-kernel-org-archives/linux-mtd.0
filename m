Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SkHFv-0006yo-Im
 for linux-mtd@lists.infradead.org; Thu, 28 Jun 2012 16:07:44 +0000
Received: by bkwj4 with SMTP id j4so2333566bkw.36
 for <linux-mtd@lists.infradead.org>; Thu, 28 Jun 2012 09:07:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1340894351.3070.121.camel@sauron.fi.intel.com>
References: <1340636918-7505-1-git-send-email-richard.genoud@gmail.com>
 <1340894351.3070.121.camel@sauron.fi.intel.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Thu, 28 Jun 2012 18:07:24 +0200
Message-ID: <CACQ1gAjLdR-ZRUS6gxMrJzVpRdvdMK2JRceyiFmeSq-FQkZbZg@mail.gmail.com>
Subject: Re: [PATCH] UBI: add minimal amount of reserved erase blocks in
 Kconfig
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/6/28 Artem Bityutskiy <dedekind1@gmail.com>:
> Hi, first of all, this 1% is does is not good enough for modern devices.
> It is just a default I picked out of the thin air.
Hi !
Agreed, it seems that 2% of the whole flash (at least for SLC device)
is more realistic.
>
> What we really need is to make it possible to specify beb_rsvd_level at
> attach time. I believe it is not difficult to implement:
>
> 1. Add a parameter to ubiattach
> 2. Extend the attach ioctl and add beb_rsvd_level there. We have 12
> unused bytes in 'struct ubi_attach_req'.
> 3. Extend the "mtd" module parameter and allow to specify beb_rsvd_level
> there as well.
>
> That's it - you can specify the needed numbers for your flash.
>
> =C2=A0to make this per-MTD device
All right, with this approach, we can have different flash devices
with different MBB. Got it.

> On Mon, 2012-06-25 at 17:08 +0200, Richard Genoud wrote:
>> The problem with this behaviour is that NAND flash manufacturers give a
>> minimum number of valid block (NVB) during the endurance life of the
>> device.
>> E.G.:
>> Parameter =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Symbol =C2=A0 =C2=A0=
Min =C2=A0 =C2=A0Max =C2=A0 =C2=A0Unit =C2=A0 =C2=A0 =C2=A0Notes
>> --------------------------------------------------------------
>> Valid block number =C2=A0 =C2=A0 NVB =C2=A0 =C2=A0 1004 =C2=A0 =C2=A0102=
4 =C2=A0 Blocks =C2=A0 =C2=A0 1
>> Note:
>> 1. Invalid blocks are block that contain one or more bad bits beyond
>> ECC. The device may contain bad blocks upon shipment. Additional bad
>> blocks may develop over time; however, the total number of available
>> blocks will not drop below NVB during the endurance life of the device.
>
> OK, in this discussion is is easier to talk about maximum bad blocks
> (MBB) rather than minimum good blocks, though. So basically, the vendor
> guarantees that there will be at most MBB bad blocks.
>
>> From this number we can deduce the maximum number of bad PEB that a
>> device will contain during its endurance life :
>> A 128MiB NAND flash (1024 PEB) will not have less than 20 bad blocks
>> during the flash endurance life.
>
> OK.
>
>> BUT, the manufacturer doesn't tell where those bad block will appear. He
>> doesn't say either if they will be equally disposed on the whole device
>> (and I'm pretty sure they won't).
>
> Right, then if you implement what I suggested, you'll pass
> "beb_rsvd_level=3D20" when attaching both partitions.
>
>> So, according to the datasheets, we should reserve the maximum number of
>> bad PEB for each UBI volume.
>> (Worst case scenario: 20 bad blocks appears on the smallest UBI volume.)
>
> Err, not smallest UBI volume, but smallest MTD partition. We reserve
> PEBs per-MTD device.
Yes, you're right (I usually use only one ubi volume per mdt device,
that's why I mixed up things)

>> =3D> The actual parameter MTD_UBI_BEB_RESERVE is not enough to cover thi=
s
>> scenario. We need to set a minimal number of reserved PEB for a UBI
>> volume.
>
> Frankly, I do not understand this logic :-) And your patch looks wrong -
> it touches the "auto-format" code which you may consider more like a
> "debugging" feature and should not rely on this in production.
Sorry, but I don't understand what you mean by the "auto-format" code.
The other thing I don't understand is that the patch touches only the
ubi_calculate_reserved() function which is the only place where
beb_rsvd_level is set.
And with your approach, as far as we'll get beb_rsvd_level value from
ioctl, I'll have also to touch this function...
(or maybe what's wrong with this patch is that beb_rsvd_level can be
less that 2, in this case I should have set a minimum range of 2 in
Kconfig)

Thanks for your comments.

Best regards,
Richard.

> --
> Best Regards,
> Artem Bityutskiy



--=20
for me, ck means con kolivas and not calvin klein... does it mean I'm a gee=
k ?
