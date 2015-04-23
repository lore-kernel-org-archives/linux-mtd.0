Received: from mail-ie0-x233.google.com ([2607:f8b0:4001:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YlBu2-00019M-FJ
 for linux-mtd@lists.infradead.org; Thu, 23 Apr 2015 07:50:34 +0000
Received: by iejt8 with SMTP id t8so55186089iej.2
 for <linux-mtd@lists.infradead.org>; Thu, 23 Apr 2015 00:50:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87F60714EC601C4C83DFF1D2E3D390A027284081@NTXXIAMBX02.xacn.micron.com>
References: <87F60714EC601C4C83DFF1D2E3D390A02728255E@NTXXIAMBX02.xacn.micron.com>
 <20150422175108.GX32500@ld-irv-0074>
 <87F60714EC601C4C83DFF1D2E3D390A027284081@NTXXIAMBX02.xacn.micron.com>
Date: Thu, 23 Apr 2015 09:50:08 +0200
Message-ID: <CACna6rxihkdinPOiHJ5-C2LO9uELmR-4j-0ULOWTY9Z_Nre24A@mail.gmail.com>
Subject: Re: [PATCH 2/6] mtd: diskonchip: don't call nand_scan_bbt() directly
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: =?UTF-8?B?UGV0ZXIgUGFuIOa9mOagiyAocGV0ZXJwYW5kb25nKQ==?=
 <peterpandong@micron.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 23 April 2015 at 02:30, Peter Pan =E6=BD=98=E6=A0=8B (peterpandong)
<peterpandong@micron.com> wrote:
> On Thu, Apr 23, 2015 at 01:51:27PM +0000, Brian Norris wrote:
>>
>> On Thu, Apr 16, 2015 at 02:11:24AM +0000, Peter Pan =E6=BD=98=E6=A0=8B (=
peterpandong)
>> wrote:
>> > The diskonchip driver almost uses the default nand_base hooks as-is,
>> > except that it provides custom on-flash BBT descriptors and avoids
>> using
>> > factory-marked bad blockers.
>> >
>> > So let's refactor the BBT initialization code into a private
>> 'late_init'
>> > hook which handles all the private details. Note the usage of
>> > NAND_SKIP_BBTSCAN, which allows us to defer the BBT scan until we've
>> > prepared everything.
>> >
>> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>> > Signed-off-by: Peter Pan <peterpandong@micron.com>
>>
>> Why are you just resending my patch? You could Ack/Review/Test it
>> instead. (Did you test it?)
>
> My work is in the 6th patch.
> I already tested the patch with micron own nand controller. I don't have
> platform with docg4 or diskonchip controller. So the BBT and nand_base.c
> part is covered while docg4.c and diskonchip.c not.

You can use patch format's comment place to post sth like
"Depends on 5 XXX patches from Brian"

--=20
Rafa=C5=82
