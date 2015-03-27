Received: from mail-yh0-x22e.google.com ([2607:f8b0:4002:c01::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YbWil-0004iY-6D
 for linux-mtd@lists.infradead.org; Fri, 27 Mar 2015 16:02:55 +0000
Received: by yhim52 with SMTP id m52so40275834yhi.2
 for <linux-mtd@lists.infradead.org>; Fri, 27 Mar 2015 09:02:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55156575.8080704@nic.cz>
References: <55156575.8080704@nic.cz>
Date: Fri, 27 Mar 2015 17:02:32 +0100
Message-ID: <CAFLxGvx-nXQQzOmpJyoGw5a6U8iEM_cr61vJx9aRNu5rAbnNLg@mail.gmail.com>
Subject: Re: Missing support for ECC_SOFT_BCH in fsl-elbc-nand
From: Richard Weinberger <richard.weinberger@gmail.com>
To: =?UTF-8?Q?Martin_Strba=C4=8Dka?= <martin.strbacka@nic.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Tomas Hlavacek <tomas.hlavacek@nic.cz>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 27, 2015 at 3:13 PM, Martin Strba=C4=8Dka <martin.strbacka@nic.=
cz> wrote:
> Hello,
>
> in our product we have Freescale P2020 SoC together with Micron
> MT29F2G08ABAEAWP NAND. Lately we discovered that the internal driver
> (fsl-elbc-nand) supports only 1-bit HW ECC. So we would like to switch
> to ECC_SOFT_BCH (or on-die ECC as I saw some patches in this list
> recently). Do you know if anybody works on this or are there any patches
> already?

Works on what?
I work (obviously) on on-die ECC support.

--=20
Thanks,
//richard
