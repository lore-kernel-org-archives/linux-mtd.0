Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R5iot-0002Xd-HZ
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2011 18:43:56 +0000
Received: by wyh11 with SMTP id 11so7092775wyh.22
	for <linux-mtd@lists.infradead.org>;
	Mon, 19 Sep 2011 11:43:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1316405649.24366.17.camel@sauron>
References: <1315426421-16243-1-git-send-email-computersforpeace@gmail.com>
	<1315426421-16243-4-git-send-email-computersforpeace@gmail.com>
	<1315749440.18731.65.camel@sauron>
	<1316405649.24366.17.camel@sauron>
Date: Mon, 19 Sep 2011 11:43:52 -0700
Message-ID: <CAN8TOE_RsH28su8ET2MA9MWydniP9J223w=qqPSxV3R78=q2fg@mail.gmail.com>
Subject: Re: [PATCH 03/14] mtd: define `is_ecc_error()' macros
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Matthieu Castet <matthieu.castet@parrot.com>,
	Jim Quinlan <jim2101024@gmail.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Sep 18, 2011 at 9:14 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Sun, 2011-09-11 at 16:57 +0300, Artem Bityutskiy wrote:
>> > +#define is_corrected_ecc_error(error) (error =3D=3D -EUCLEAN)
>>
>> This is not really an error...

I suppose I was just considering the names as describing the error
code, even if it's not fully an error.

>> > +#define is_uncorrected_ecc_error(error) (error =3D=3D -EBADMSG)
>> > +#define is_ecc_error(error) ((is_corrected_ecc_error(error) || \
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 is_uncorrected_ecc_e=
rror(error)))
>>
>> Could we please have static inline functions instead of macros?

Of course we can! Is there a particular reason? Better type checking?
Or just kernel style? I don't think I see a code-size benefit...

>> I think it is nicer to have mtd_ prefixes, how about these names
>> instead:
>>
>> mtd_is_bitflip()
>> mtd_is_eccerr()
>> mtd_is_bitflip_or_eccerr()
>
> Brian, I was actually waiting for v2 of the patches: 3/14, and
> 9/14-14/14.

Right, I hadn't settled on a name yet and so I haven't rewritten the patche=
s.

I like the fact that your names are shorter. I'm not sure about
`mtd_is_bitflip_or_eccerr()', though; the compound name seems a little
out of place. But maybe it's just better to be clear on exactly what
is covered by the function. Is there a broad category name for
bitflips/ECC errors? I just consider them corrected/uncorrected errors
in flash, thus the naming I gave.

I'll either repost with a better naming scheme or update my patches
with the suggested names.

Brian
