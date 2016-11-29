Received: from mail-oi0-x229.google.com ([2607:f8b0:4003:c06::229])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cBnhd-0003ax-UT
 for linux-mtd@lists.infradead.org; Tue, 29 Nov 2016 19:04:32 +0000
Received: by mail-oi0-x229.google.com with SMTP id y198so202622919oia.1
 for <linux-mtd@lists.infradead.org>; Tue, 29 Nov 2016 11:04:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1cb0eec2-bd69-b2fb-7a69-80a2cf4a5b6c@gmail.com>
References: <1480433332-2090-1-git-send-email-fabio.estevam@nxp.com>
 <1cb0eec2-bd69-b2fb-7a69-80a2cf4a5b6c@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 29 Nov 2016 17:04:08 -0200
Message-ID: <CAOMZO5AFMzXPamj_=RVt5SCUE8QuombFVNcwCqHzC6F9patpRg@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: lpc32xx_slc: Remove unneeded NULL check on 'rc'
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Vladimir Zapolskiy <vz@mleia.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marek,

On Tue, Nov 29, 2016 at 3:30 PM, Marek Vasut <marek.vasut@gmail.com> wrote:

> I can understand the original code where you avoid calling the malloc()
> in case of failure, but that looks like microoptimization to me.

I did not work on this driver before, so I did not touch the original code.

> Acked-by: Marek Vasut <marek.vasut@gmail.com>

Thanks!
