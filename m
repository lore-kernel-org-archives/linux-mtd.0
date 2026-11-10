Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044DE606A31C
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 02:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g7XgwtM4;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=alepacheco.dev header.i=@alepacheco.dev header.a=rsa-sha256 header.s=fm1 header.b=T9/ZZjHX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Ruo21dyn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=UBUttUZj5XG9VOz4Y93cJ/ciAW3z5loYQ5ziXwK80Ck=; b=g7XgwtM4BBSunenTcyvEtOKkJw
	rePpaDOQ8kb1n9oQ07IJQ2ZAlsoBI0Hpk+5mVCVK5L3EtSiAAUvKX5q8pyEVTWb6vS+C+Qgz8GJUQ
	R34SsRSUPyDszA9J+ZEYjVOi8vEqKZUdUbMUs7y87Iw1P00ZqxZRBWMjJxTeTfVB6pJSMFCAVrdPt
	+jcF9i03346+Y6uDit/Kpxz/gT/2l0fpw/Fv23ROkVtMuCFJb+Bb+8WSjsewKNbWt/i9rrOqwZ36i
	r0DeDQLZeSSmR1sxompgQlWzRUDh+jH/FgqI+GE4nbI29eAs2l9AGRcyqAXqtT5ks5NC7M4fML2SF
	3XARhojg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQba8-000000029SR-1IDb;
	Tue, 10 Nov 2026 02:27:32 +0000
Received: from flow-a3-smtp.messagingengine.com ([103.168.172.138])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQba6-000000029RX-03zs
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 02:27:31 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id 80A0B1380EB2
	for <linux-mtd@lists.infradead.org>; Mon,  9 Nov 2026 21:27:26 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Mon, 09 Nov 2026 21:27:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alepacheco.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1794277646; x=1794281246; bh=wcMdtWhwbH+i17pMxbWC/5jbOqh7i02B
	oP1LoVU1BXE=; b=T9/ZZjHXVRReSkrLci/bwMlEMsf4KpIRZwqdDIIcCDNexa1W
	0xMbNExTaovZpGSyqakpUuyFDr+RJH3NNiT670CWysm28GupyrzfhjLlQhv1BNbC
	VY1+aTiWhDkOTd4yDa0Jn9FQZb0RJbyXgxaa057OrjHt5ytM0I9oclwYQ8dmwsPS
	PUyAf3f8H8rNf9BxK/E/CcO5TofwFzRVlVKyZtqY+N5T6QAWxT2twlSVR97IciW0
	lEKec07feLv8hMrLbEgTLq2cO3zmfhV9BCx7Mr9Jkw8cgU/KrtE0AYLb1WMTKSEA
	q203FAyTOkgJAcJ3xVaB/YmcrqKsXEecf9zbWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794277646; x=
	1794281246; bh=wcMdtWhwbH+i17pMxbWC/5jbOqh7i02BoP1LoVU1BXE=; b=R
	uo21dynuetAFkx5L8M7OAdTxThB5fj2uhZTLmi0wrfoCv/PlNy/gBgHiPicVULc9
	d4FwdARhEX0HOpLX45T/0bpyuuWdtgLf5LdZ4JacRFnL+XpSak0OIWBey1zsJX9R
	j7EWCJZWLyWk9ecl0dC0MCiLLFjh1pEiJNZp72pY1nn6n/vZIobV2pCTCC+3YlYo
	W8XXH9Nc6e4CCFICy0cgNbVbFla6y1bpOzGV+JFx6dvpHQsVdRra/ax6yPW6+z7P
	Q5hw/lIoFTf5MVHHrCIkZQtbPUzznFhGNE2oYgYBwp/Z5dMn0Bx94yv84yZh6vNt
	RnOX2bptXzu+SPnSod8Vw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=alepacheco.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794277646; d=alepacheco.dev;
	mf=PGFsZUBhbGVwYWNoZWNvLmRldj4=;
	rt=PGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPg==;
	s=fm1:rsa-sha256:YkzE0KJIIn5Rfeu94JY3kPG0LbIUmyi1rNTZri0UXRtYvK2
	NqgPhvs3KZShrpJRxMOo0+j4N8G5yhVT35c/FnRM1I9Qc0gj7GiPdlSf0C7rDpD2
	/hcJ4S27rinMy+4QvloHvVR1yzwIdL0vXLbYOIvK3gV6yprvsMXa2oHXg/yd4jvv
	c0HXFW1ahRjPZaIVNJ13IufEKLFSJ8GgHiRVIaZHF7IPZ+aHg7lH3tWD/mFzTox9
	zp6Xb/zJ9MWrF2LMT8UH11qwKFPub7icUgw9DuJkf0puwYYVSdIHqPsrsLsU9XI5
	W33qc6yYm5FC0E0JWNXxVEssseMAqX/TPANsG2g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:1ADbDRoYCI8KEYDIUqsRSajRYTh3YgiwWwPgWvJOS+s=:wcMdtWhwbH+i17pMxbWC/5jbOqh7i02BoP1LoVU1BXE=;
X-ME-Sender: <xms:DYHyaiCw0aO9y6CDc8UzDUdRSbABtFzQVjRdrPWDIco1BIzzTir8_A>
    <xme:DYHyanWRkx2j0LzS-QOhYl16pJqRsjWvgKJWqQ6EYuSEm6eJhtDioekJ8Jm6hbVvu
    l8su2EBCXY6NR3lxzpynHhV55rcdVl2ioP3AdTM849fgamDfpqivOo>
X-ME-Proxy-Cause: dmFkZTFRpDl/acqBcuq+rA3OIXXypyscQmDtdFrysMzU4XceyfpueFmFsazOts/1NBkc1f
    OGyG9gHcxwDGNxXvim2PcP07s2U2eYENVBMG2dXVecQ25bJyVKqUClH2933Ul5VnKfFgEO
    q1RkUXny3zklpdHRR5D1NvPrecND846gRyQJ8v2BSrJmayvyw6kQezXzIicti4P1+CKf/+
    x6qaBIqXURgkSEmjlDI4pbsr6mn1egjTfr+qHI1vO4AJL974RFNfE9/tLJ5K/AjvIv/Oki
    PfIHEl2WUa3jgyz294TrLte7xWbVDJVr2WYrQztonsLun0W/EEMghVG1d4eGYKma8TCzYO
    CD8oYcEn+3dipe6IBii/BFayykgJclpn5gpDKwmKZErFu7SI8N/Gmei4a2tTwfXWYub3H0
    VZWe/CYHKPyLIt47WJ6dFe0pLkV+4w7OVbSmMqo+E+9VXaTqFuvAczgmXaaimIrzx66kLc
    LFqEK8ZkiBn2PWyG2Lv4rvzY4QbjLpoyrWgduUs2xHdxvLFCwsXW9jnEWrC8/qIWGskLOC
    4hxD+nvOiTUr6uMiP3awRVnSJkakYww7tFpNwp0MWrs7a0cmCJsJkdAoFAYWzErLLqyH4F
    lEh0moy/Fd9riOLe0ck1WNHkoMd0PtLZw/j0AVmg3/z8WlHaKrP1Fb0xNXTg
X-ME-Proxy: <xmx:DYHyarrtLdzRrT4_cc79rzfXc-CdV7ODsoEs6p7WUHFh3z7ACoL5KQ>
    <xmx:DYHyahGiMcX1K7TWQQPN8ohPEt4XLpVhWA6AjCWIoYKDKndmLGuIOQ>
    <xmx:DYHyartaVDtN19IsLBQl37748sVPCA_pR2QmeBvDkJGTFJI63QwLWQ>
    <xmx:DYHyajWK__WVYxSgU03woVjr668HtCl5jFOVz_N0-V8g7gKOmstA5g>
    <xmx:DoHyav62g26GPZq7dtR21-T0_6E2SrtKLKHUnJKP3TJEucialDc0LUNg>
Feedback-ID: if58e4a8f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 942CC700065; Mon,  9 Nov 2026 21:27:25 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Mon, 09 Nov 2026 21:27:25 -0500
From: "Alejandro Pacheco" <ale@alepacheco.dev>
To: "Richard Weinberger" <richard@nod.at>,
 "David Woodhouse" <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <d1220d53-17d3-4ff2-b145-09047eeb7e23@alepacheco.dev>
In-Reply-To: <e979229f-af42-42c3-987a-c2ed289d8fda@alepacheco.dev>
References: <e979229f-af42-42c3-987a-c2ed289d8fda@alepacheco.dev>
Subject: Re: [PATCH] jffs2: reject uncompressed nodes whose csize and dsize differ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_182730_276856_C057F9A3 
X-CRM114-Status: UNSURE (   4.72  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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

Hi Richard, David,

Gentle ping on this one. It still applies cleanly on top of
v7.4-rc2. Please let me know if you would like anything changed.

Thanks,
Alejandro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
