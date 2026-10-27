Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEAF606A31B
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Oct 2026 09:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x8gWtNao
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=p1/tNYZ92bvUqX6sNAELP3W65Wkhk3Xr/KbfsJmi70I=; b=x8gWtNao+eszr+nxe/YXcdmLRy
	43YHrjlarnCTZI250mKAuwtVz599F1waRMXAndWdxpxYMFB1lz9uQxyhJygQ61qOR2rDEeQRQ6IM8
	5yNAXL+Sx0dxZZTFs6KyGf4RKYNRI9YMidSNuWRiZIqUndOE9SnAzM1s1WTawI2rb/QqDglTqttrp
	ld6+XDsAX/+LK3obajGdvbjxNEna3Qv1HPlqytb8nxEagciYn/nQtNVE5apmhE/XNEuRjgXOWilcf
	mKJ+93LFCWXuSrnbJSCUhfVvSnQIOi3EfanjMaFuQ0Ji3YclWQissr5XOqYJPHQbQZYfrE64dQ2RJ
	u2XMGWTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdKV-000000049Cx-3Vcu;
	Tue, 27 Oct 2026 09:18:51 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdKT-000000049CZ-0r9R
	for linux-mtd@lists.infradead.org;
	Tue, 27 Oct 2026 09:18:50 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xLdHD-0000000021l-066a;
	Tue, 27 Oct 2026 09:18:40 +0000
Date: Tue, 27 Oct 2026 09:18:38 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Vishal Satle <vishalsatleit24@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] mtd: ubi: nvmem: Fix device_node leak in ubi_nvmem_add()
Message-ID: <auBsbmS11_TQTryC@makrotopia.org>
References: <20261027091507.130294-1-vishalsatleit24@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261027091507.130294-1-vishalsatleit24@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_021849_242580_8358E3C5 
X-CRM114-Status: GOOD (  11.22  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 02:45:07PM +0530, Vishal Satle wrote:
> ubi_nvmem_add() calls of_get_child_by_name() to verify that the UBI
> volume device node contains an "nvmem-layout" subnode.
> of_get_child_by_name() returns a pointer to the child device_node
> with its reference count incremented.
> 
> Because the returned pointer was only evaluated as a boolean condition
> and not retained or put, the reference count of the "nvmem-layout" node
> was leaked whenever an NVMEM-enabled UBI volume was registered.
> 
> Assign the child node to a local variable and release it with
> of_node_put() once existence has been validated.
> 
> Fixes: 34a5d8525b6a ("mtd: ubi: add NVMEM support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vishal Satle <vishalsatleit24@gmail.com>

Thanks for fixing this.

Reviewed-by: Daniel Golle <daniel@makrotopia.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
