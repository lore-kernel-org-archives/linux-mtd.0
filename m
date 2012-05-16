Received: from dalsmrelay2.nai.com ([205.227.136.216])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SUUQY-00061i-Gk
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 02:57:27 +0000
Message-ID: <4FB3170B.5060100@snapgear.com>
Date: Wed, 16 May 2012 12:55:07 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [uClinux-dev] [PATCH] mtd: clean up uclinux.c map driver
References: <1337054928-16228-1-git-send-email-gerg@snapgear.com>
 <CAMjpGUcteBCy7OLVgxF1sDTNi4XqCKsetEQSW-dpG0Ji4mUh2A@mail.gmail.com>
 <4FB2F8A9.6010909@snapgear.com>
 <CAMjpGUff6=5HhUrt6xRdROb7edFWvZsUDHLZStVQQr55zo6maQ@mail.gmail.com>
In-Reply-To: <CAMjpGUff6=5HhUrt6xRdROb7edFWvZsUDHLZStVQQr55zo6maQ@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
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

On 16/05/12 12:42, Mike Frysinger wrote:
> On Tue, May 15, 2012 at 8:45 PM, Greg Ungerer<gerg@snapgear.com>  wrote:
>> On 16/05/12 01:57, Mike Frysinger wrote:
>>> On Tue, May 15, 2012 at 12:08 AM,<gerg@snapgear.com>  =C3=A1wrote:
>>>>
>>>> . make the struct uclinux_ram_map static
>>>
>>>
>>> NAK: this breaks Blackfin systems. =C3=A1we specifically don't want thi=
s to
>>> be static.
>>>
>>> it should probably get a comment added above it saying as much.
>>
>> A comment won't fix the sparse warning. You need a proper declaration.
>
> perhaps, but marking it static to fix a warning that people rarely see
> whilst simultaneously knowingly breaking an arch doesn't sound like
> the correct trade off.

I agree, of course. It wasn't done to knowingly break an arch. But
the sparse warning can be fixed with a proper declaration, that
would avoid you having a local extern for it in
arch/blackfin/kernel/setup.c as well. Cleaner all round.

Regards
Greg



------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
