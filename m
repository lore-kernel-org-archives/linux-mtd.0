Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AB6606A32E
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2026 05:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0LoTdZb/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=z+EEatLVs+GoBg8J0zLS4pvoDBK/Um9MMZRORM0521k=; b=0LoTdZb/3axhDDJjw3VDkTAQ0E
	kcxYQWVGbj1J9sNj4CQYnqtmO2ZvaagVTNBxOeNmlyl573TF/7BI9f5HTq9dtXMPS3Ad9lm4k+waS
	Ce0SkkMee+nGN2iQqtVHqGFX1m/nBwHpP+Y0BzdEoA3m57yqqZchoro+UZghn8qM1UB+DOHTPCRzm
	EkmpDjk22CCrznuDcBoype43veolgVNnxfrpIJ08JZs9R3kD2uX3C4OxqN7vS32yF55prcK4QQB0R
	lys0/qdKNAEIjEzKaVQtVvtlkq7hT04I7rJRDECENiQzxHIiyKfXSeQlsR+oFdS5k7Ui0pfBz47x9
	3ea3iz6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO7HY-000000019UI-3PBJ;
	Tue, 03 Nov 2026 05:42:04 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO7HS-000000019TU-2SE1
	for linux-mtd@lists.infradead.org;
	Tue, 03 Nov 2026 05:42:02 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3967B68AFE; Tue,  3 Nov 2026 06:41:55 +0100 (CET)
Date: Tue, 3 Nov 2026 06:41:55 +0100
From: Christoph Hellwig <hch@lst.de>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.com>,
	Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, exfat@lists.linux.dev,
	linux-mm@kvack.org, ntfs@lists.linux.dev,
	ocfs2-devel@lists.linux.dev, linux-btrfs@vger.kernel.org,
	gfs2@lists.linux.dev, linux-efi@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org,
	stable@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 33/34] xfs: allow remounting read-only after a
 shutdown
Message-ID: <20261103054155.GB1559@lst.de>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org> <20261029-work-fs-sb_rdonly-v2-33-2f44f64f0b66@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261029-work-fs-sb_rdonly-v2-33-2f44f64f0b66@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_214158_769742_25A03489 
X-CRM114-Status: UNSURE (   9.62  )
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Btw, if my previous reply wasn't clear:  please add the test for this
to xfstests where they actually get run regularly and not the kernel
selftests which for file systems are basically unused.

Bonus points for having generic tests instead of purely file system
specific ones.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
