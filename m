Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281C8606A329
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2026 01:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=loIv2WrT;
	dkim=temperror header.d=eltavine.com header.i=@eltavine.com header.a=rsa-sha256 header.s=spacemail header.b=vDsrctPA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0S3Xdg0ta9YldN+wBtXL5peFFJy40aPGggWIo11TZeg=; b=loIv2WrTDnqKNwwbf3K3mD9sZF
	odXzcX/B2t9pa1kgwN3+BPP01xoJJK0xpTg+JXLdlbbQuwsIq2rguinqmSGKGVb8+piO/hrlZX3Vq
	jEtp9MBScojkkmmxeZ9bt+TW+WtO52vg52WlRYsmhKTyWMXUkwOURbelz+fKMiIfmE75Qq/pRAcAC
	RgO/s+sG7h4qvQQl/MRwb+vRohqoSnDaLSGyQjjZUpJhKXbqgEvrDbTwcUHcnCjtOow7U5Vy27AFc
	da6dsx194SFye+NovwNQYtwGx34hVPykXhV5cS4KAty8xZNQCxeIj3ErpzaSCeMJAGzLghXbLDZ8o
	ZFK2kylw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP9CX-0000000B17n-0Ii7;
	Fri, 06 Nov 2026 01:57:09 +0000
Received: from out-2uec-a122.jellyfish.systems ([63.250.43.122])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP9CT-0000000B16w-1Sfq
	for linux-mtd@lists.infradead.org;
	Fri, 06 Nov 2026 01:57:07 +0000
Received: from localhost.localdomain (unknown [188.253.121.98])
	(using TLSv1.3 with cipher TLS_CHACHA20_POLY1305_SHA256 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA512)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4jLMjV5fR7z8sWP;
	Fri, 06 Nov 2026 01:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eltavine.com;
	s=spacemail; t=1793930192;
	bh=+Vjhwxk8A5Fl2UDF9gVg+5kbiZPgeXIJvHJVGYIoycM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vDsrctPAwVAyL7VtEY+yice1d4PUANx3RJwCWa8bZ1UV/YMvi0BmhMVr/rNQfgJ00
	 /TrUAf7bYsH3bq490QY3ir884rLYQGpswGwGyIDM4Ke/8w9aX8jOZ+PwPiNiGCOdjV
	 QNd5yLKpFS73jBrwQ13bd4lWrTSZ6IFNlYFUja/XHEd7G+HJh2QKtvjXlWlGM0VrXD
	 mv8+2RheoqAKiJUrV1a+3y6ixHN+h4ffgDZ9rripNb0UP1ADzKpucKh2ZZbwMVarK/
	 BIp0F+Oi+Rd1YaPwbZ+zI9f92Xb0MQT73aiKhcLSNlQTdWzbekYsXUm2ZDO+N9o4ep
	 KgkQpLnsX4LvA==
From: eltavine <me@eltavine.com>
To: Shuai Liu <847807867@qq.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] jffs2: fix kernel BUG in jffs2_sum_write_sumnode on empty summary
Date: Fri,  6 Nov 2026 09:56:26 +0800
Message-ID: <179393007518.5660.257036208046697688@eltavine.com>
In-Reply-To: <tencent_FAA58958D0E5079A7E70B1C4382752DC9509@qq.com>
References: <tencent_FAA58958D0E5079A7E70B1C4382752DC9509@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Envelope-From: me@eltavine.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_175705_710632_ABBB7D4D 
X-CRM114-Status: GOOD (  10.89  )
X-Spam-Score: -0.8 (/)
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

Hi Shuai,

> Suggested-by: eltavine <me@eltavine.com>

I'd like to clarify the code authorship of this patch before it is
applied.

I posted an RFC containing this fix on October 15, before your
November 5 submission:

https://lore.kernel.org/linux-mtd/20261015145341.34322-1-me@eltavine.com/

My RFC already replaced JFFS2_WARNING() and BUG() in the empty-summary
branch with dbg_summary(), jffs2_sum_disable_collecting(c->summary),
and goto out. The core control flow and state change are the same in
both patches; the differences in the hunk are the expanded comment
and the debug message wording.

Since the RFC included the implementation, Suggested-by does not fully
reflect my code contribution. Could you preserve my authorship with
an in-body author line in the next revision:

    From: eltavine <me@eltavine.com>

and retain my original sign-off:

    Signed-off-by: eltavine <me@eltavine.com>

followed by your sign-off for your updates and submission?

If there are additional implementation contributions I have overlooked,
please point them out so that we can accurately reflect both of our
contributions. I support getting the fix merged and would like the
code authorship clarified as part of the next revision.

Thanks,
eltavine

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
