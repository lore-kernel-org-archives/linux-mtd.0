Received: from mail-la0-x232.google.com ([2a00:1450:4010:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XwfxF-0007xf-Lb
 for linux-mtd@lists.infradead.org; Thu, 04 Dec 2014 23:37:02 +0000
Received: by mail-la0-f50.google.com with SMTP id pn19so14501488lab.37
 for <linux-mtd@lists.infradead.org>; Thu, 04 Dec 2014 15:36:37 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1417731591-14017-1-git-send-email-festevam@gmail.com>
References: <1417731591-14017-1-git-send-email-festevam@gmail.com>
Date: Thu, 4 Dec 2014 21:36:37 -0200
Message-ID: <CAOMZO5BtT-ReYWRtu52gAH-x_DMxvZSu+1R1D2VQH9ayvA_Gfg@mail.gmail.com>
Subject: Re: [RFC] mtd: fsl-quadspi: Allow driver to probe
From: Fabio Estevam <festevam@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 4, 2014 at 8:19 PM, Fabio Estevam <festevam@gmail.com> wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
>
> Calling clk_rate causes the kernel to oops:

Nevermind. I fixed it in the mx6sx clock code.
