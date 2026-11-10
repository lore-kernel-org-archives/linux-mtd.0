Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1D1606A326
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 21:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bxN/T9FH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RU2cjMWh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NNx+xr8B06Ki8SnyGFfOYU0R55oBtYlpoR1zXoox8Ds=; b=bxN/T9FHcaFq4IT9rw8mDA66qQ
	RijfCbMF6+OMEFDgsjwP0JaR7yhNa/ZXuenIZbET7iYOS+P7G1RThoPZThn/KhgNEyTxvoyTulIQX
	ycZtsMb5MZWDSwlracVBg2F0qpjA7cmWvX5wkncrfaet8cR7C7dJ9AMEUazl0pypMi+iSWEI2Vblv
	EBM9LcPRr1v2aG8V0YEe7y+ksA/Ol2a5h5thpVh+yb53ETgyfKQjR6HrBsZ25dqgmr2zuT+mis6DN
	s2nRPAHyo87N8KaQZPIv2Fk0cmgp7Aqpbg7c0vbbAApxdaaKgxOjZ2YnPqsyWvpiJxCk382+IrBx4
	MjGtnAwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtqx-000000056pO-3GbR;
	Tue, 10 Nov 2026 21:58:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtqw-000000056pG-3O6p
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 21:58:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DC28160546;
	Tue, 10 Nov 2026 21:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F35C91F0089F;
	Tue, 10 Nov 2026 21:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794347885;
	bh=kCLtDsSduJN5lzJAUixPHHYwKmpqQ8jqEr8sEL58PF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RU2cjMWhLWTMYaymg1ZzNblHwkcH4bTSYnInlSJSLxQsbLjC6we9+twDh/aNKBpa4
	 ZOKhki2iaWRw0swT0pifRUi3rxOXErfR7rClmPQEWk31ubc+5+qXPLLxH13EM0akS6
	 0ZWYESXcdj7/o5BNONbMOR2vOWEz13IA8pdcE75+hgsg7BgI5AeW2dRxttIvda4X6j
	 J+6ShQT7+OblzOw2TgJHbu68zmtNalFHLGuAc4d8x00CSXbWGAs9iRbgDbZMC8z7LO
	 YGPMXyraW5fb57oy5qxA1F0oSNcFfbE9f48qSfbZOj8UrmeiMqncEm2Hj0LIvZK+0g
	 FMQPrk4s2OT9Q==
Date: Tue, 10 Nov 2026 22:58:00 +0100
From: Christian Brauner <brauner@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Jan Kara <jack@suse.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	linux-ext4@vger.kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, 
	linux-mtd@lists.infradead.org, dsterba@suse.cz, tytso@mit.edu, Mark Fasheh <mark@fasheh.com>, 
	Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: Re: [PATCH v2 02/34] ecryptfs: fall back to a read-only lower file
Message-ID: <20261110-eliminieren-raubbau-gibts-97763ee773d7@brauner>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-2-2f44f64f0b66@kernel.org>
 <sashiko-outbox-191221@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-191221@kernel.org>
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 04:09:48PM +0000, sashiko-bot@kernel.org wrote:
> Because both flags remain set from the failed initialization, does the second
> open short-circuit metadata validation and succeed on the uninitialized empty
> file (and if the lower mount is later remounted read-write, allow writes using
> an in-memory key whose header was never written to disk)?

Pre-existing.

-- 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
