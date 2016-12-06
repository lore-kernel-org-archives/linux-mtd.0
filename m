Received: from mail-oi0-x22d.google.com ([2607:f8b0:4003:c06::22d])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEAte-0006ki-9Q
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2016 08:14:43 +0000
Received: by mail-oi0-x22d.google.com with SMTP id b126so369795759oia.2
 for <linux-mtd@lists.infradead.org>; Tue, 06 Dec 2016 00:14:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAL-1w2vQHnuDmo-5bsE=Lc-uPpVy4vPU7tNmwkcEasB9uvAZ3A@mail.gmail.com>
References: <CAL-1w2vQHnuDmo-5bsE=Lc-uPpVy4vPU7tNmwkcEasB9uvAZ3A@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 6 Dec 2016 09:14:19 +0100
Message-ID: <CAFLxGvwKKqOWn2Eb06z0JaNo2vxhgi4somVw8bgkFrvtDPY5uw@mail.gmail.com>
Subject: Re: UBIFS crash in power cutting test
To: =?UTF-8?B?5p2O56OK?= <rockdotlee@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
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

Hi,

On Tue, Dec 6, 2016 at 8:13 AM, =E6=9D=8E=E7=A3=8A <rockdotlee@gmail.com> w=
rote:
> Hi, there:
>     I'm doing a random power cutting test(just copy and delete files),
> but got ubifs crash frequently, the rate is about 20%,
> is anyone has any hint about this? BTW, the kernel is 3.18.31, here is th=
e log.

does the flash function correctly?
IOW do both MTD and UBI tests pass?

Are you using xattrs?

--=20
Thanks,
//richard
