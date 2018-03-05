Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1estYh-0008BI-Pl
 for linux-mtd@lists.infradead.org; Mon, 05 Mar 2018 17:05:58 +0000
Received: by mail-wr0-x229.google.com with SMTP id v111so18047184wrb.3
 for <linux-mtd@lists.infradead.org>; Mon, 05 Mar 2018 09:05:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <3359334.BzATs06viZ@blindfold>
References: <CAJ+vNU0O4uBHzd2h0Nbjbm8fp+9e2UEiqHEZ6A5RZHjLsArAPw@mail.gmail.com>
 <4813843.hImRYGMsqb@blindfold>
 <CAJ+vNU3JhZRFfh-GC+SDXe0ynQadt1Yup4vLFfGuzRy_c5a8QQ@mail.gmail.com>
 <3359334.BzATs06viZ@blindfold>
From: Tim Harvey <tharvey@gateworks.com>
Date: Mon, 5 Mar 2018 09:05:42 -0800
Message-ID: <CAJ+vNU0r19m7XhsAukH1iLnGUYBnoMUX32F24k3bxKRrXrXz=Q@mail.gmail.com>
Subject: Re: Does modern UBI/UBIFS still suffer from the 'unstable bits issue'?
To: Richard Weinberger <richard@nod.at>, Han Xu <xhnjupt@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 linux-mtd@lists.infradead.org, Koen Vandeputte <koen.vandeputte@ncentric.com>,
 Scott Bowman <wbowma01@harris.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Mar 3, 2018 at 2:40 AM, Richard Weinberger <richard@nod.at> wrote:
> Tim,
>
> Am Freitag, 2. M=C3=A4rz 2018, 17:20:57 CET schrieb Tim Harvey:
>> > Just to be sure, this is SLC NAND, right?
>>
>> No, its a MT29F16G08 16GB MLC
>
> Sorry, MLC NAND is not supported by UBI and UBIFS [0].
>
> The ECC errors you are facing are most likely caused by paired pages.
> On MLC NAND, pages come in pairs. If a write operation is interrupted, no=
t
> only the current page is corrupted like on SLC, also the already written
> paired page is lost too.
> Boris Brezillon and I spent a lot of time in addressing this problem but =
came
> to no good solution after all.
> Well, we had a solution but it needs a lot of testing and fine tuning, sa=
dly
> we run out of budget.
> Beside of that, read and write disturb are also an important factor, this=
 can
> be addressed with the experimental ubihealthd.
>

Richard,

My mistake - it is the  MT29F2G08ABAEAH4 being used here which is SLC not M=
LC.

So I suppose perhaps we could be running into the issue Han Xu pointed out.

Regards,

Tim
