Received: from mail-db9lp0252.outbound.messaging.microsoft.com
 ([213.199.154.252] helo=db9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V957D-0003r0-Rg
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2013 03:17:49 +0000
Message-ID: <5209A573.6060807@freescale.com>
Date: Tue, 13 Aug 2013 11:18:11 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 08/10] mtd: add MTD_MLCNANDFLASH case for mtd_type_show()
References: <1376286173-12581-1-git-send-email-b32955@freescale.com>	<1376286173-12581-9-git-send-email-b32955@freescale.com>	<20130813010502.GF7267@brian-ubuntu>	<520997F3.4010202@freescale.com>
 <CAN8TOE91kY+adwv_zVYikPx_sT1OyOPe+NH9Ddw4cznBMTaRiQ@mail.gmail.com>
In-Reply-To: <CAN8TOE91kY+adwv_zVYikPx_sT1OyOPe+NH9Ddw4cznBMTaRiQ@mail.gmail.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2013=C4=EA08=D4=C213=C8=D5 11:10, Brian Norris =D0=B4=B5=C0:
> I think the "nand" to "SLC nand" patch should be dropped, but this
> patch is a different story. Without this patch, MLC NAND will be
> exported as "unknown". So you need a new patch which will combine the
> 'switch (mtd->type)' cases for MTD_NANDFLASH and MTD_MLCNANDFLASH.
> Otherwise, your patch set leaves MLC exported as "unknown" (a
ok, I will keep this patch, and update the document.

thanks
Huang Shijie
