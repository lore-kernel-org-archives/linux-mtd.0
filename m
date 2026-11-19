Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB45606A320
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 14:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xzw0MEKC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VDoUCEDi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=d9lDp8BF6Y5e59rZ1uqTczskXBmOB13D3HnxYoOQpx4=; b=Xzw0MEKCIIqPCplDNpILTQkS6H
	LtSlCyZrj/EDZmM/68Se31o+4sqrDUA7DCBF/XtyawfzzBQweK7G+rOXb6M3AM888yt3VsNMJk7s5
	TU3P0ZkzEY53g1sqDJ08ZcQb/OYlxE6xO9G9gmcGDEfBazba8noWMM6QvFkeh5y2waAb2r8IACpjt
	jghz0njKWyBqHZysDDOGVbPIebQk3wNOBhAoDnrfub0CL7N1prA5TcBgLd2yCVMCVVdmzwphpRLbA
	wORkDl6VQKClPXfeaavji5HVlIa5FvDOqx4fCKhM7njvC4h2fRm6tpsdXk5HpMUE1sv0fjT6kYQ8P
	vV9BUYfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2i1-0000000CAN5-2cj2;
	Thu, 19 Nov 2026 14:01:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2hx-0000000CAMm-2okx
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 14:01:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 395B2415D0;
	Thu, 19 Nov 2026 14:01:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 766C61F000C4;
	Thu, 19 Nov 2026 14:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096909;
	bh=Z5EL3q762qp7TZYQCjRPoRbL9JdY+YgOu7t6i3GkEj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VDoUCEDi8AwWGlLBNEhn2eHAlK4rhVAnqwFrUj1/tGdVv3T6fB7PaWjFEw+3YapWA
	 KD+SvN5u0P/Zs0IfsE93cjktRvunyzvzr1h28z9eDiVILFo3Ml0tqlCZpi5j3FLTDR
	 cxKG+SK38nuCg1NN0w6FfDgRGFM2GL1m7csPuPvytMFDvoV/G/ThiXjv0bnSg1N8/t
	 MYm8gQWkenEyE3tQc1tyfAPZiZsRC5LQCQY1w+xbsVGPUtzzrMDmnI78/HJXV7nAt4
	 JAjkr6rfFZZKmPSsQ4iUTpf4M9cas6KDXlluScLuyUHKHhizmA1DUi9p2/sUsrI8UV
	 av37EJEQEc0FQ==
Date: Thu, 19 Nov 2026 15:01:46 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Michael Walle <mwalle@kernel.org>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 10/11] nvmem: u-boot-env: propagate cell registration
 errors
Message-ID: <z5laz72u42uayn6dxbn2x3t3bxtlx3okyrq2dwkua4la5gnjda@cmyyl5iw6wxc>
References: <20261117-submit-nvmem-provider-lifetime-v1-v1-0-3cfbd48812b5@gmail.com>
 <20261117-submit-nvmem-provider-lifetime-v1-v1-10-3cfbd48812b5@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261117-submit-nvmem-provider-lifetime-v1-v1-10-3cfbd48812b5@gmail.com>
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

On Tue, Nov 17, 2026 at 12:38:17PM -0700, James Hilliard wrote:
> The environment parser ignores cell registration failures, so allocation
> failures can leave a partially populated layout reported as successfully
> registered. The OF node reference obtained for a rejected cell is also
> leaked.
> 
> Return the registration error and release the node reference that was
> not transferred to a cell.
> 
> Fixes: 7c8979b42b1a ("nvmem: u-boot-env: use nvmem_add_one_cell() nvmem subsystem helper")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
