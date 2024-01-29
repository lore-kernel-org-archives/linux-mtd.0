Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F82C47422
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jan 2024 13:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tRIpUfOXKT6/dzPv9jSkGpidj4jnJPSyj1IihcplX9M=; b=jbd+0X0VUR9aNK
	5LhEwVeTkUgd+fnhTPB8HNqqMgghWxm+KCxQhAeqbmLbFgH6BqshiV/QwS3aFSXCROmY0klgnJvAG
	fhtbwkaiyoFHYijukw1bOujtEugQAq56tsBqCsTnLCLVHCNTFVmialAYN8sOzS38/6TsLHEaInffu
	c10BHMZX9yLDWiiMUCToS+I+XQkCRd26emn2iZJREapZx2Th9Tz7GHTJUpm1V8jAHxY4v9xJ1wYMZ
	DOwX+ZISZ3Y4+XME0rnZq7dbXdBA8ZCggNMtn+XZFNLSPL7D11uvufxURsMW1VQ6eThoGIOgSb7JB
	NUue65vcIEwgyaUIBPKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rURSE-0000000CoLZ-0RC9;
	Mon, 29 Jan 2024 13:13:38 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rURSA-0000000CoJV-3M2s
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jan 2024 13:13:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 13471CE12AC;
	Mon, 29 Jan 2024 13:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A332C43390;
	Mon, 29 Jan 2024 13:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706534012;
	bh=XwV0g2CwZMqMa5ckxPruOdi/ginAlkrdcW+c2mTUjDA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Am2M/Eo4OE1Vjhaomxy9ec6vwabgFvHqb6ib1y4Rp2WQq9s0A7abA2plJcwAUA5Qa
	 5Kk9MKQCKaeSsR7RIUzFGmjL63GFSrkwYvbAkzlVuDYjTR3+ujIzTXnddGpDWsKh0P
	 V32KM7lWya6JLujbQ6LO10zEHIly1UnfEsou6m7QkAgvh9p0kLq5N/VJjcyU1Z2QlZ
	 fJ78SK7FmIXTf3Nc15dlKBJj+UIcmtrfIh3oH1mqBKg1zfmqc05xJdET27r9gdRzUx
	 XZEPfapeqL3Zhrpe4tlw6yiEbLtIKpYcfFselT4gwNH23WP8G5OGr9VE4jUSJ1xI43
	 RM6Q8iKkxsEhg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org,  michael@walle.cc,  miquel.raynal@bootlin.com,
  richard@nod.at,  jaimeliao@mxic.com.tw,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] mtd: spi-nor: mark the flash name as obsolete
In-Reply-To: <20231215082138.16063-3-tudor.ambarus@linaro.org> (Tudor
	Ambarus's message of "Fri, 15 Dec 2023 10:21:36 +0200")
References: <20231215082138.16063-1-tudor.ambarus@linaro.org>
	<20231215082138.16063-3-tudor.ambarus@linaro.org>
Date: Mon, 29 Jan 2024 14:13:29 +0100
Message-ID: <mafs07cjsth8m.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_051335_057186_37C924E3 
X-CRM114-Status: UNSURE (   6.13  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Dec 15 2023, Tudor Ambarus wrote:

> The flash name is unreliable as we saw flash ID collisions. Mark the
> name as obsolete.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
