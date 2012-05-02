Received: from mail-ey0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPPwT-0002a4-S6
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 03:09:26 +0000
Received: by eaak13 with SMTP id k13so26595eaa.36
 for <linux-mtd@lists.infradead.org>; Tue, 01 May 2012 20:09:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1335903148-29539-1-git-send-email-shawn7400@gmail.com>
References: <1335903148-29539-1-git-send-email-shawn7400@gmail.com>
Date: Wed, 2 May 2012 00:09:24 -0300
Message-ID: <CAOMZO5AJn3QjwRga71+HXPr3on7xG-AQtCM58xqx-1J3fA=zuA@mail.gmail.com>
Subject: Re: [PATCH] Change linking order of SPI and MTD.
From: Fabio Estevam <festevam@gmail.com>
To: "Shawn J. Goff" <shawn7400@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 1, 2012 at 5:12 PM, Shawn J. Goff <shawn7400@gmail.com> wrote:
> From: "Shawn J. Goff" <shawn7400@gmail.com>
>
> Currently, UBI initializes before SPI. This is a problem
> if you intend to boot to a UBI volume on an SPI device. =C2=A0UBI will
> fail to initialize with the following message:
>
> UBI error: ubi_init: UBI error: cannot initialize UBI, error -19
>
> The initialization order is determined by the order the modules are
> linked into the kernel, so the fix was to change this order. UBI is
> under the MTD tree, so SPI is now linked in before MTD.

Could EPROBE_DEFER help in this case?
