Received: from mail-vn0-x229.google.com ([2607:f8b0:400c:c0f::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z8wRt-0000si-J3
 for linux-mtd@lists.infradead.org; Sat, 27 Jun 2015 20:11:38 +0000
Received: by vnbf7 with SMTP id f7so19654688vnb.7
 for <linux-mtd@lists.infradead.org>; Sat, 27 Jun 2015 13:11:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <558D6251.1070603@houston-radar.com>
References: <558D6251.1070603@houston-radar.com>
Date: Sat, 27 Jun 2015 22:11:14 +0200
Message-ID: <CAFLxGvzr9nBgfWbRsg9seviD4AQ9-u+CNadDFyyvr-j2N_XKqA@mail.gmail.com>
Subject: Re: ubifs_scan: corrupt empty space
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Brian Hill <brian@houston-radar.com>
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

On Fri, Jun 26, 2015 at 4:31 PM, Brian Hill <brian@houston-radar.com> wrote=
:
>
> One of our systems using Atmel ARM A5, Micron MT29F4G08ABADAWP -w- kernel=
 3.17 produced this error, which proved unrecoverable:
>
> UBIFS error (pid 452): ubifs_scan: corrupt empty space at LEB 2670:125358
> UBIFS error (pid 452): ubifs_scanned_corruption: corruption at LEB 2670:1=
25358
> UBIFS error (pid 452): ubifs_scanned_corruption: first 1618 bytes from LE=
B 2670:125358
> 00000000: fffffffd ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
ffffffff
>
> There have been various threads on this type of error over the years, suc=
h as:
> http://lists.infradead.org/pipermail/linux-mtd/2012-January/039254.html
>
> The most notable comment being:
>
>> ubifs expect empty space to be protected by ecc. But if empty page ecc i=
s not
>> ff, this need hack in the nand driver.
>
> I find that no, the atmel driver, unlike some others, doesn't attempt to =
"correct" erased pages which contain bit flips.
> Is the driver still the preferred place to address this issue?  What if t=
he erased space has more bit flips than the ECC strength of the device?  It=
 seems like that block should simply be retired - it has no actual user dat=
a.  Will UBIFS handle this particular condition?

UBIFS assumes that an empty page contains only 0xFFs.
On modern NAND chips, especially MLC, this seems no longer to be the case.

So far no generic solution was found.
Please see:
http://lists.infradead.org/pipermail/linux-mtd/2014-March/052521.html
and
http://lists.infradead.org/pipermail/linux-mtd/2014-March/052507.html

--=20
Thanks,
//richard
