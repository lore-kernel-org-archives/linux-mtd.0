Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SpjFx-0002wd-0n
 for linux-mtd@lists.infradead.org; Fri, 13 Jul 2012 17:02:20 +0000
Received: by yhjj52 with SMTP id j52so701099yhj.36
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jul 2012 10:02:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201207131853.46136.marex@denx.de>
References: <1341293533-2214-1-git-send-email-b32955@freescale.com>
 <CAMiH66FNn3YrqiCdYj7aAP8qR3VtH5r7q4Gza=0=vQtOoj_5bw@mail.gmail.com>
 <50004D06.10303@freescale.com> <201207131853.46136.marex@denx.de>
Date: Fri, 13 Jul 2012 10:02:10 -0700
Message-ID: <CAN8TOE_XF=ou5Nb9ErNhVM4TRHkAitAjGbien5xZTGz_sZZFUA@mail.gmail.com>
Subject: Re: [PATCH] mtd: add a new macro about the subpage write
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: dedekind1@gmail.com, Jan Weitzel <j.weitzel@phytec.de>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Scott Wood <scottwood@freescale.com>, Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 13, 2012 at 9:53 AM, Marek Vasut <marex@denx.de> wrote:
>> On 07/13/2012 11:08 AM, Huang Shijie wrote:
>> > On Fri, Jul 13, 2012 at 11:40 AM, Marek Vasut <marex@denx.de> wrote:
>> >> Why not remove the mask?
>> >
>> > I do not understand why this line was added here, =A0was it added on
>> > purpose? so I am not sure whether we can just remove this line.
>>
>> If whoever wanted that line to be there cared enough, they could have
>> justified it with a comment (in the code, in the changelog, or in one of
>> these threads). =A0We can't just let cruft sit there (or worse, produce
>> more cruft to work around existing cruft) just because we don't know
>> exactly what the original author was thinking. =A0It appears to just hav=
e
>> been a misguided attempt at enforcing any given option to come from only
>> one place.
>
> I think it was there to allow having two different chips on the same NAND=
 bus
> ... or something. But this is just a guess. Anyway, it proved irrelevant,=
 so
> let's drop it.

I agree. Then review/test/ack my patch that I just sent :)

Brian
