Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OvKo4-00045Y-Du
	for linux-mtd@lists.infradead.org; Tue, 14 Sep 2010 01:59:37 +0000
Received: by vws11 with SMTP id 11so5967192vws.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Sep 2010 18:59:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <70E876B0EA86DD4BAF101844BC814DFE0903E3E5A5@Cloud.RL.local>
References: <AANLkTim=Fi_-kwaHSpF1OXMVv79xugnigMK7=bzQmE=s@mail.gmail.com>
	<70E876B0EA86DD4BAF101844BC814DFE0903E3E5A5@Cloud.RL.local>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Mon, 13 Sep 2010 21:59:15 -0400
Message-ID: <AANLkTim54nshFKJFWkoJbdpEVBi3e9pn01ANg-gi+XNA@mail.gmail.com>
Subject: Re: linux equivalent of u-boot's "nand scrub" (erasing blocks even
	whenOOB says "bad")
To: Jon Povey <Jon.Povey@racelogic.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 13, 2010 at 21:53, Jon Povey wrote:
> Mike Frysinger wrote:
>> i dont have any devices that have dedicated software BBTs. =C2=A0i'm
>> concerned with just the forced erasing of blocks since the rest works
>> for me already (forced reading and writing). =C2=A0the ability to change
>> the definition of the OOB is apparently "deprecated" now, so i cant
>> fix things on the fly there.
>
> Not quite sure what you mean by the last part. I have used raw writes wit=
h OOB, software-generated ECC and altered layout of flash pages, to good ef=
fect.
>
> I'm don't know what's deprecated, although the kind of hackery I am doing=
 I wouldn't expect to be encouraged by the API. I do, however, appreciate w=
hen such things are possible. Especially on embedded, I don't want a kernel=
 API thinking it knows best about, f.ex., allowing me to erase and rewrite =
the BBT. Stopping me doing it by accident is fine. Making it impossible is =
a pain.

please fix your e-mailer to not generate long  unwrapped lines

i'm talking about MEM{G,S}ETOOBSEL
-mike
