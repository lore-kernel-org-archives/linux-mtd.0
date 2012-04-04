MIME-Version: 1.0
In-Reply-To: <20120404075748.GA9073@pengutronix.de>
References: <1333247817-18472-1-git-send-email-shijie8@gmail.com>
 <20120403193920.GC2201@pengutronix.de>
 <CAMiH66FhFFi1Kd7t6uK4S46Yt=g1kxxCUZywCNAmy14E1AHH1A@mail.gmail.com>
 <20120404075748.GA9073@pengutronix.de>
Date: Wed, 4 Apr 2012 07:19:20 -0400
Message-ID: <CAMiH66EPYQiiSOtnt=e9RpcrWKOUoH6=H5B0uJw14hZaHMLjEQ@mail.gmail.com>
Subject: Re: [PATCH] mtd/gpmi : do not include the mxs.h
From: Huang Shijie <shijie8@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 4, 2012 at 3:57 AM, Wolfram Sang <w.sang@pengutronix.de> wrote:
> Hi,
>
>> Do you mean your patch "lib: add support for stmp-style devices" ?
>> or some other patch?
>
> Yes, it adds the SET and CLR macros. writel() then need to be modified ag=
ain.
> Nothing major, though.

The two macros are not needed if you give me a two arguments API such
as gpmi_reset_block().
I wish I can remove the gpmi_reset_block(), and use your code. :)

>
>> Your patch "lib: add support for stmp-style devices" does not give me th=
e API
>> to remove this code as i ever wished to.
>
> Then please speak up. The only comment I can find from you is the request=
ed
> move to a fsl-directory, but this is nothing about API?
yes.
I will send new comments about your patch.


 thanks.

Huang Shijie

>
> Regards,
>
> =C2=A0 Wolfram
>
> --
> Pengutronix e.K. =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | Wolfram Sang =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|
> Industrial Linux Solutions =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | http://www.pengutronix.de/ =C2=A0|
