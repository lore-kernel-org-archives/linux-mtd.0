Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13CD606A321
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 14:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g/+CFMqO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=P7wS3OIp1I+0l+1Doq9MW9dWDFMIQKQ0b9wpq5ZqWfY=; b=g/+CFMqOEjMb5mddOAXOqgKCNQ
	XZcq3+K37hJ1a5M0j3krobaqIc8RcJM630Jsd+0vVQHi86inlTPJAdcZpv0JLB3pvNRv2TKg9pI1o
	BMQbFNbYbKfA2epmqFiyblvyJnqfNOs/2nxQT0aOymNElzP1fAzKgnp7JQ+osqpwEJJaFZn3imiCZ
	sd+ee58UWkOyERahgAbqG1a9norIx5/eX0bDzlnHHHvmCwjjj8dwxSEfWTUBxQecxYJ/FF1qRSwk7
	FFbaVJJYmXO+Vbvfham5Q6VU+JSukwIlISho5vJsZhqYZn9TPA77htbdNtdudXbeN5HC9TQq+sBbp
	Btf24uXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwob-0000000GMPX-1WDL;
	Fri, 27 Nov 2026 14:20:41 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwoY-0000000GMOp-2Y3y
	for linux-mtd@lists.infradead.org;
	Fri, 27 Nov 2026 14:20:40 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xWwoP-000000005kQ-1mR8;
	Fri, 27 Nov 2026 14:20:29 +0000
Date: Fri, 27 Nov 2026 14:20:26 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Zhiqi Zhang <zhiqizhangg@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: ubi: fix nvmem-layout reference leak
Message-ID: <awmRqk0-6gBVfKGm@makrotopia.org>
References: <20261126030033.35385-1-zhiqizhangg@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261126030033.35385-1-zhiqizhangg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_062038_667182_338C6EA5 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 11:00:33AM +0800, Zhiqi Zhang wrote:
> While reviewing the UBI NVMEM provider, I found that ubi_nvmem_add()
> only uses of_get_child_by_name() to check whether the UBI volume has an
> nvmem-layout child node. The helper returns a referenced device_node on
> success, so the current code leaks that reference when the child exists.
> 
> I fixed this by storing the child node pointer and dropping the reference
> once the existence check has completed.
> 
> Fixes: 3ce485803da1 ("mtd: ubi: provide NVMEM layer over UBI volumes")
> Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>

Reviewed-by: Daniel Golle <daniel@makrotopia.org>
Cc: stable

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
