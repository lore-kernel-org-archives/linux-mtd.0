Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A83CA0ED3
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Sep 2024 14:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JbeZNaA9ZglNFN3xGtOvqlAyhrTerznjXczWn7N/uDY=; b=4bC+Jch+nkCXwc
	nQn2v8QuiUPl3E7wHij0rpCxILVEeNOKAzMfPf12wwcffD1fXoY/QvaEpNxagHFPQXMu7dat5f8ci
	akZfX6aYcX/4qksLVznREcAc95wRE9C7DI6zi/gFtelzfmRiOtQURbrTm/uKjvAaUJfzNQqnbq7P8
	94qoaWZm0mfvJh3XQ2/NC4v+0QN+vA8t03YJsB8y88Lbid910XCkNztE5X9u0nrwS6XcwgMeJIT9U
	lA/K7OaQlw6jfVYBBrXtlu+Zaealz/aHZbBnW6Q9Od3KfY0exsuYL/iu5/usCSdSOI6H2AO8sohB2
	zkV/hqnZiRA3xi2QVnAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slqnn-00000004jJ0-0zQN;
	Wed, 04 Sep 2024 14:16:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slqmo-00000004j7O-1a82;
	Wed, 04 Sep 2024 14:15:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EB49D5C4C72;
	Wed,  4 Sep 2024 14:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7AF8C4CEC2;
	Wed,  4 Sep 2024 14:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725459304;
	bh=8CHw7H3PN3nnBty6sIGCZZcBUVbUzFhJlewKHpVFNe8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SiqkyfwL+AB0UYJDOiVswVD0shUppcfokOXsiT8IRR7ArweWabLtm1tqDaVyvWjxN
	 WXFhwL2ggNII8R6cVIYqPFSjeNLDSRIuZjIJgGfSXPgnyeIDZ5zkSouzpjWQeO8cpN
	 2cBjIqkMKv74mwLy+ffpGUeW7KrTTAEFAT5pEn+UiBqFSJg+ZGHMgrATYHHGBZOQQB
	 3I7YFo43jUTF2eORu5lzgNqLfcr9a+UBVfa+tv4bji8l3V8+pJH+9epbL81NcFTZvv
	 op/tMHWXSGj0H/otmmmWcezl3yYTopvLlzkSU6lHMNQ1T+WEj8DihJrZB1e9Kesyqx
	 U3WXGm8h7z+eg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush
 Yadav <pratyush@kernel.org>,  Michael Walle <michael@walle.cc>,
  <linux-mtd@lists.infradead.org>,  Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
  <linux-arm-kernel@lists.infradead.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH next 1/2] mtd: rawnand: mtk: Factorize out the logic
 cleaning mtk chips
In-Reply-To: <20240826153019.67106-1-miquel.raynal@bootlin.com> (Miquel
	Raynal's message of "Mon, 26 Aug 2024 17:30:18 +0200")
References: <20240826153019.67106-1-miquel.raynal@bootlin.com>
Date: Wed, 04 Sep 2024 16:15:01 +0200
Message-ID: <mafs01q1zijyy.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_071506_485725_BD0A3791 
X-CRM114-Status: UNSURE (   8.75  )
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

On Mon, Aug 26 2024, Miquel Raynal wrote:

> There are some un-freed resources in one of the error path which would
> benefit from a helper going through all the registered mtk chips one by
> one and perform all the necessary cleanup. This is precisely what the
> remove path does, so let's extract the logic in a helper.
>
> There is no functional change.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
