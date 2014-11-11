Received: from mail-wg0-x235.google.com ([2a00:1450:400c:c00::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XoHO4-0001Uw-I3
 for linux-mtd@lists.infradead.org; Tue, 11 Nov 2014 19:46:01 +0000
Received: by mail-wg0-f53.google.com with SMTP id b13so12399478wgh.40
 for <linux-mtd@lists.infradead.org>; Tue, 11 Nov 2014 11:45:37 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1415721691-14073-1-git-send-email-fabio.estevam@freescale.com>
References: <1415721691-14073-1-git-send-email-fabio.estevam@freescale.com>
Date: Tue, 11 Nov 2014 20:45:37 +0100
Message-ID: <CAFLxGvwgy-+5K63re678JwcSy2-bNRtDHXiW-1Ve+1En5xHFYg@mail.gmail.com>
Subject: Re: [PATCH] mtd: gpmi: Remove noisy error message
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Fabio Estevam <fabio.estevam@freescale.com>
Content-Type: text/plain; charset=UTF-8
Cc: Huang Shijie <shijie8@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 11, 2014 at 5:01 PM, Fabio Estevam
<fabio.estevam@freescale.com> wrote:
> mx28evk board has a socket for NAND flash that comes with no NAND flash

Wouldn't it make more sense to fix your board's devicetree/boardfile
to not load the gpmi driver?

-- 
Thanks,
//richard
