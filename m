Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F44C76196
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Apr 2023 12:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQ817rWnNLTqJ/Tl0zm9KSS/wssvzM16u6+u2RESpZQ=; b=VwW2LW4tnqRnLb+NQZ65DUi4DQ
	/Sicu0NEMVpcOz8QH0Rf/9E/qWJXKrZLm+xi28xJOReUcdsx8LV5nVB/sXNTA+goqyIr0w1wMFD9X
	JZZldATk8qzXzWnfVD3wU0dV057lIhhnH6DCy4RSONDFAaQwgZ0hVCQgzH5d19bcu487AGy+TrMfJ
	cqaxBilB+r+HsPy3CEYNE+rUgf3DFY+x95IHdW62otdQ7xwMsR1IWOFod7bBXvcwr7p9TcQetFme5
	qLjMOILrorf4T0tlwn6K0e5mBFhxReVCOez70iV2WAhOseoMCjyv7/I1f7Lujsl8DArbhbBuvTsXf
	4pXKIq4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJZm-00FKeR-2h;
	Mon, 03 Apr 2023 12:46:22 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJZk-00FKdk-35
	for linux-mtd@lists.infradead.org;
	Mon, 03 Apr 2023 12:46:22 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 2FA9011EF;
	Mon,  3 Apr 2023 14:46:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1680525979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ThdJSjWaqGfdvGxJMXZ4Rq8xgIW8c/iIcHFwfYIKTlc=;
	b=N0F4B8pBEYhpWU6OBLyAp0HNllyvAGGApYTA7ztFa2DfFDW039qxh6/uqSltiSmY79zxzh
	K9CCulvhTxRMSP5UUSbBGHTBOgbTAnColIJjZkQDT7UNoIhGYeh8lO539mVHrLOLL2D6WK
	1IzR/WeYbB4so0dfj9P2S+L79mVfnykuFNqUgiVFPya90ql5jhLG1OoGX+urXkOKhgulSX
	kWawe8LWfObB1f58BnfxaEMIjTWMpJYDUm9WoStXYx/mtGZD5Q4hMcuEHla56HZMfqXM8/
	jJCtnZO2pEjMm/6A8fu6ktZNM1v46DPNxK/ddmh/hQ/pAimte65wWJnNxhjRig==
MIME-Version: 1.0
Date: Mon, 03 Apr 2023 14:46:19 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 Takahiro.Kuwano@infineon.com, bacem.daassi@infineon.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 04/10] mtd: spi-nor: core: Update name and description
 of spi_nor_set_4byte_addr_mode
In-Reply-To: <20230331074606.3559258-5-tudor.ambarus@linaro.org>
References: <20230331074606.3559258-1-tudor.ambarus@linaro.org>
 <20230331074606.3559258-5-tudor.ambarus@linaro.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <0ed54fa05870805d858389435d3844eb@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_054621_147291_F3E20425 
X-CRM114-Status: UNSURE (   4.64  )
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

Am 2023-03-31 09:46, schrieb Tudor Ambarus:
> Rename method to spi_nor_set_4byte_addr_mode_en4b_ex4b and extend its
> description. This method is described in JESD216 BFPT[SFDP_DWORD(16)],
> BIT(31) and BIT(23).
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
