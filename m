Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dYe2p-0000x5-BY
 for linux-mtd@lists.infradead.org; Fri, 21 Jul 2017 19:57:05 +0000
Received: by mail-wr0-x241.google.com with SMTP id 12so4957484wrb.4
 for <linux-mtd@lists.infradead.org>; Fri, 21 Jul 2017 12:56:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1496418222-23483-5-git-send-email-pali.rohar@gmail.com>
References: <1496418222-23483-1-git-send-email-pali.rohar@gmail.com>
 <1496418222-23483-5-git-send-email-pali.rohar@gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 21 Jul 2017 21:56:41 +0200
Message-ID: <CAFLxGvwdcA1eHZnNcMNsGTqM4AAFyxyehZ1d==kEYBjCo8-_Rg@mail.gmail.com>
Subject: Re: [PATCH 4/5] mtd: block2mtd: Add support for deleting block2mtd
 mapping
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Joern Engel <joern@lazybastard.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
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

Pali,

On Fri, Jun 2, 2017 at 5:43 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wrot=
e:
> This patch allows user to delete block2mtd mapping via parameters file
> /sys/module/block2mtd/parameters/block2mtd
>
> Syntax is "del=3Ddevice", e.g.:
>
> $ echo -n del=3D/dev/loop0 > /sys/module/block2mtd/parameters/block2mtd

As I wrote in an earlier mail, I hate this interface.
I suggest adding a decent ioctl based interface for dynamic block2mtd's.

--=20
Thanks,
//richard
