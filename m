Received: from dalsmrelay2.nai.com ([205.227.136.216])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SUclQ-0005mG-Cj
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 11:51:33 +0000
Message-ID: <4FB39456.7040208@snapgear.com>
Date: Wed, 16 May 2012 21:49:42 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [uClinux-dev] [PATCH] mtd: clean up uclinux.c map driver
References: <1337054928-16228-1-git-send-email-gerg@snapgear.com>
 <CAMjpGUcteBCy7OLVgxF1sDTNi4XqCKsetEQSW-dpG0Ji4mUh2A@mail.gmail.com>
 <4FB2F8A9.6010909@snapgear.com>
 <CAMjpGUff6=5HhUrt6xRdROb7edFWvZsUDHLZStVQQr55zo6maQ@mail.gmail.com>
 <4FB3170B.5060100@snapgear.com>
 <CAMjpGUcBCVvRreZ2DK+UXkhV2dMZj3xMbTpHaep0yTViGS_1-w@mail.gmail.com>
In-Reply-To: <CAMjpGUcBCVvRreZ2DK+UXkhV2dMZj3xMbTpHaep0yTViGS_1-w@mail.gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Greg Ungerer <gerg@uclinux.org>, linux-mtd@lists.infradead.org,
 uClinux development list <uclinux-dev@uclinux.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/16/2012 03:02 PM, Mike Frysinger wrote:
> On Tue, May 15, 2012 at 10:55 PM, Greg Ungerer<gerg@snapgear.com>  wrote:
>> On 16/05/12 12:42, Mike Frysinger wrote:
>>> On Tue, May 15, 2012 at 8:45 PM, Greg Ungerer<gerg@snapgear.com>  =C3=
=A1wrote:
>>>> On 16/05/12 01:57, Mike Frysinger wrote:
>>>>> On Tue, May 15, 2012 at 12:08 AM,<gerg@snapgear.com>  =C3=A1=E2=94=9C=
=C3=ADwrote:
>>>>>> . make the struct uclinux_ram_map static
>>>>>
>>>>> NAK: this breaks Blackfin systems. =E2=94=9C=C3=ADwe specifically don=
't want this to
>>>>> be static.
>>>>> it should probably get a comment added above it saying as much.
>>>>
>>>> A comment won't fix the sparse warning. You need a proper declaration.
>>>
>>> perhaps, but marking it static to fix a warning that people rarely see
>>> whilst simultaneously knowingly breaking an arch doesn't sound like
>>> the correct trade off.
>>
>> I agree, of course. It wasn't done to knowingly break an arch. But
>> the sparse warning can be fixed with a proper declaration, that
>> would avoid you having a local extern for it in
>> arch/blackfin/kernel/setup.c as well. Cleaner all round.
>
> i thought you were going for merging anyways.
>
> where would you suggest adding such a decl ?  there isn't an existing
> one i can see that this would fit into.  might have to create a new
> one just for this ?

No I don't see any existing place that makes any sense. I guess it
could be something like a new file include/linux/mtd/uclinux.h.

But it looks like Artem is ok with just reverting it to not be static.
I am happy to leave it that way if you are.

Regards
Greg



------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
