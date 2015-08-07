Received: from mail-wi0-f175.google.com ([209.85.212.175])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNaAR-00066r-2L
 for linux-mtd@lists.infradead.org; Fri, 07 Aug 2015 05:26:07 +0000
Received: by wicgj17 with SMTP id gj17so47340795wic.1
 for <linux-mtd@lists.infradead.org>; Thu, 06 Aug 2015 22:25:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAKWcF8-LTkPQEjLR3gdiZ1ZLrmoZHqdo2tBkzZsnrxiVqK+oag@mail.gmail.com>
References: <CAKWcF8-LTkPQEjLR3gdiZ1ZLrmoZHqdo2tBkzZsnrxiVqK+oag@mail.gmail.com>
Date: Fri, 7 Aug 2015 02:25:44 -0300
Message-ID: <CAAEAJfC_iy=5GumEVJrY_V_7z2gTwXHwZHwzwt_YOzwn4sEsgg@mail.gmail.com>
Subject: Re: Encrypting UBIFS Filesystem
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: shawn rose <shawn@ecoventsystems.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
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

Shawn,

On 6 August 2015 at 09:02, shawn rose <shawn@ecoventsystems.com> wrote:
>
> Anyone have experience, or know of people/company/contractors, that
> have Encrypted UBIFS before?  If so, I'd like to be introduced.  I
> have a IoT device which is currently using UBIFS and like to encrypt
> the entire system.  I am looking for the lessons learned from those
> who have done this before.
>

You can use a regular block filesystem on top of UBI using the block
interface (drivers/mtd/ubi/block.c), and then use standard encrypt stuff
for block devices (dm-crypt for instance).

However, this has nothing to do with UBIFS, so maybe it's not an option for=
 you.

If the filesystem you want to encrypt is read-only, then you may consider
the UBI block option.

Hope it helps,
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
