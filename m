Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fSdnJ-0001zG-Vt
 for linux-mtd@lists.infradead.org; Tue, 12 Jun 2018 07:33:07 +0000
Received: by mail-wm0-x232.google.com with SMTP id o13-v6so18703973wmf.4
 for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2018 00:32:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5123cb5c017e4316a11a0e83d1faa32d@HIMDWSMB06.ad.harman.com>
References: <5123cb5c017e4316a11a0e83d1faa32d@HIMDWSMB06.ad.harman.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 12 Jun 2018 09:32:33 +0200
Message-ID: <CAFLxGvw3MbjBmsUQdbVA-uS0bUFPAsM3tW2f+raJ=FXAfExkVg@mail.gmail.com>
Subject: Re: UBI Fastmap and checkmap
To: "Lachmann, Juergen" <juergen.lachmann@harman.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
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

J=C3=BCrgen,

On Tue, Jun 12, 2018 at 8:18 AM, Lachmann, Juergen
<juergen.lachmann@harman.com> wrote:
> We are very interested in your "Correctly handle interrupted erasures in =
EBA" patch,
> since we observe occasional corruption of an UBIFS volume.
>
> Currently we are running Linux 4.4.14, but I started testing with the lat=
est UBI code backported.
> Here I had to learn that the check_mapping() function doesn't do anything=
 on dynamic volumes
> since the creation of  the checkmap by calling ubi_fastmap_init_checkmap(=
) is apparently
> skipped  for dynamic volumes inside init_volumes():
>
> 585                 if (vol->vol_type =3D=3D UBI_DYNAMIC_VOLUME) {
>                      ...
>  590                         continue;
>  591                 }
>
> From the code I see no reason why this is done. Is it intentional behavio=
r that check_mapping()
> only works on static volumes, and what's the reason behind?

Meh. The reason is that I've prettified the code before submission and
introduced that...
Fix is on its way.

--=20
Thanks,
//richard
