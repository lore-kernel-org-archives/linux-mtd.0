Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAHea-00073v-AD
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2018 16:15:54 +0000
Date: Sun, 22 Apr 2018 18:15:30 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 6/9] mtd: nand: qcom: support for checking read errors
 for last codeword
Message-ID: <20180422181530.63f39278@xps13>
In-Reply-To: <d9f06fe59fa76d2dbf97cb0b5de75bc7@codeaurora.org>
References: <1522845745-6624-1-git-send-email-absahu@codeaurora.org>
 <1522845745-6624-7-git-send-email-absahu@codeaurora.org>
 <20180410120542.24ea9ddb@xps13>
 <d9f06fe59fa76d2dbf97cb0b5de75bc7@codeaurora.org>
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

On Thu, 12 Apr 2018 12:47:42 +0530, Abhishek Sahu
<absahu@codeaurora.org> wrote:

> On 2018-04-10 15:35, Miquel Raynal wrote:
> > Hi Abhishek,  
> > > On Wed,  4 Apr 2018 18:12:22 +0530, Abhishek Sahu  
> > <absahu@codeaurora.org> wrote:  
> > >> Add boolean function argument in parse_read_errors to identify  
> >> whether the read error has been called for complete page read or
> >> only last codeword read. This will help in subsequent patches to
> >> detect ECC errors in case of last codeword read.
> > > Can you explain when this happen: "last codeword read"? I don't see the  
> > use case.  
> 
>   Hi Miquel,
> 
>   This is happening inside qcom_nandc_write_oob where the last subpage
>   data is being copied first.

I still don't understand the use case.

What to you mean last 'subpage copied first'?

> 
>     host->use_ecc = true;
> 
>     clear_bam_transaction(nandc);
>     ret = copy_last_cw(host, page);
>     if (ret)
>         return ret;
> 
>   you can refer function comment of qcom_nandc_write_oob  for more
>   detail.
> 
>   Thanks,
>   Abhishek



-- 
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
