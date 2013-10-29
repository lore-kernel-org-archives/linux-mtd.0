Received: from co9ehsobe005.messaging.microsoft.com ([207.46.163.28]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vb6zt-0008A5-85
 for linux-mtd@lists.infradead.org; Tue, 29 Oct 2013 10:58:05 +0000
Message-ID: <526F955A.9000108@freescale.com>
Date: Tue, 29 Oct 2013 19:00:42 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Fabio Estevam <fabio.estevam@freescale.com>
Subject: Re: [PATCH] mtd: gpmi: Remove unused set_geometry_by_ecc_info()
References: <1383044084-6532-1-git-send-email-fabio.estevam@freescale.com>
In-Reply-To: <1383044084-6532-1-git-send-email-fabio.estevam@freescale.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2013=C4=EA10=D4=C229=C8=D5 18:54, Fabio Estevam =D0=B4=B5=C0:
> drivers/mtd/nand/gpmi-nand/gpmi-nand.c:123:13: warning: 'set_geometry_b=
y_ecc_info' defined but not used [-Wunused-function]
thanks, but my another patch has fixed this issue, we should not remove
this functions:
http://lists.infradead.org/pipermail/linux-mtd/2013-October/049507.html

Huang Shijie
