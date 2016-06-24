Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bGT9f-0005r1-VH
 for linux-mtd@lists.infradead.org; Fri, 24 Jun 2016 15:36:29 +0000
Received: by mail-wm0-x22a.google.com with SMTP id r201so30485357wme.1
 for <linux-mtd@lists.infradead.org>; Fri, 24 Jun 2016 08:36:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160624153307.13d1c850@crub>
References: <20160624153307.13d1c850@crub>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Fri, 24 Jun 2016 12:36:05 -0300
Message-ID: <CAAEAJfAsqm3YJ+mKPyuqe6nZoXJ5LuV7Cv+1yNv9+JVXeJN9tQ@mail.gmail.com>
Subject: Re: Is UBI volume update broken?
To: Anatolij Gustschin <agust@denx.de>
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

Anatolij.

On 24 June 2016 at 10:33, Anatolij Gustschin <agust@denx.de> wrote:
[..]
>
> # ubiupdatevol /dev/ubi0_0 data.ubi
> # echo $?
> 0
>

It seems you are you writing a UBI *volume*, with an image
prepared for a UBI *device*.

> # mount -t ubifs ubi0:data /mnt
> mount: mounting ubi0:data on /mnt failed: Invalid argument
>
> I think that the data.ubi image is okay because after formatting the
> MTD partition with this very image mounting works:
>
> # ubiformat /dev/mtd4 -f data.ubi
> ubiformat: mtd4 (nor), size 16121856 bytes (15.4 MiB), 246 eraseblocks of=
 65536 bytes (64.0 KiB), min. I/O size 1 bytes
> libscan: scanning eraseblock 245 -- 100 % complete
> ubiformat: 246 eraseblocks have valid erase counter, mean value is 5
> ubiformat: flashing eraseblock 14 -- 100 % complete
> ubiformat: formatting eraseblock 245 -- 100 % complete
>

If you wrote down your exact steps, then it's clear this
is wrong:

ubiformat /dev/mtd4 -f data.ubi
ubiupdatevol /dev/ubi0_0 data.ubi

You probably want "ubiupdatevol /dev/ubi0_0 data.img".
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
