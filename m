Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oo2ld-0005cU-1U
	for linux-mtd@lists.infradead.org; Tue, 24 Aug 2010 23:18:57 +0000
In-Reply-To: <AANLkTinV-YT9ypqY8aXxmP2ZVKVsofzU0Y7PLXH6ac5g@mail.gmail.com>
References: <AANLkTikPQfNJ9eZeF6scpnx5beVt=dR6pfNgqcExteMu@mail.gmail.com>	<4C607150.6040806@jkmicro.com>
	<AANLkTinL1dqv9LmQ1zTCEJ46pb=jfc3=25cehHFi9wfT@mail.gmail.com>
	<AANLkTinV-YT9ypqY8aXxmP2ZVKVsofzU0Y7PLXH6ac5g@mail.gmail.com>
Subject: Re: buffer write error (status 0x90)
To: Shane Volpe <shanevolpe@gmail.com>
Message-ID: <OFA98E98D2.70D73DE5-ONC1257789.007F6116-C1257789.008000E9@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Wed, 25 Aug 2010 01:18:08 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=ISO-8859-15
Content-transfer-encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Adam Yergovich <ayergo@jkmicro.com>,
	Jon Ringle <jon@ringle.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>
> Jon,
> I'm also replacing the obsolete P30 part and ran into an interesting
> issue.  It turns out the new replacement part has a larger buffer siz=
e
> so if you mix and match the obsolete part with the newer part you wil=
l
> have issues because if the new part is in the lower nibble 0:15 the
> CFI will read out its buffer size and since that buffer size is large=
r
> than the obsolete P30 sitting in the higher nibble 16:31 then the its=

> buffer will get over run and not work.  So what I'm saying is that
> even though the replacement part is almost the same as the old part d=
o
> not mix and match as the buffer sizes will cause issues.  Although yo=
u
> can patch the kernel and hard code the buffer size to that of the
> legacy P30 or even better patch it to read the buffer sizes out of
> both ICs and use the smaller size.
>
> Regards,
> Shane
>
> On Mon, Aug 9, 2010 at 11:46 PM, Jon Ringle <jon@ringle.org> wrote:
> > On Mon, Aug 9, 2010 at 5:21 PM, Adam Yergovich <ayergo@jkmicro.com>=
 wrote:
> >> Jon Ringle wrote:
> >>>
> >>> We are replacing the discontinued Intel StrataFlash P30 flash
> >>> JS28F256P30T95 with the Numonyx P30-65nm flash JS28F256P30TF on o=
ur
> >>> boards and have a few boards with sample chips. During some testi=
ng
> >>> one of the boards with the Numonyx flash chip is now reporting th=
e
> >>> following buffer write error (status 0x90) on every boot:

Check your samples. We did this too some time ago and the
samples we got were old and had errors not present in production parts.=


> >>
> >> I have tested swapping the lower density part and haven't had any =
problems
> >> with MTD or otherwise. =A0I suspect you've just got a bad part or =
something
> >> else happened.
> >
> > Maybe, but we have seen other incompatibilities that occurred on al=
l
> > of our samples. We use Redboot as the bootloader and we found that =
a
> > Redboot image in ROM mode will hang when trying to unlock and erase=
 a
> > sector. I resolved that problem by building a ROMRAM Redboot image.=


Most likely due to a know bug in the chips. See
"Numonyx Axcell P33/P30 256-Mbit Specification Update"

It states :
When customer uses [...] block unlock, the block lock status might be
altered inadvertently. Lock status might be set to either 01h or 03h
unexpectedly (00h as expected data), which leads to program/erase failu=
re
on certain blocks.

Easy to work around.

 Jocke=
