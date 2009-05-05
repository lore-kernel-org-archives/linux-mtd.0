Received: from mail-gx0-f176.google.com ([209.85.217.176])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M1KD6-0005Jp-9j
	for linux-mtd@lists.infradead.org; Tue, 05 May 2009 12:57:31 +0000
Received: by gxk24 with SMTP id 24so6585482gxk.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 05 May 2009 05:57:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <71cd59b00905050547r2e4a67dft6c2848d6ff9c9c24@mail.gmail.com>
References: <71cd59b00905050249y7ea998c7mb5bb95c968d28b72@mail.gmail.com>
	<1241526066.3760.37.camel@localhost.localdomain>
	<71cd59b00905050547r2e4a67dft6c2848d6ff9c9c24@mail.gmail.com>
Date: Tue, 5 May 2009 08:57:19 -0400
Message-ID: <8bd0f97a0905050557m2719b705o1510ed9a7ab63198@mail.gmail.com>
Subject: Re: mtdutils and libubiio
From: Mike Frysinger <vapier.adi@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 5, 2009 at 08:47, Corentin Chary wrote:
>> search the archives ... some one already posted a method for libifying
>> the UBI code that exists in mtd-utils. =C2=A0fixing up the minor remaini=
ng
>> issues with that patch seems saner than trying to merge a completely
>> unrelated code base.
>
> libubiio use code from mtd-utils and UBI, so it's not realy a
> "completely unrelated code base".

you didnt indicate any relationship, nor did the git tree.  at any
rate, it's still an untested code base unlike the aforementioned patch
which has been tested and is in active use now.

>>We use them because they are simple. =C2=A0There has been nothing to-date=
 that
>> has really required anything else. =C2=A0I have no experience with CMake=
, but
>> I'd rather avoid adding dependencies on it.
>
> Makefile are simple, but so is CMake. Adding a new shared library is
> as simple as that :

if you read the archives as i suggested, you'd see that shared
libraries are not desirable here.
-mike
