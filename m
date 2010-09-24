Received: from mail-qy0-f177.google.com ([209.85.216.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oz0wt-0005Xr-HE
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 05:35:56 +0000
Received: by qyk34 with SMTP id 34so3789242qyk.15
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Sep 2010 22:35:55 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <70E876B0EA86DD4BAF101844BC814DFE093ED5FC9B@Cloud.RL.local>
References: <1285293221-25028-3-git-send-email-vapier@gentoo.org>
	<70E876B0EA86DD4BAF101844BC814DFE093ED5FC9B@Cloud.RL.local>
From: Mike Frysinger <vapier@gentoo.org>
Date: Fri, 24 Sep 2010 01:35:34 -0400
Message-ID: <AANLkTik6reUk+FiAZO91qdM0V07-QBsys+-eYmbbnXk6@mail.gmail.com>
Subject: Re: [PATCH 3/4] mtd-utils: new strtoX helpers
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

On Fri, Sep 24, 2010 at 00:31, Jon Povey wrote:
> linux-mtd-bounces@lists.infradead.org wrote:
>> Simply usage of converting strings to numbers by adding some wrappers
>> around the standard strtoX functions. =C2=A0These helpers support both h=
ex
>> and dec numbers transparently, and the caller need only provide a ptr
>> to an error integer if they want to be notified of problems.
>
>> + */ +#define simple_strtoX(func, type) \
>> +static inline type simple_##func(const char *snum, int *error) \ +{ \
>
> Why inline? won't this bloat code, better to remove inline?

because uninlined static definitions will generate unused warnings

>> + =C2=A0 =C2=A0 =C2=A0 if (snum[0] =3D=3D '0' && snum[1] =3D=3D 'x') \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D func(snum, &e=
ndptr, 16); \
>> + =C2=A0 =C2=A0 =C2=A0 else \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D func(snum, &e=
ndptr, 10); \
>
> Can just call strtol etc. with 0 instead of 10 or 16, it will autodetect
> 0xnnn as base 16.

true ... i'll fix that up
-mike
