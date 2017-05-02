Received: from mail-pg0-x233.google.com ([2607:f8b0:400e:c05::233])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5LaE-0000NF-0U
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 00:22:27 +0000
Received: by mail-pg0-x233.google.com with SMTP id o3so46608882pgn.2
 for <linux-mtd@lists.infradead.org>; Mon, 01 May 2017 17:22:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170502000455.13240-1-computersforpeace@gmail.com>
References: <20170502000455.13240-1-computersforpeace@gmail.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon, 1 May 2017 21:22:03 -0300
Message-ID: <CAAEAJfAvSGz5-B2rLTzr-W-Hmv_m9NSZz_fx9Q-bY_kRc8yaLQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: don't leak buffers when ->scan_bbt() fails
To: Brian Norris <computersforpeace@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
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

On 1 May 2017 at 21:04, Brian Norris <computersforpeace@gmail.com> wrote:
> This bug seems to have been here forever, although we came close to
> fixing all of them in [1]!
>
> [1] 11eaf6df1cce ("mtd: nand: Remove BUG() abuse in nand_scan_tail")
>

Well, we came even closer. See [1] for a patch that fixes this by cleaning
BBT init and release.

Back then Boris suggested on IRC to wait for Peter Pan's BBT, which would
address this too.

It's interesting to note that: (1) the patch never got any formal feedback,
despite it was a fix; and (2) Peter Pan's work is still under development.

Guess I should have pressed the upstream buttons harder :-)

[1] http://lists.infradead.org/pipermail/linux-mtd/2016-April/066834.html,
[2] http://lists.infradead.org/pipermail/linux-mtd/2016-April/066835.html
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
