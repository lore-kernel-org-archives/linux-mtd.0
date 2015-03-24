Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YaEgY-0006uY-Lm
 for linux-mtd@lists.infradead.org; Tue, 24 Mar 2015 02:35:20 +0000
Received: by pagv19 with SMTP id v19so35401474pag.2
 for <linux-mtd@lists.infradead.org>; Mon, 23 Mar 2015 19:34:56 -0700 (PDT)
MIME-Version: 1.0
Sender: kalluripunnaiahchoudary@gmail.com
In-Reply-To: <0D23F1ECC880A74392D56535BCADD7354973F1C7@NTXBOIMBX03.micron.com>
References: <BN1BFFO11FD0497164C4D8ECB568C7BDA7C8010@BN1BFFO11FD049.protection.gbl>
 <0D23F1ECC880A74392D56535BCADD7354973F1C7@NTXBOIMBX03.micron.com>
Date: Tue, 24 Mar 2015 08:04:55 +0530
Message-ID: <CAGnW=Bbkum2NEDy7sMkpd6T+e5ksNBf2L8wmpiCWkED9ugkxrg@mail.gmail.com>
Subject: Re: [PATCH] mtd: Expand the ecc placement locations to 1260
From: punnaiah choudary kalluri <punnaia@xilinx.com>
To: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "shaktib@xilinx.com" <shaktib@xilinx.com>,
 "michals@xilinx.com" <michals@xilinx.com>,
 Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 20, 2015 at 4:51 AM, Jeff Lauruhn (jlauruhn)
<jlauruhn@micron.com> wrote:
> This device has a Page size x8: 17,600 bytes (16,384 + 1216 bytes) and mi=
nimum required ECC 24-bit ECC per 1100 bytes of data.  Spare area needed fo=
r ECC would be ECC * M, where M is (codeword <=3D 2^m-1).  In this case M=
=3D14, because (1100*8)<=3D2^14-1, therefore minimum spare area needed is 1=
4*24 =3D 336b or 42B per codeword.  So for this device a minimum of 672byte=
s of the 1216 need to be used for ECC, the rest can be used for other purpo=
ses.
>

Ok. Does it mean increasing the size to 672 bytes will be enough ?
I see that 672 bytes is the minimum required size for 24 bit ecc. There
may be controllers that may detect errors beyond 24 bit and would require
more number of  ecc bytes per codeword. So, i configured the ecc position
value to max oobsize and i believe this change is needed.

Regards,
Punnaiah
>
>
> Jeff Lauruhn
> NAND Application Engineer
>
>
> -----Original Message-----
> From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf =
Of Punnaiah Choudary Kalluri
> Sent: Thursday, March 19, 2015 1:50 AM
> To: dwmw2@infradead.org; computersforpeace@gmail.com
> Cc: linux-kernel@vger.kernel.org; shaktib@xilinx.com; michals@xilinx.com;=
 linux-mtd@lists.infradead.org; kalluripunnaiahchoudary@gmail.com; Punnaiah=
 Choudary Kalluri
> Subject: [PATCH] mtd: Expand the ecc placement locations to 1260
>
> Device like MT29F32G08ABCDBJ4 have a writesize/oobsize of 16K/1260 Bytes.
> So, increasing the maximum ecc placement locations to 1260
>
> Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
> ---
>  include/linux/mtd/mtd.h |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h index f17f=
a75..e73d85b 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -95,7 +95,7 @@ struct mtd_oob_ops {
>  };
>
>  #define MTD_MAX_OOBFREE_ENTRIES_LARGE  32
> -#define MTD_MAX_ECCPOS_ENTRIES_LARGE   640
> +#define MTD_MAX_ECCPOS_ENTRIES_LARGE   1260
>  /*
>   * Internal ECC layout control structure. For historical reasons, there =
is a
>   * similar, smaller struct nand_ecclayout_user (in mtd-abi.h) that is re=
tained
> --
> 1.7.4
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
