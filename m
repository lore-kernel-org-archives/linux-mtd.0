Received: from mail.bugwerft.de ([46.23.86.59])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fbxGZ-0002XF-At
 for linux-mtd@lists.infradead.org; Sun, 08 Jul 2018 00:09:28 +0000
Subject: Re: [PATCH v3 1/3] mtd: rawnand: marvell: add suspend and resume hooks
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: robert.jarzmik@free.fr, boris.brezillon@bootlin.com, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org
References: <20180707064631.799-1-daniel@zonque.org>
 <20180707174839.3cd1e191@xps13>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <ad0f6c68-68c6-62ef-95ae-0abd0caf0efa@zonque.org>
Date: Sun, 8 Jul 2018 02:09:12 +0200
MIME-Version: 1.0
In-Reply-To: <20180707174839.3cd1e191@xps13>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday, July 07, 2018 05:48 PM, Miquel Raynal wrote:
> Daniel Mack <daniel@zonque.org> wrote on Sat,  7 Jul 2018 08:46:29
> +0200:

>> +	writel_relaxed(NDCR_ALL_INT | NDCR_ND_ARB_EN | NDCR_SPARE_EN |
>> +		       NDCR_RD_ID_CNT(NFCV1_READID_LEN), nfc->regs + NDCR);
>> +	writel_relaxed(0xFFFFFFFF, nfc->regs + NDSR);
>> +	writel_relaxed(0, nfc->regs + NDECCCTRL);
> 
> This is an exact copy of a few lines from marvell_nfc_init().
> What about creating an helper called
> marvell_nfc_init_core_registers(nfc) that would be called twice?

Sure, why not. Will send a v4 for that.


Thanks,
Daniel
