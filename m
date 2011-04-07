Received: from smtp-out.google.com ([74.125.121.67])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q7iht-0004cw-Hn
	for linux-mtd@lists.infradead.org; Thu, 07 Apr 2011 06:28:42 +0000
Received: from kpbe13.cbf.corp.google.com (kpbe13.cbf.corp.google.com
	[172.25.105.77]) by smtp-out.google.com with ESMTP id p376SdfT003242
	for <linux-mtd@lists.infradead.org>; Wed, 6 Apr 2011 23:28:40 -0700
Received: from pwi9 (pwi9.prod.google.com [10.241.219.9])
	by kpbe13.cbf.corp.google.com with ESMTP id p376SbaR007632
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Wed, 6 Apr 2011 23:28:38 -0700
Received: by pwi9 with SMTP id 9so806071pwi.10
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 Apr 2011 23:28:37 -0700 (PDT)
MIME-Version: 1.0
Sender: dmitriyz@google.com
In-Reply-To: <1299542935-20291-1-git-send-email-mnalajal@codeaurora.org>
References: <1299542935-20291-1-git-send-email-mnalajal@codeaurora.org>
Date: Wed, 6 Apr 2011 23:28:37 -0700
Message-ID: <BANLkTimWFiKmvAi+9OeEsdZyP91599ibSw@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] mtd: nand: Allow NAND chip ids to be included
	standalone.
From: Dima Zavin <dima@android.com>
To: Murali Nalajala <mnalajal@codeaurora.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-arm-msm@vger.kernel.org, dwmw2@infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Acked-by: Dima Zavin <dima@android.com>

On Mon, Mar 7, 2011 at 4:08 PM, Murali Nalajala <mnalajal@codeaurora.org> w=
rote:
> Lets non-standard NAND drivers take advantage of known NAND
> chip information.
>
> The initial development of msm nand driver, driver uses the supported
> NAND devices information as a hardcoded table. Remove the existing
> hardcoded supported flash device table and read the flash device
> information from the flash id table which are part of the mtd subsystem.
>
> Signed-off-by: Dima Zavin <dima@android.com>
> Signed-off-by: Murali Nalajala <mnalajal@codeaurora.org>
> ---
> Changes in V2
> * Add more description to the commit text.
>
> =A0drivers/mtd/nand/Kconfig | =A0 10 +++++++---
> =A01 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index c895922..782275e 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -1,3 +1,10 @@
> +config MTD_NAND_IDS
> + =A0 =A0 =A0 tristate "Include chip ids for known NAND devices."
> + =A0 =A0 =A0 depends on MTD
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 Useful for NAND drivers that do not use the NAND subsys=
tem but
> + =A0 =A0 =A0 =A0 still like to take advantage of the known chip informat=
ion.
> +
> =A0config MTD_NAND_ECC
> =A0 =A0 =A0 =A0tristate
>
> @@ -123,9 +130,6 @@ config MTD_NAND_OMAP_PREFETCH_DMA
> =A0 =A0 =A0 =A0 or in DMA interrupt mode.
> =A0 =A0 =A0 =A0 Say y for DMA mode or MPU mode will be used
>
> -config MTD_NAND_IDS
> - =A0 =A0 =A0 tristate
> -
> =A0config MTD_NAND_RICOH
> =A0 =A0 =A0 =A0tristate "Ricoh xD card reader"
> =A0 =A0 =A0 =A0default n
> --
> 1.7.1.1
>
> --
> Sent by a consultant of the Qualcomm Innovation Center, Inc.
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum=
.
>
>
