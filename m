Received: from mail-fx0-f215.google.com ([209.85.220.215])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MU5pc-0002io-E5
	for linux-mtd@lists.infradead.org; Thu, 23 Jul 2009 21:28:08 +0000
Received: by fxm11 with SMTP id 11so1136327fxm.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Jul 2009 14:28:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4A68C329.5040808@nokia.com>
References: <20090723185928.GA1612@gulp.u--3.com> <4A68C329.5040808@nokia.com>
Date: Thu, 23 Jul 2009 23:28:01 +0200
Message-ID: <71cd59b00907231428w5b8b6190p2234d24bc59f0dbc@mail.gmail.com>
Subject: Re: UBIFS fails & crashes on SheevaPlug
From: Corentin Chary <corentin.chary@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "debian-arm@lists.debian.org" <debian-arm@lists.debian.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"erno@gulp.u--3.com" <erno@gulp.u--3.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 23, 2009 at 10:08 PM, Adrian Hunter<adrian.hunter@nokia.com> wr=
ote:
> erno@gulp.u--3.com wrote:
>>
>> Hello,
>>
>> I installed Debian on my SheevaPlug following instructions at
>> <http://www.cyrius.com/debian/kirkwood/sheevaplug/> and everything seeme=
d to
>> work fine until...
>>
>> I wanted to try UBIFS on the built-in flash and followed
>> the instructions for formatting the internal flash
>> at http://www.plugcomputer.org/plugwiki/index.php/Enabling_UBIFS
>> except I made an empty image (no -r parameter for mkfs.ubifs).
>
> Isn't the -r parameter mandatory. =A0For an empty image, use an empty
> directory for the -r parameter.

With recent version of mkfs.ubifs you can format directly an ubi volume wit=
hout
-r parameter (mkfs.ubifs /dev/ubi0_0).

Can you give us the exact commands you used ?

--=20
Corentin Chary
http://xf.iksaif.net - http://uffs.org
