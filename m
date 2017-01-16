Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTE9j-00028N-Ra
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2017 20:45:36 +0000
Received: by mail-ot0-x241.google.com with SMTP id f9so7432074otd.0
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2017 12:45:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170116194154.v2p2gbyvvfb5bwe6@pengutronix.de>
References: <20170116133503.13887-1-u.kleine-koenig@pengutronix.de>
 <CACna6ryLDwr0S=e-uUt+ZGcY8mNDnUtBPg_RmqtSVBziJkZd5w@mail.gmail.com>
 <20170116194154.v2p2gbyvvfb5bwe6@pengutronix.de>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Mon, 16 Jan 2017 21:45:10 +0100
Message-ID: <CACna6rwLaS_i+yEyUsaH8hZZ7y=EA-UK-BHz7m258vfeYuxbNg@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: add dt support for Everspin MRAMs
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Masahiko Iwamoto <iwamoto@allied-telesis.co.jp>,
 Jagan Teki <jagan@openedev.com>,
 Marek Vasut <marex@denx.de>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 16 January 2017 at 20:41, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Mon, Jan 16, 2017 at 02:55:01PM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
>> On 16 January 2017 at 14:35, Uwe Kleine-K=C3=B6nig
>> <u.kleine-koenig@pengutronix.de> wrote:
>> > The MR25 family doesn't support JEDEC, so they need explicit mentionin=
g
>> > in the list of supported spi IDs. This makes it possible to add these
>> > using for example:
>> >
>> >         compatible =3D "everspin,mr25h40";
>> >
>> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>> > ---
>> > Hello,
>> >
>> > independent of the decision if -nonjedec is ok for m25p, this is neede=
d
>> > to make Everspin's MRAMs work.
>> >
>> > Best regards
>> > Uwe
>> >
>> >  drivers/mtd/devices/m25p80.c | 5 +++++
>> >  1 file changed, 5 insertions(+)
>> >
>> > diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80=
.c
>> > --- a/drivers/mtd/devices/m25p80.c
>> > +++ b/drivers/mtd/devices/m25p80.c
>> > @@ -305,6 +305,11 @@ static const struct spi_device_id m25p_ids[] =3D =
{
>> >         {"m25p40-nonjedec"},    {"m25p80-nonjedec"},    {"m25p16-nonje=
dec"},
>> >         {"m25p32-nonjedec"},    {"m25p64-nonjedec"},    {"m25p128-nonj=
edec"},
>> >
>> > +       /* Everspin MRAMs without JEDEC support */
>> > +       { "mr25h256" }, /* 256 kib, 40 MHz */
>>
>> A trivial thing: I think it should be Kib
>> https://en.wikipedia.org/wiki/Binary_prefix
>
> Oh, really? 10^3 =3D k and 2^10 =3D Ki, stange. Should I resend for that?

I don't think I understand you now. This is 262'144b device. You most
likely want to divide it by 1024 and use Kib then, right?

So it should be just 256 Kib instead of 256 kib.

--=20
Rafa=C5=82
