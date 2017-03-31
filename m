Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ctru1-0003BX-CO
 for linux-mtd@lists.infradead.org; Fri, 31 Mar 2017 08:27:27 +0000
Date: Fri, 31 Mar 2017 10:27:03 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Enrico Jorns <ejo@pengutronix.de>, Artem
 Bityutskiy <artem.bityutskiy@linux.intel.com>, Dinh Nguyen
 <dinguyen@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Graham Moore
 <grmoore@opensource.altera.com>, David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao Dong
 <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>,
 devicetree@vger.kernel.org, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>
Subject: Re: [PATCH v3 00/37] mtd: nand: denali: 2nd round of Denali NAND IP
 patch bomb
Message-ID: <20170331102703.00d8ca83@bbrezillon>
In-Reply-To: <CAK7LNATUyc821uQTECkkQj2SDKkbrioFfHVsttnsnc8QuT1P-A@mail.gmail.com>
References: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
 <20170330183805.1c29504f@bbrezillon>
 <CAK7LNATUyc821uQTECkkQj2SDKkbrioFfHVsttnsnc8QuT1P-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 31 Mar 2017 13:05:20 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hi Boris,
> 
> 
> 2017-03-31 1:38 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> 
> > The rest looks almost good, except for a few comments I had on patch
> > 14, 18, 25, 26 and 32.
> >
> > I'll probably apply 33 and 34 soon.
> >  
> 
> Thank you!
> Please note I left a minor comment on 34.
> (Accidental addition of braces.)

Yep, I noticed. Applied both after fixing the alignment and removing
unneeded braces in patch 34.

Thanks,

Boris
