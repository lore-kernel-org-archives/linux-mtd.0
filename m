Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25209C0018A
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Nov 2023 17:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jpDOUdurOhX4k0SnmA5x7ShBS9j24xaLMRoCgNLra2o=; b=aAxOxSJxuyk72rsqlMJq6dziMm
	PSoZkpphaEVUkCEdr9dDAI4Zx4JNDeTKICcMp+SMV2RsSW4VQiCVn9s/gUlvRRLDxoKlmCl2pVR1C
	qLkudmgbt82j1k4PDU7SdA82YF7qpseDCVBYZzKmaNIqSUo+AQC3y1zziut1GicJo0m+1sSdRyq8g
	fsEcsAlapmkQ0hm8aLM71oRPzpGLNLSqEU1bN9mPVDrWr6/6gJBTaTQMykbX4zKVe74FCrhcA/Y44
	w36a31Un/3q6QE13A46Z51vqAfGo1/P3epMKmSD+6KgbjxI1JWdt7P7JG/QbSAtsgNOoKfMDxxU0k
	nbgd85fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qybgm-00A04N-2N;
	Thu, 02 Nov 2023 17:41:04 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qybgg-00A02G-1u;
	Thu, 02 Nov 2023 17:41:02 +0000
Received: from mail.denx.de (unknown [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: festevam@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 642B7874A1;
	Thu,  2 Nov 2023 18:40:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1698946857;
	bh=i7R5v5WQde8X9TsmTK8PNHF6FpcmL4CYEwRniS7ec70=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RBo74GW4KXzxcB3wO91qZeSj/AVlYsZ0qQ/DUz0No/tUU7bValfpp3A0mX0OP8clI
	 uD5PxU/KTtFTP0S/8z1eT+9xIy7Sm8P1bCqmfgPM1+9XYQS6zw3wTQWnXO73neSEQ1
	 y4FttrMxP+HQtHkpKOtPA3ICVsLgDdkQh/5meh381XKQQfDVgOQtXi7gCuQLZGHaDv
	 fu1xfRw9DKjbwhR+ZGN5BLwCvx140g1w+uaFkZo+LPWAK8jV5o7Yv+GgGlh8MFkrL6
	 hiU7B/oNtyX7y2tZ+dne2u0fJnC0ZY74TX86TDJZkC4ItDVfcQvoz8I1wH/5kEWUz/
	 B5BE7bXitnXEw==
MIME-Version: 1.0
Date: Thu, 02 Nov 2023 14:40:56 -0300
From: Fabio Estevam <festevam@denx.de>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: michael@walle.cc, takahiro.kuwano@infineon.com, pratyush@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 bacem.daassi@infineon.com, miquel.raynal@bootlin.com, richard@nod.at
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: add erase die (chip) capability
In-Reply-To: <a7bee4f0-8591-411a-a105-0284df22c464@linaro.org>
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
 <20231101145853.524045-3-tudor.ambarus@linaro.org>
 <7fc95ddf-c860-49b9-93de-ef32b9383e42@linaro.org>
 <216d99d671caa2465519fcc3360c5001@denx.de>
 <e3901646-c918-426f-b219-e1670dc1e854@linaro.org>
 <5c48f93a9dd9b2bdc1874dd4eebbf5bb@denx.de>
 <a7bee4f0-8591-411a-a105-0284df22c464@linaro.org>
Message-ID: <632457ed6b022856496537bdf8a738ba@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_104058_851168_E6CA87FF 
X-CRM114-Status: UNSURE (   7.09  )
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

Hi Tudor,

On 02/11/2023 14:36, Tudor Ambarus wrote:

>> SR is the same before and after the chip erase operation.
> 
> what value did it have?

[   35.726305] spi-nor spi0.0: ***** SR before erase: 0x2
[   35.731543] spi-nor spi0.0: ***** SR after erase: 0x2

If you have some debug patch to dump more information about this issue,
I will be glad to run it here.

Thanks for your help.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
