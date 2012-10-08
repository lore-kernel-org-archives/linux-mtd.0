Received: from mail-ob0-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TL4Xf-0000mA-Sk
 for linux-mtd@lists.infradead.org; Mon, 08 Oct 2012 04:02:08 +0000
Received: by mail-ob0-f177.google.com with SMTP id wd20so3497350obb.36
 for <linux-mtd@lists.infradead.org>; Sun, 07 Oct 2012 21:02:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <505CB1ED.8010909@gmail.com>
References: <505CB1ED.8010909@gmail.com>
Date: Mon, 8 Oct 2012 01:02:06 -0300
Message-ID: <CAOMZO5Cwgd8WMKyQ64gsKFAbCnCHy4f6ytoOGTzU34h7xPJaVA@mail.gmail.com>
Subject: Re: i.MX6S/GPMI-NAND issue on 3.5.4
From: Fabio Estevam <festevam@gmail.com>
To: Vikram Narayanan <vikram186@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Vikram,

On Fri, Sep 21, 2012 at 3:29 PM, Vikram Narayanan <vikram186@gmail.com> wrote:
> Hello,
>
> I'm facing some issue with GPMI-NAND driver on i.MX6 solo.
> I've a TOSHIBA 4KiB page NAND connected to the GPMI.
> (4KiB + 128 bytes OOB)

Can you please post your mx6sl dts patches? This would help us to
identify the problem.

Regards,

Fabio Estevam
