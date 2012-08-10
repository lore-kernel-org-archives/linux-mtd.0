Received: from mail-ob0-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SzeyU-0001Zp-0q
 for linux-mtd@lists.infradead.org; Fri, 10 Aug 2012 02:29:18 +0000
Received: by obbta17 with SMTP id ta17so1544075obb.36
 for <linux-mtd@lists.infradead.org>; Thu, 09 Aug 2012 19:29:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <50246D36.1050405@freescale.com>
References: <CAOMZO5DuG9m-SCPPxza=VFMmcWrGnp3Brry6nS8XHrCSzQqM7g@mail.gmail.com>
 <201208100153.51140.marex@denx.de>
 <CAOMZO5BCjV6iLUiQ74GskkOdgGpdqbo2ZB=7eu6VeY=mNwWf0Q@mail.gmail.com>
 <201208100341.23167.marex@denx.de>
 <CAOMZO5DeXp65H2vgtp5qGhV+tXVMuR8sXESc1CzJcJZ2WcmW-A@mail.gmail.com>
 <50246D36.1050405@freescale.com>
Date: Thu, 9 Aug 2012 23:29:16 -0300
Message-ID: <CAOMZO5DVj+Hx6yXZ74ipD6DT9dDsrZwJe-MFfO0-PqSrCyOQNA@mail.gmail.com>
Subject: Re: Kernel crashes when CONFIG_MTD_NAND_VERIFY_WRITE=y
From: Fabio Estevam <festevam@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=UTF-8
Cc: Marek Vasut <marex@denx.de>, Shawn Guo <shawn.guo@linaro.org>,
 Subodh Nijsure <snijsure@grid-net.com>, linux-mtd@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>, computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 9, 2012 at 11:08 PM, Huang Shijie <b32955@freescale.com> wrote:

> I does have a real gpmi_verify_buf function in our BSP code.

Well, the same crash happens in FSL BSP.

> I will send it out as soon as possible.

Ok, great.

Thanks,

Fabio Estevam
