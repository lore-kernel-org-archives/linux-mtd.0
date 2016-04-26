Received: from mail-io0-x22d.google.com ([2607:f8b0:4001:c06::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1av7sS-00028O-Q4
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 18:38:29 +0000
Received: by mail-io0-x22d.google.com with SMTP id 190so18945500iow.1
 for <linux-mtd@lists.infradead.org>; Tue, 26 Apr 2016 11:38:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160426055355.GA25981@localhost>
References: <1461324197-1333-1-git-send-email-zajec5@gmail.com>
 <1461324197-1333-3-git-send-email-zajec5@gmail.com>
 <20160426055355.GA25981@localhost>
Date: Tue, 26 Apr 2016 20:38:07 +0200
Message-ID: <CACna6rw21x+AzeKAyc+Kn2bHNivaYOX7WjkwGASWbz7GKs8CRQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] mtd: brcmnand: respect ECC algorithm set by NAND
 subsystem
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 "open list:BROADCOM STB NAND FLASH DRIVER"
 <bcm-kernel-feedback-list@broadcom.com>,
 open list <linux-kernel@vger.kernel.org>
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

On 26 April 2016 at 07:53, Brian Norris <computersforpeace@gmail.com> wrote=
:
> From: Brian Norris <computersforpeace@gmail.com>
> Date: Mon, 25 Apr 2016 20:48:02 -0700
> Subject: [PATCH] mtd: brcmnand: respect ECC algorithm set by the NAND
>  subsystem
>
> This is more obvious than guessing based on ECC strength. It allows
> using NAND on devices with BCH-1 (e.g. D-Link DIR-885L).
>
> This maintains DT backward compatibility by defaulting to Hamming if a
> 1-bit ECC algorithm is specified without a corresponding algorithm
> selection. i.e., to use BCH-1, you must specify:
>
>   nand-ecc-strength =3D <1>;
>   nand-ecc-step-size =3D <512>;
>   nand-ecc-algo =3D "bch";
>
> Also adds a check to ensure we haven't allowed someone to get by with SW
> ECC. If we want to support SW ECC, we need to refactor some other pieces
> of this driver.
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Tested-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>

I just needed to apply following patch first:
[PATCH] mtd: nand: fix NULL pointer dereference in of_get_nand_ecc_algo
