Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC354C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jan 2022 18:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pl8NpNOrvc1xl1LIU7eEWUi6Q5Z/CbjEHzQrqNO8wqE=; b=QeKFJ18NpjzHMJ
	VAuS0WHKBB1LQAxTtAx3Gb4bjspUvddNKEuBn/M8iA9ufG9VCf3WyvTG3ZgbN6TbX1fzGEw0iMzIL
	9NNyNplK8ronS1ylCq0RYZHjKBnVAKWMOa0JbkBHT83v3hUaJkY4EfNtGEjXjg1SYy/0uEPKvSf4M
	Ab+x6lqqotfm/smk8kbTamWEdps4FHk48GcSOKN7s9/hOsUxirAk/PD2SJagxsGjSIBS01mXmW9MY
	ZTK03UVeLbqp2olTM3O06FaAOo5EiAIE0PlVDHl10TMm0eqnwlgsefWJ/wPl+dXyvPE5OKBLprLC0
	127SbLdPRzXSLqO7dsxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n856a-006tNc-QB; Thu, 13 Jan 2022 18:45:48 +0000
Received: from m-r2.th.seeweb.it ([5.144.164.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n856X-006tME-9H
 for linux-mtd@lists.infradead.org; Thu, 13 Jan 2022 18:45:46 +0000
Received: from [192.168.1.101] (83.6.165.232.neoplus.adsl.tpnet.pl
 [83.6.165.232])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A613C3F398;
 Thu, 13 Jan 2022 19:45:41 +0100 (CET)
Message-ID: <796a60da-2fe5-1712-ed78-d5bb8050779c@somainline.org>
Date: Thu, 13 Jan 2022 19:45:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] mtd: nand: raw: qcom_nandc: Don't clear_bam_transaction
 on READID
Content-Language: en-US
To: ~postmarketos/upstreaming@lists.sr.ht
Cc: martin.botka@somainline.org, angelogioacchino.delregno@somainline.org,
 marijn.suijten@somainline.org, jamipkettunen@somainline.org,
 Manivannan Sadhasivam <mani@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220113184427.2259509-1-konrad.dybcio@somainline.org>
From: Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220113184427.2259509-1-konrad.dybcio@somainline.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_104545_514558_96B9E2F0 
X-CRM114-Status: GOOD (  12.94  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 13.01.2022 19:44, Konrad Dybcio wrote:
> While I have absolutely 0 idea why and how, running clear_bam_transaction
> when READID is issued makes the DMA totally clog up and refuse to function
> at all on mdm9607. In fact, it is so bad that all the data gets garbled
> and after a short while in the nand probe flow, the CPU decides that
> sepuku is the only option.
> 
> Removing _READID from the if condition makes it work like a charm, I can
> read data and mount partitions without a problem.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> This is totally just an observation which took me an inhumane amount of
> debug prints to find.. perhaps there's a better reason behind this, but
> I can't seem to find any answers.. Therefore, this is a BIG RFC!
> 
Somehow I didn't put RFC in the title though, sorry!

Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
