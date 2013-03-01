Received: from mail-ia0-x229.google.com ([2607:f8b0:4001:c02::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UBOn0-0005mQ-Q0
 for linux-mtd@lists.infradead.org; Fri, 01 Mar 2013 12:10:20 +0000
Received: by mail-ia0-f169.google.com with SMTP id j5so2598741iaf.28
 for <linux-mtd@lists.infradead.org>; Fri, 01 Mar 2013 04:10:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <BAF0C2081321BA469F9ADF648F97D9B04C78FA607C@MCC023.weinmann.com>
References: <BAF0C2081321BA469F9ADF648F97D9B04C78FA6069@MCC023.weinmann.com>
 <CAN8TOE9YJBvUE9GDW3krZB-Js6gUkqY23gYNLS4gFX0e2NDNZw@mail.gmail.com>
 <BAF0C2081321BA469F9ADF648F97D9B04C78FA6071@MCC023.weinmann.com>
 <CACQ1gAg0rE+X+uxRWbrPKhmdS1T0MG00cwwBbzWM+VwU4zaXmw@mail.gmail.com>
 <BAF0C2081321BA469F9ADF648F97D9B04C78FA607C@MCC023.weinmann.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Fri, 1 Mar 2013 13:09:53 +0100
Message-ID: <CACQ1gAg=L7ru5J4C7OQN0r-c2VN3baKX1qqty8Z0ObS5Wk48yg@mail.gmail.com>
Subject: Re: Bug in mtd_get_device_size()?
To: "Velykokhatko, Sergey" <Sergey.Velykokhatko@mcc-med.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
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

2013/3/1 Velykokhatko, Sergey <Sergey.Velykokhatko@mcc-med.de>:
> Hi Richard,
>
> Thanks a lot for your explanations. Now at least I understand your logic.=
 And it seems to be reasonable. Your start point that all bad blocks for fl=
ash chip could be placed in single MTD. This is really worst worst case, bu=
t... Theoretically it could happened. And you should take care of it.
> And you are right again in things about my chip. I interpreted that up to=
 40 blocks could be bad from chip production. But now found on side 104 of =
125 one note (sometimes I like datasheets :-) ):
>
> "
> Notes:
>  1. Invalid blocks are blocks that contain one or more bad bits. The devi=
ce may contain bad
> blocks upon shipment. Additional bad blocks may develop over time; howeve=
r, the total
> number of available blocks will not drop below NVB during the endurance l=
ife of the
> device. Do not erase or program blocks marked invalid by the factory.
> "
>
> Also I should expect up to 40 bad blocks. Nearly 1%.  No more for enduran=
ce case.
That less than many NAND device, so in your case, you should set
CONFIG_MTD_UBI_BEB_LIMIT to 10 (40 bad blocks on a total of 4096)

>
> Independing from this I wanted to make my kernel partition bigger. Now ju=
st no time for this, we are still in developing with our device.
>
>
>>If not, we have to accept to loose some space for bad blocks, or use NOR =
:)
> :) NOR is expensive. And UBI takes a lot of space since based on worst ca=
se estimation of NAND features. I have to find compromise
yes... may be one day we will have cheap, reliable and fast flash storage.
(and at least your nand is SLC, not MLC !)

And if you want to tweak the BEB_LIMIT for each of your UBI partition,
it's possible, via the ubiattach call ( get the master branchof of
git://git.infradead.org/mtd-utils.git )
cf http://git.infradead.org/mtd-utils.git/commit/878e06ea555ba5dbfb974b3904=
d1a86a9a0e20f5
and via the ubi module parameter :
mtd=3D<name|num|path>[,<vid_hdr_offs>[,max_beb_per1024]]

with that, you won't need your kernel patch anymore !

Regards,
Richard.
