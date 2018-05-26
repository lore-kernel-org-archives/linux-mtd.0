Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fMUnT-0007Ms-I7
 for linux-mtd@lists.infradead.org; Sat, 26 May 2018 08:43:40 +0000
Date: Sat, 26 May 2018 10:43:17 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Andy Gross
 <andy.gross@linaro.org>, Archit Taneja <architt@codeaurora.org>,
 stable@vger.kernel.org
Subject: Re: [PATCH v3 07/16] mtd: rawnand: qcom: wait for desc completion
 in all BAM channels
Message-ID: <20180526104317.21bc8af2@xps13>
In-Reply-To: <1527250904-21988-8-git-send-email-absahu@codeaurora.org>
References: <1527250904-21988-1-git-send-email-absahu@codeaurora.org>
 <1527250904-21988-8-git-send-email-absahu@codeaurora.org>
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

Hi Abhishek,

On Fri, 25 May 2018 17:51:35 +0530, Abhishek Sahu
<absahu@codeaurora.org> wrote:

> The BAM has 3 channels - tx, rx and command. command channel
> is used for register read/writes, tx channel for data writes
> and rx channel for data reads. Currently, the driver assumes the
> transfer completion once it gets all the command descriptors
> completed. Sometimes, there is race condition between data channel
> (tx/rx) and command channel completion. In these cases,
> the data present in buffer is not valid during small window
> between command descriptor completion and data descriptor
> completion.
> 
> This patch generates NAND transfer completion when both
> (Data and Command) DMA channels have completed all its DMA
> descriptors. It assigns completion callback in last
> DMA descriptors of that channel and wait for completion.
> 
> Fixes: 8d6b6d7e135e ("mtd: nand: qcom: support for command descriptor formation")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
> * Changes from v2:
>   1. Changed commit message and comments slightly
>   2. Renamed wait_second_completion from first_chan_done and set
>      it before submit desc
>   3. Mark for stable tree
> 
> * Changes from v1:
>   NONE
> 
>  drivers/mtd/nand/raw/qcom_nandc.c | 53 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 52 insertions(+), 1 deletion(-)
> 

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
