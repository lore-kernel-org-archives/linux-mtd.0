Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62F4C48260
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Feb 2024 22:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kxWp57Jx46lVN0omrHfEA7SVph4XT9VcmP5LMH4T/PE=; b=ExUGoxgcPRICAXPIJczjoHIU0B
	6AvD9/81jmkaMZQEh4zc5v2Cp76HgX7Df8rgCtH5+mJ6o+bWroZ1Kyd5dunGS3pDd0IcYLmFYjbeo
	pi8B4Fgg9pKX9ZLmHxHKFrN5dnMZ2GhQgc6hhdU0GUVd+PEQczqTlv13EeH5ywXRmiI+47NpI30qD
	CXnoKEdbqeoA35CbA3sajETiAchaBgq1gtnkMbOuWyNBLnza9sMbqcxyfWRCrKTZ9/VjbaPLSrpmv
	/bzWxa94dAGrkuomVlS+xOw40LZlZ8661pqtec1BSUA6NgsAAH3jsR+gVi7Sbgqryp99onZ4fmSzX
	Hx22+AOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYDDt-0000000FKXt-0FAz;
	Thu, 08 Feb 2024 22:50:25 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYDDp-0000000FKWN-39Xi;
	Thu, 08 Feb 2024 22:50:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1707432617; bh=OQOZWS9W4YHfzmDcw+aL384kY8AkTwp06uVnYjy8URU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=tVacgHJrPkFYKpZAlRvI7wmmCVxtAMcW23wyMXU00KA+PO/qdgp08wTdkueZGoDvE
	 4CMPC7CG5rFrmbNQ1t0+AUAzqgHyQGMRpaX7MMjV9oD4VFrfXvwyWo3eMLJSY9AALb
	 MYLwWH7s5fe2Zy5455AyzTeAquYjlCkSyCiMd42ENtWroSNX/QFFxfdpt+oWAStbmo
	 +mbe9On44Zq7rHqWypF9cYxLoBf2I6IXygsNi/Hysnvobxh2jWg/h53WJKF2feV4rv
	 B6BzzlLKk53H6g38574purLnml0iT7Ivn8iPQh7qeSil8GXEGL93oZ9dwG7bjZ6+L9
	 xX6xfqGQ1kbRw==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 7C89644AFDD;
	Thu,  8 Feb 2024 22:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1707432617; bh=OQOZWS9W4YHfzmDcw+aL384kY8AkTwp06uVnYjy8URU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=tVacgHJrPkFYKpZAlRvI7wmmCVxtAMcW23wyMXU00KA+PO/qdgp08wTdkueZGoDvE
	 4CMPC7CG5rFrmbNQ1t0+AUAzqgHyQGMRpaX7MMjV9oD4VFrfXvwyWo3eMLJSY9AALb
	 MYLwWH7s5fe2Zy5455AyzTeAquYjlCkSyCiMd42ENtWroSNX/QFFxfdpt+oWAStbmo
	 +mbe9On44Zq7rHqWypF9cYxLoBf2I6IXygsNi/Hysnvobxh2jWg/h53WJKF2feV4rv
	 B6BzzlLKk53H6g38574purLnml0iT7Ivn8iPQh7qeSil8GXEGL93oZ9dwG7bjZ6+L9
	 xX6xfqGQ1kbRw==
Message-ID: <b42ee1d3-f7b4-5d9d-3df2-1afddac1881a@mleia.com>
Date: Fri, 9 Feb 2024 00:50:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [PATCH] mtd: lpc32xx: use typedef for dma_filter_fn
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240208202113.630190-1-krzysztof.kozlowski@linaro.org>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20240208202113.630190-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20240208_225017_541997_67797288 
X-CRM114-Status: UNSURE (   4.92  )
X-CRM114-Notice: Please train this message. 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_225017_541997_67797288 
X-CRM114-Status: UNSURE (   5.82  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2/8/24 22:21, Krzysztof Kozlowski wrote:
> Use existing typedef for dma_filter_fn to avoid duplicating type
> definition.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

--
Best wishes,
Vladimir

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
