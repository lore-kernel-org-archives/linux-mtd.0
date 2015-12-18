Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aA05M-0004VF-M3
 for linux-mtd@lists.infradead.org; Fri, 18 Dec 2015 18:49:01 +0000
Date: Fri, 18 Dec 2015 19:48:36 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Archit Taneja <architt@codeaurora.org>
Cc: dehrenberg@google.com, cernekee@gmail.com, sboyd@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, computersforpeace@gmail.com,
 agross@codeaurora.org
Subject: Re: [PATCH v4 2/5] mtd: nand: Qualcomm NAND controller driver
Message-ID: <20151218194836.6f04a6e6@bbrezillon>
In-Reply-To: <567284FE.1000504@codeaurora.org>
References: <1438578498-32254-1-git-send-email-architt@codeaurora.org>
 <1439959746-25498-1-git-send-email-architt@codeaurora.org>
 <1439959746-25498-3-git-send-email-architt@codeaurora.org>
 <20151216101547.74c77bdd@bbrezillon>
 <567151BC.7010508@codeaurora.org>
 <20151216151856.0315214c@bbrezillon>
 <567284FE.1000504@codeaurora.org>
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

Hi Archit,

On Thu, 17 Dec 2015 15:18:46 +0530
Archit Taneja <architt@codeaurora.org> wrote:

> 
> >
> > Note that you could put the oobfree area at the end of the OOB area,
> > since this 10-10-10-16-10 representation is already a virtual
> > representation of the OOB area (ECC bytes are actually interleaved with
> > in-band data on the flash).
> 
> But, when I read from the controller's internal buffer via DMA, I first
> get the oobfree area, and only then the last step's ECC bytes. So, the 
> content in chip->oob_poi is in the same order as mentioned
> above (10-10-10-16-10).
> 
> If the upper layers uses MTD_OPS_AUTO_OOB, and if I have a different
> layout as what it is in the oob_poi buffer, then it'll end up
> reading/writing the wrong bytes in nand_transfer_oob/nand_fill_oob.
> 
> Are you suggesting that I modify the contents of oob_poi by hand such
> that it has a cleaner 10-10-10-10-16 representation?

Hm, I thought you could just place the free oob bytes wherever you want
since there's only one oobfree region. AFAICS, it's just a matter of
passing ->oob_poi + 40 instead of passing ->oob_poi + 30 when preparing
the DMA descriptor (30 and 40 are just numbers for this specific use
case).
Anyway, I won't complain if you address all comments but this one.

Best Regards,

Boris


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
