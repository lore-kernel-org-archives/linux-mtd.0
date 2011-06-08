Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUG9N-0000MN-Pg
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 10:38:15 +0000
From: <roman.tereshonkov@nokia.com>
To: <kmpark@infradead.org>
Subject: RE: [PATCH] mtd: OneNAND: Fix wrong subpage_sft at 4KiB pagesize
Date: Wed, 8 Jun 2011 10:37:31 +0000
Message-ID: <E942AFD653C85241BF3CCD5F471BEDA203FD4F66@008-AM1MPN1-042.mgdnok.nokia.com>
References: <20110602064832.GA7319@july> <1307115701.3069.20.camel@localhost>
	<E942AFD653C85241BF3CCD5F471BEDA203FC6E79@008-AM1MPN1-041.mgdnok.nokia.com>
	<1307354557.3112.21.camel@localhost>	<1307354791.3112.24.camel@localhost>
	<BANLkTinPBum1WB=-tx833hj032mfs1TdVg@mail.gmail.com>
	<E942AFD653C85241BF3CCD5F471BEDA203FD21D7@008-AM1MPN1-041.mgdnok.nokia.com>
	<BANLkTi=aukCraGS1iOuemwuCvWrOaY0oxA@mail.gmail.com>
	<E942AFD653C85241BF3CCD5F471BEDA203FD4B1D@008-AM1MPN1-042.mgdnok.nokia.com>
	<BANLkTikQqZ1oWOWRat8NkwuGt+0yqgV6MQ@mail.gmail.com>
	<E942AFD653C85241BF3CCD5F471BEDA203FD4F44@008-AM1MPN1-042.mgdnok.nokia.com>
	<BANLkTin1qX2deMOr_jv-W3+3uwdPHm0hkA@mail.gmail.com>
In-Reply-To: <BANLkTin1qX2deMOr_jv-W3+3uwdPHm0hkA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: dwmw2@infradead.org, m.szyprowski@samsung.com,
	linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=20

>-----Original Message-----
>From: kyungmin78@gmail.com [mailto:kyungmin78@gmail.com] On=20
>Behalf Of ext Kyungmin Park
>Sent: 08 June, 2011 13:27
>To: Tereshonkov Roman (Nokia-SD/Helsinki)
>Cc: dedekind1@gmail.com; linux-mtd@lists.infradead.org;=20
>dwmw2@infradead.org; m.szyprowski@samsung.com
>Subject: Re: [PATCH] mtd: OneNAND: Fix wrong subpage_sft at=20
>4KiB pagesize
>
>2011/6/8  <roman.tereshonkov@nokia.com>:
>>
>>
>>>-----Original Message-----
>>>From: kyungmin78@gmail.com [mailto:kyungmin78@gmail.com] On
>>>Behalf Of ext Kyungmin Park
>>>Sent: 08 June, 2011 13:04
>>>To: Tereshonkov Roman (Nokia-SD/Helsinki)
>>>Cc: dedekind1@gmail.com; linux-mtd@lists.infradead.org;
>>>dwmw2@infradead.org; m.szyprowski@samsung.com
>>>Subject: Re: [PATCH] mtd: OneNAND: Fix wrong subpage_sft at
>>>4KiB pagesize
>>>
>>>2011/6/8 =9A<roman.tereshonkov@nokia.com>:
>>>>
>>>>
>>>>>-----Original Message-----
>>>>>From: kyungmin78@gmail.com [mailto:kyungmin78@gmail.com] On
>>>>>Behalf Of ext Kyungmin Park
>>>>>Sent: 07 June, 2011 13:10
>>>>>To: Tereshonkov Roman (Nokia-SD/Helsinki)
>>>>>Cc: dedekind1@gmail.com; linux-mtd@lists.infradead.org;
>>>>>dwmw2@infradead.org; m.szyprowski@samsung.com
>>>>>Subject: Re: [PATCH] mtd: OneNAND: Fix wrong subpage_sft at
>>>>>4KiB pagesize
>>>>>
>>>>>2011/6/7 =9A<roman.tereshonkov@nokia.com>:
>>>>>>
>>>>>>
>>>>>>>-----Original Message-----
>>>>>>>From: kyungmin78@gmail.com [mailto:kyungmin78@gmail.com] On
>>>>>>>Behalf Of ext Kyungmin Park
>>>>>>>Sent: 07 June, 2011 02:56
>>>>>>>To: dedekind1@gmail.com
>>>>>>>Cc: Tereshonkov Roman (Nokia-SD/Helsinki);
>>>>>>>linux-mtd@lists.infradead.org; dwmw2@infradead.org;
>>>>>>>m.szyprowski@samsung.com
>>>>>>>Subject: Re: [PATCH] mtd: OneNAND: Fix wrong subpage_sft at
>>>>>>>4KiB pagesize
>>>>>>>
>>>>>>>On Mon, Jun 6, 2011 at 7:06 PM, Artem Bityutskiy
>>>>>>><dedekind1@gmail.com> wrote:
>>>>>>>> On Mon, 2011-06-06 at 13:02 +0300, Artem Bityutskiy wrote:
>>>>>>>>> On Mon, 2011-06-06 at 09:42 +0000,
>>>>>>>roman.tereshonkov@nokia.com wrote:
>>>>>>>>> > What do mean by "no case to use the subpage"?
>>>>>>>>> >
>>>>>>>>> > According to the spec KFM4G16Q4M-xEBx the Number of
>>>>>>>Partial Program Cycles in the page (NOP)
>>>>>>>>> > is equal to 4 -> subpage_sft=3D2.
>>>>>>>
>>>>>>>It's really strange. Two OneNAND spec which has 4KiB pagesize
>>>>>>>say it has 1 NOP.
>>>>>>>
>>>>>>>Number of Partial Program Cycles in the page (Including main
>>>>>and spare
>>>>>>>area) NOP - - 1 cycles
>>>>>>>(KFM4G16Q5M-xEBx)
>>>>>>>
>>>>>>>that's reason I first set subpage_sft =3D 0 at original code.
>>>>>>>
>>>>>>>The different thing between you and me is the page architecture
>>>>>>>number. yes 4 is the correct number but 5 also has the
>>>4KiB pagesize.
>>>>>>>I think it's mean the manufacturing difference. can you check the
>>>>>>>which XXnm manufacturing for your devices?
>>>>>>>In our case. it's 3Xnm. and previous is 4Xnm.
>>>>>>
>>>>>>
>>>>>>
>>>>>> It seems the spec does not specify the nm-technology used.
>>>>>>
>>>>>> Can we somehow use the DeviceID and VersionID registers to differ
>>>>>> our chips?
>>>>>> For my case KFM4G16Q4M DeviceID=3D0x0050, VersionID=3D0x0131,
>>>>>> and KFM8G16Q4M DeviceID=3D0x0068, VersionID=3D0x0131.
>>>>>>
>>>>>> BTW. Another spec KFM4G16Q4B also tells about NOP=3D4 cycles.
>>>>>
>>>>>Here's my device register values.
>>>>>005000ec 0800013e 01010200 00000000
>>>>>DeviceID=3D0x0050, VersionID=3D0x013e
>>>>
>>>>
>>>> Our difference is in Stepping field of the VersionId register:
>>>> 0xe means "Version 1.0 (initial)", and 0x1 means "CS version 1.0".
>>>>
>>>> Does anybody know what does "CS" mean in this context? Is it
>>>Customer SoC or something else?
>>>Consumer Sample.
>>>
>>>but 0x013e is shipped widely. Nexus S also uses this chip. so it
>>>should be fixed at mainline.
>>>
>>>Please see another patch. there's no way to detect the=20
>version ID even
>>>though it's ugly.
>>
>>
>> Yes. I looked the patch and it is ok for me.
>> But the last word is for maintainer.
>Me(?) or Artem(?).
>I heard the H/W engineer and there's no difference between Q4M and Q5M
>except the NOP.
>and there's no way to detect. So uses the version ID as workaround.


If it is so what if we move the NOP definition to board specific domain.
The board configuration should know what chip is used.
And if NOP is set there then use it otherwise some safe default value.


The last word I meant for Artem.


Thanks
Roman Tereshonkov

>
>Thank you,
>Kyungmin Park
>>
>>
>> Thanks
>> Roman Tereshonkov
>>
>>>
>>>Thank you,
>>>Kyungmin Park
>>>>
>>>> How do different Stepping versions differ from each other?
>>>>
>>>>
>>>> Regards
>>>> Roman Tereshonkov
>>>>
>>>>
>>>>>
>>>>>The lower 4 bits of VersionID is different. even though=20
>VersionID is
>>>>>different. it's dangerous to detect the NOP 4 or not.
>>>>>
>>>>>I sent the email to OneNAND person and share the result
>>>soon. (he's on
>>>>>business trip and return at June 9).
>>>>>
>>>>>Thank you,
>>>>>Kyungmin Park
>>>>>
>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>>
>>>>>>>>>
>>>>>>>>> I thought this means "not supported by HW". But if this is
>>>>>>>supported,
>>>>>>>>> then I'm very surprised why would we remove it. I'm
>>>>>>>dropping this patch
>>>>>>>>> from my tree.
>>>>>>>>
>>>>>>>> OK, I actually did not put it to the l2 tree. And AFAICS
>>>this patch
>>>>>>>> basically reverts commit
>>>>>>>99b17c08bca2810f5910b3027f1b9d82edf7a576, but
>>>>>>>> still leaves the data structures like onenand_oob_128.
>>>>>>>>
>>>>>>>> So NACK for this patch - poor commit message, weird=20
>changes. I'm
>>>>>>>> surprised to see this from kmpark.
>>>>>>>
>>>>>>>since we got some different OneNAND Spec. even though it has
>>>>>>>same 4KiB pagesize.
>>>>>>>
>>>>>>>Thank you,
>>>>>>>Kyungmin Park
>>>>>>>>
>>>>>>>> --
>>>>>>>> Best Regards,
>>>>>>>> Artem Bityutskiy (=E1=D2=D4=A3=CD =E2=C9=D4=C0=C3=CB=C9=CA)
>>>>>>>>
>>>>>>>>
>>>>>>>
>>>>>
>>>
>=
