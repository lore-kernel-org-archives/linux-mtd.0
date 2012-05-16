Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SUWO5-0000A8-K8
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 05:03:04 +0000
Received: by bkwj4 with SMTP id j4so302312bkw.36
 for <linux-mtd@lists.infradead.org>; Tue, 15 May 2012 22:02:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4FB3170B.5060100@snapgear.com>
References: <1337054928-16228-1-git-send-email-gerg@snapgear.com>
 <CAMjpGUcteBCy7OLVgxF1sDTNi4XqCKsetEQSW-dpG0Ji4mUh2A@mail.gmail.com>
 <4FB2F8A9.6010909@snapgear.com>
 <CAMjpGUff6=5HhUrt6xRdROb7edFWvZsUDHLZStVQQr55zo6maQ@mail.gmail.com>
 <4FB3170B.5060100@snapgear.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Wed, 16 May 2012 01:02:39 -0400
Message-ID: <CAMjpGUcBCVvRreZ2DK+UXkhV2dMZj3xMbTpHaep0yTViGS_1-w@mail.gmail.com>
Subject: Re: [uClinux-dev] [PATCH] mtd: clean up uclinux.c map driver
To: Greg Ungerer <gerg@snapgear.com>
Content-Type: text/plain; charset=UTF-8
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

On Tue, May 15, 2012 at 10:55 PM, Greg Ungerer <gerg@snapgear.com> wrote:
> On 16/05/12 12:42, Mike Frysinger wrote:
>> On Tue, May 15, 2012 at 8:45 PM, Greg Ungerer<gerg@snapgear.com> =C2=A0w=
rote:
>>> On 16/05/12 01:57, Mike Frysinger wrote:
>>>> On Tue, May 15, 2012 at 12:08 AM,<gerg@snapgear.com> =C2=A0=C3=83=C2=
=A1wrote:
>>>>> . make the struct uclinux_ram_map static
>>>>
>>>> NAK: this breaks Blackfin systems. =C3=83=C2=A1we specifically don't w=
ant this to
>>>> be static.
>>>> it should probably get a comment added above it saying as much.
>>>
>>> A comment won't fix the sparse warning. You need a proper declaration.
>>
>> perhaps, but marking it static to fix a warning that people rarely see
>> whilst simultaneously knowingly breaking an arch doesn't sound like
>> the correct trade off.
>
> I agree, of course. It wasn't done to knowingly break an arch. But
> the sparse warning can be fixed with a proper declaration, that
> would avoid you having a local extern for it in
> arch/blackfin/kernel/setup.c as well. Cleaner all round.

i thought you were going for merging anyways.

where would you suggest adding such a decl ?  there isn't an existing
one i can see that this would fit into.  might have to create a new
one just for this ?
-mike
