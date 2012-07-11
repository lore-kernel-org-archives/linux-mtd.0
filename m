Received: from service87.mimecast.com ([91.220.42.44])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SosoH-0001rY-5b
 for linux-mtd@lists.infradead.org; Wed, 11 Jul 2012 09:02:14 +0000
Message-ID: <4FFD4105.4050504@arm.com>
Date: Wed, 11 Jul 2012 10:01:57 +0100
From: viresh kumar <viresh.kumar2@arm.com>
MIME-Version: 1.0
To: Julia Lawall <Julia.Lawall@lip6.fr>, Shiraz Hashim <shiraz.hashim@st.com>
Subject: Re: [PATCH] drivers/mtd/devices/spear_smi.c: failure test for null
 rather than negative integer
References: <1341997118-25042-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1341997118-25042-1-git-send-email-Julia.Lawall@lip6.fr>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Cc: spear-devel <spear-devel@list.st.com>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Stefan Roese <sr@denx.de>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adding spear-devel mailing list in cc.

@Shiraz: Can you update ST's mailing list address in entire MAINTAINERS fil=
e, so
that people can include ST's list easily?

On 11/07/12 09:58, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>
> dev_get_platdata returns a pointer, so the failure value would be NULL
> rather than a negative integer.
>
> The semantic match that finds this problem is: (http://coccinelle.lip6.fr=
/)
>
> // <smpl>
> @@
> expression x,e;
> statement S1,S2;
> @@
>
> *x =3D dev_get_platdata(...)
> ... when !=3D x =3D e
> *if (x < 0) S1 else S2
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> ---
>  drivers/mtd/devices/spear_smi.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_=
smi.c
> index b85f183..7c10466 100644
> --- a/drivers/mtd/devices/spear_smi.c
> +++ b/drivers/mtd/devices/spear_smi.c
> @@ -935,7 +935,7 @@ static int __devinit spear_smi_probe(struct platform_=
device *pdev)
>               }
>       } else {
>               pdata =3D dev_get_platdata(&pdev->dev);
> -             if (pdata < 0) {
> +             if (!pdata) {
>                       ret =3D -ENODEV;
>                       dev_err(&pdev->dev, "no platform data\n");
>                       goto err;

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>

--
Viresh

-- IMPORTANT NOTICE: The contents of this email and any attachments are con=
fidential and may also be privileged. If you are not the intended recipient=
, please notify the sender immediately and do not disclose the contents to =
any other person, use it for any purpose, or store or copy the information =
in any medium.  Thank you.
