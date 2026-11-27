Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31477606A326
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 11:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iRtpMJkn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AQuNOhg+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=M7608bUB+0xOCwMxkH4gJDXfw0iur/CZZ1obVqRxOpM=; b=iRtpMJknpr8sEYb0YcdaGOxaQF
	4IhoVjHXfLJJ8KQkIgpI7uOqB9z/OGBA3gk+HM5+ny29/uPbIIF8aHsGybWyBMFoK0QlkeJ1LOn8j
	sZy7nqLteFl2Ju2nzf084ksynQHB5DzXzH0FDlsKgqgsWIY8jUyMxFcMr8YbH49HX87HRJYMu+qUw
	lmnFyba05VyTnjMr04ALOxtMa2aa7wHkdmuiCM/9ZkeDYRMp+A9yqKq1PEroRg2kZJ9o4DuQD5smm
	Wv1u6MgcWiYgq01zOXz8mEcORnw4624M5rUxO/L/aXlCsQnI8rhtbDK08a9e3Bko7RGkEJYQo0a8V
	u/ntTq/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtuq-0000000FlAD-2Xvy;
	Fri, 27 Nov 2026 11:14:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtuo-0000000Fl9G-2hl5
	for linux-mtd@lists.infradead.org;
	Fri, 27 Nov 2026 11:14:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 09ABA60F40;
	Fri, 27 Nov 2026 11:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14FC21F000C1;
	Fri, 27 Nov 2026 11:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795778093;
	bh=idzCgy/by+Iz7ThGrgxkXNQ6zVzn4IvdXbfeIGiFH7o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=AQuNOhg+e8dpmk5byhcN6939UlsafQiW9iRkldu/WMK4O4FmqSwe1PfptdVMAbzad
	 wlvbRX+PulneDdloRJ9+KDYSSNoMqoGMIEguLWdaoayV3EoOnzzEAjgGMqgtdNfsMH
	 XGb5aIL7RPBnV8yNJe5Q6DCXHX4AjiS74rldibyVbq5HgCmTtQ50Uw51IpyuxH2zBA
	 nEDW5vCx+T9Di7gR2PPtNcBSsADEXxhvMLcYJeeLKtosPjy8f3EHVABAddkMd6o+bV
	 T0SOOD5I8QYQIliZb6VBduehFxRNqXKjtQ2pcNrIYqt8xDAs1iRqa4HUFMOz+BXH5p
	 FbAjIVWehVQHA==
From: Srinivas Kandagatla <srini@kernel.org>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Michael Walle <mwalle@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michael Walle <michael@walle.cc>, Linus Walleij <linusw@kernel.org>, 
 Khouloud Touil <ktouil@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org
In-Reply-To: <20261120-submit-nvmem-provider-lifetime-v1-v3-0-523610652402@gmail.com>
References: <20261120-submit-nvmem-provider-lifetime-v1-v3-0-523610652402@gmail.com>
Subject: Re: (subset) [PATCH v3 00/11] nvmem: complete provider and layout
 disconnection
Message-Id: <179577809082.20168.7510408670870857172.b4-ty@kernel.org>
Date: Fri, 27 Nov 2026 11:14:50 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Fri, 20 Nov 2026 13:08:30 -0700, James Hilliard wrote:
> NVMEM unregister already disconnects register callbacks with SRCU. Some
> accesses extend beyond those callbacks: keepout traversal, cell
> post-processing, DT fixups and device matching can still use provider
> state. Layout unbind also leaves its cells and their callbacks available
> to retained consumers.
> 
> Extend the existing drain to those accesses, and retire layout-owned
> cells independently of provider cells. Old handles retain core-owned
> metadata and reject further access. Explicit cell references and sysfs
> group ownership make layout removal and rebind independent of existing
> consumers. Release the write-protect GPIO when callbacks are drained so
> a retained consumer does not prevent provider reprobe.
> 
> [...]

Applied, thanks!

[01/11] nvmem: retain the provider node until device release
        commit: e5cb8ebd4c5387c5d7eddefbbd89e98efa359878
[02/11] nvmem: drain keepout and cell post-processing accesses
        commit: e770f469df98a02f10e97c2ebe6abf93fec460f7
[03/11] nvmem: exclude disconnected providers from callback admission
        commit: 4508485e8156afd4c9d901f6192d4fe13867e698
[04/11] nvmem: release write protection when the provider disconnects
        commit: 189dc217748ae8ad4198bed150d94aa82a44fa6c

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
