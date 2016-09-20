Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmFxL-0002xe-Sa
 for linux-mtd@lists.infradead.org; Tue, 20 Sep 2016 07:59:09 +0000
Subject: Re: [PATCH v5] mtd: nand: tango: import driver for tango chips
To: dedekind1@gmail.com, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Mason <slash.tmp@free.fr>
References: <57C94E33.6070304@sigmadesigns.com>
 <20160905091450.017e4aa3@bbrezillon> <57CD4672.1010504@free.fr>
 <20160905131516.0acb8145@bbrezillon> <57D189E1.3020508@sigmadesigns.com>
 <57D193C5.8040004@sigmadesigns.com> <57D2DF96.7060705@sigmadesigns.com>
 <57D5530B.2060209@free.fr> <20160912210810.79ac23c9@bbrezillon>
 <57DFE444.3000003@sigmadesigns.com> <20160919190623.3b9d7842@bbrezillon>
 <57E06892.6010008@free.fr> <20160920092441.1f9fa21e@bbrezillon>
 <1474357196.2342.573.camel@gmail.com>
Cc: Sebastian Frias <sf84@laposte.net>,
 Thibaud Cornic <thibaud_cornic@sigmadesigns.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Jean-Baptiste Lescher <jblescher@gmail.com>,
 Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <b50a4ba9-569f-89e1-8ebf-cafe65c0a23d@nod.at>
Date: Tue, 20 Sep 2016 09:57:56 +0200
MIME-Version: 1.0
In-Reply-To: <1474357196.2342.573.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 20.09.2016 09:39, Artem Bityutskiy wrote:
> On Tue, 2016-09-20 at 09:24 +0200, Boris Brezillon wrote:
>>>>> +  writel_relaxed(chip->timing1,   nfc->reg_base + NFC_TIMING1);
>>>>> +  writel_relaxed(chip->timing2,   nfc->reg_base + NFC_TIMING2);
>>>>> +  writel_relaxed(chip->xfer_cfg,  nfc->reg_base + NFC_XFER_CFG);
>>>>> +  writel_relaxed(chip->pkt_0_cfg, nfc->reg_base + NFC_PKT_0_CFG);
>>>>> +  writel_relaxed(chip->pkt_n_cfg, nfc->reg_base + NFC_PKT_N_CFG);
>>>>> +  writel_relaxed(chip->bb_cfg,    nfc->reg_base + NFC_BB_CFG);  
>>>>  
>>>> Nit: can you avoid these weird alignments. Use a single space after the
>>>> comma.  
>>>  
>>> I was trying to highlight the fact that all these writes are
>>> within the reg_base area. I'll do as you ask, since you are
>>> the gatekeeper.
>>
>> Is that really less clear without the tabs?
> 
> Visually the aligned stuff looks nicer, and some kernel maintainers
> prefer this style. Other maintainers avoid it because it causes more
> churn. Indeed, imaging you need to add another field with longer name,
> or one of the existing fields is renamed - then you need to re-align,
> your patches become larger.

FWIW, I don't like tab aligned stuff for the simple fact because
git grep "foo =" does not find them.
Of course I could use regex magic but this does not make things easier. :-)

Thanks,
//richard
