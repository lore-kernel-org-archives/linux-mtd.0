Received: from mail-vb0-f43.google.com ([209.85.212.43])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TX033-0008Ce-Td
 for linux-mtd@lists.infradead.org; Sat, 10 Nov 2012 01:39:51 +0000
Received: by mail-vb0-f43.google.com with SMTP id fq11so5804798vbb.16
 for <linux-mtd@lists.infradead.org>; Fri, 09 Nov 2012 17:39:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1352473841.1814.35.camel@sauron.fi.intel.com>
References: <1350147809-19616-1-git-send-email-shijie8@gmail.com>
 <1351258892.1823.20.camel@sauron.fi.intel.com>
 <508B4586.4090600@freescale.com>
 <1352473841.1814.35.camel@sauron.fi.intel.com>
Date: Fri, 9 Nov 2012 20:39:47 -0500
Message-ID: <CAMiH66E9WTtt=6EhX9XVv9afErGd5Ajfg9qN6dVQhE5FEJVrTw@mail.gmail.com>
Subject: Re: [PATCH] mtd: gpmi: remove unneccessary header
From: Huang Shijie <shijie8@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 9, 2012 at 10:10 AM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Sat, 2012-10-27 at 10:23 +0800, Huang Shijie wrote:
>> =E4=BA=8E 2012=E5=B9=B410=E6=9C=8826=E6=97=A5 21:41, Artem Bityutskiy =
=E5=86=99=E9=81=93:
>> > On Sat, 2012-10-13 at 13:03 -0400, Huang Shijie wrote:
>> > > The whole gpmi-nand driver has turned to pure devicetree supported.
>> > > So the linux/mtd/gpmi-nand.h is not neccessary now. Just remove it,
>> > > and move some macros to the gpmi-nand driver itself.
>> > >
>> > > Signed-off-by: Huang Shijie <shijie8@gmail.com>
>> > I cannot compile-test it because the MXS configuration file I always
>> I tested this patch in mxs and mx6q with the linux-next-20121026.
>> I do not meet such compiler errors.
>>
>> I think the l2-mtd tree is lack of some patches in other people's
>> tree.
>> In the current l2-mtd tree, even i DISABLE the gpmi driver, the kernel
>> still
>> meets the compiler errors.
>
> It is based on v3.7-rc4. Once the patches you refer are in Linus's tree,
> let me know. Thanks!
>
I re-created the .config based on the latest l2-mtd tree. I compiled
the kernel with this patch again, and
there is no compiler error anymore.

Could you re-create your mxs config with "make ARCH=3DARM
mxs_defconfig", and test this patch again?

thanks
Huang Shijie

> --
> Best Regards,
> Artem Bityutskiy
