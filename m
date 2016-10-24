Received: from mail-ua0-x243.google.com ([2607:f8b0:400c:c08::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byf5Y-0005mo-Mr
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 13:14:56 +0000
Received: by mail-ua0-x243.google.com with SMTP id m11so1418026uab.2
 for <linux-mtd@lists.infradead.org>; Mon, 24 Oct 2016 06:14:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20161024143112.66bb705a@bbrezillon>
References: <1477152922-6722-1-git-send-email-festevam@gmail.com>
 <20161024143112.66bb705a@bbrezillon>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 24 Oct 2016 11:14:30 -0200
Message-ID: <CAOMZO5C79vHrSewFrzox=WBb8W8n_p2gd2jFML-xh51APf24Cw@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: gpmi: disable the clocks on errors
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, han.xu@nxp.com,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[Adding Brian on Cc]

On Mon, Oct 24, 2016 at 10:31 AM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Sat, 22 Oct 2016 14:15:22 -0200
> Fabio Estevam <festevam@gmail.com> wrote:
>
>> From: Fabio Estevam <fabio.estevam@nxp.com>
>>
>> We should disable the previously enabled GPMI clocks in the error paths.
>>
>> Also, when gpmi_enable_clk() fails simply return the error
>> code immediately rather than jumping to to the 'err_out' label.
>>
>> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
>
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>
> Brian, can you take this patch in the MTD tree and queue it for the
> next -rc?
