Received: from mail-ig0-x233.google.com ([2607:f8b0:4001:c05::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yupfx-0004dA-2D
 for linux-mtd@lists.infradead.org; Tue, 19 May 2015 22:07:50 +0000
Received: by igcau1 with SMTP id au1so25661190igc.1
 for <linux-mtd@lists.infradead.org>; Tue, 19 May 2015 15:07:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <555BB252.9080200@hauke-m.de>
References: <1431884112-28236-1-git-send-email-hauke@hauke-m.de>
 <20150518224910.GU11598@ld-irv-0074>
 <CAOiHx=k9SuwEYZ10P8kmHF25P2O2r6+9gaBTSQ6kXFxfDnzL=w@mail.gmail.com>
 <555BB252.9080200@hauke-m.de>
Date: Wed, 20 May 2015 00:07:26 +0200
Message-ID: <CACna6ryBiOsuSGTwJ9_v-=JK5y_v_mZ5xhsV2kQSXCT8PXxWNw@mail.gmail.com>
Subject: Re: [PATCH] mtd: part: add generic parsing of linux,part-probe
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Jonas Gorski <jogo@openwrt.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 19 May 2015 at 23:59, Hauke Mehrtens <hauke@hauke-m.de> wrote:
>> So my first Idea would be having something like this:
>>
>> mtdevice@foo {
>>         ...
>>         bootloader: partition@0 {
>>                 reg =3D <0 0x10000>;
>>                 device_type =3D "flash-partition";
>>                 read-only;
>>         };
>>
>>         firmware: partition@10000 {
>>                 reg =3D <0x1000 0x7e0000>;
>>                 device_type =3D "flash-partition";
>>                 compatible =3D "brcm,trx";
>>         };
>>
>>         calibration: partition@7f0000 {
>>                 reg =3D < >;
>>                 device_type =3D "flash-partition";
>>                 read-only;
>>         };
>> };
>>
>> Then the ofpart parsing could be integrated into the core, and
>> partition parsers get run according to their compatibles on the
>> individual partitions.
>>
>> Of course this also might be total overengineering and completely the
>> wrong place for devicetree as it's essentially configuration data, but
>> since the now described partitions are now more or less "static", IMHO
>> this would be a-okay.
>
> This sounds like the problem Rafa=C5=82 wanted to solve in his patch "mtd=
:
> add support for typed parsers splitting partitions"
>
> This would also solve my problem and would make the bcm47xx part parser
> a lot simpler and more secure for targets using device tree.
> I still think we should add a alternative for the people that do not
> want to rewrite their partition parser. Specifying the list of available
> partition parser in the flash driver is a bad idea because it is the
> wrong place.

This is what I hoped for all the time. To get both patches accepted
(linux,part-probe & typed parsers). That would give us a really nice
way to handle partitioning on every device.


> I am in favor of both concepts, because there is already one driver
> reading the partition parser list from device tree and it is implemented
> pretty easy. Jonas Approach sounds nice because it really solves two
> more problems.
> Jonas approach would work on bcm47xx and bcm53xx targets, because there
> the header is located after the boot loader and does not contain all
> partitions. This could also be used to divide the partition containing
> the kernel and the read only root fs in OpenWrt. Are there any more
> users which could use this extended approach?

I got a bit lost with above. The patch adding typed parsers I sent
will allow us to write both: TRX parser (splitter) and SquashFS parser
(splitter). This is all we need in OpenWrt and I my patch is highly
based on OpenWrt version obviously too.
