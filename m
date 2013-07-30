Received: from mail-vb0-x230.google.com ([2607:f8b0:400c:c02::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V44ex-0003NA-G0
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 07:47:56 +0000
Received: by mail-vb0-f48.google.com with SMTP id w16so51067vbf.7
 for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2013 00:47:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1375140263-2028-11-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1375140263-2028-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1375140263-2028-11-git-send-email-ezequiel.garcia@free-electrons.com>
Date: Tue, 30 Jul 2013 00:47:33 -0700
Message-ID: <CAN8TOE_F1Qu6XP54aVG_rmYn5wgBEZFYOzk+eYa_Fuxh9FYmFQ@mail.gmail.com>
Subject: Re: [PATCH 10/13] mtd: nand: pxa3xx: Add inline keyword to
 enable_int()
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, leiwen@marvell.com,
 haojian.zhuang@gmail.com, zonque@gmail.com, linux-mtd@lists.infradead.org,
 grinberg@compulab.co.il, Gregory Clement <gregory.clement@free-electrons.com>,
 eric.miao@marvell.com, David Woodhouse <dwmw2@infradead.org>,
 Willy Tarreau <w@1wt.eu>, nikita@compulab.co.il
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 29, 2013 at 4:24 PM, Ezequiel Garcia
<ezequiel.garcia@free-electrons.com> wrote:
> Now that we have added ARCH_HAS_DMA conditional the function
> enable_int() may be unused. So we declare it as inline
> in order to remove the following warning, when the function is not used:

I haven't reviewed the rest too well yet, but I think you want the
'__maybe_unused' qualifier, not 'inline'.

> drivers/mtd/nand//pxa3xx_nand.c:343:24: warning: 'enable_int' defined
> but not used [-Wunused-function]

Brian
