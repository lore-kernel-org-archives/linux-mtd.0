Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CB4606A31C
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 22:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q9Qsg61a;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XvdTMzFI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7DDpHVn95zZUbIpzZktDLjNxT9xcQgK82fpM5N2zF+k=; b=Q9Qsg61akNdKr3EXi2be3B+2ks
	Gzg3blGvS3Spzg+d9JTrf8kiGewmAlH+1R12K5zzUb6UxtnVR8BOqiW6RhoXkoOb/rs8Jn0lZCoTd
	i34+Bc8c1AgLqH5E6+jmVX0vsZ+ae3jrpzDB6EvrmmjhjmO8cm3pgL0v1a30gEKOWHszuytIEIlSV
	OR8pl0Sz5dMkw3wVE8DINUwTIRH8eIwDwJqMB9oVRMlbxuJU7awu+O/qNlVXayjvMh+XFuUPy32ZB
	pZDdc+ZI97fDEWN7MW5Xr0X9K4kTYlijOmrDvysl4Q8gmePTjnV1bL8h9qXUVWoM0DbWhKaTpcRX9
	qPhvVACw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRJq-00000007BxT-09JO;
	Tue, 17 Nov 2026 22:06:26 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRJn-00000007Bws-2k8J
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 22:06:24 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-4a33359c1b3so157131f8f.3
        for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2026 14:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794953182; x=1795557982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eqCIGCTJqZ7BbtWczIXWFrh7eN/wsUXhmj0FDZDRfj0=;
        b=XvdTMzFISb175wx/wj7/cCLFhz5sSKcfSYLaahZc3K1xynLNv84GFgHMamubM2Q8Xv
         ss/oQoBuFI/jGxksLVS5SYxoUEXmujpsAA8FuyKuwE75K0ijJ0fCSYSUMb6mDQMDCNuM
         ERozQJ1Z49G71SGGOaGSWsUBRV/Elhde01OKT8eBBMvSieQ0Dk0BmrVpYATXxHJQwQld
         9YCg7MeL/S7ZWjsjEGpCleHFuyu9Iw6kGo/B2cBXeB2pHF+coQ1B4/XTeS6kQAVBEioX
         HHSeIwa5MOoMA3iZBv1Qs3K5g4VfVX7Yiw2F0I26TyK0Ekk0PtS1BbaGEw0vRURzbjCI
         5iNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953182; x=1795557982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eqCIGCTJqZ7BbtWczIXWFrh7eN/wsUXhmj0FDZDRfj0=;
        b=sdHBzHyvgWVr/A4u36jx5NiK/pKYTySvp2uCXexxTAAzqGGtd5CR4cn418khLXOzhY
         PzzDhM9My5iZXP6YBAfOz8rvPrgcDbIzs1tVULrMQidoGn+mmBPwC7Sptf7OzoMKPGIT
         mWU9mTxBIPExuUxwNrAG56f8DEGy8xO3iD+IeIpO9cO485hYF99qAS/CG+gdq8/FrruK
         1+LsrcuvnB8p/Lo/0wtzEOfIDUn0um8IxovdKfQUCLykmSzJLXkI8Iy7IDaPolAkaUz+
         Dwr+LHkdq6B7CMYL0Y/dUKx44Ldm/DMrxEbB5IahZBhm/bR/Pv24n21rBw+oxWO7FDxX
         PF9Q==
X-Forwarded-Encrypted: i=1; AL+hErG8sJ2nZCWRtzTKfGmHjlHh5ZNKjN5qMkd+L6ffcHQ7ndVJv5HS40j/tsNd970OPvXgf1YBPyL0tTg=@lists.infradead.org
X-Gm-Message-State: APuU4Z/I4Z2Jzkx5yOJfTkLQmbchP6+CdSxkibaQSh2ShxkNDlsQBvmg
	wB0820o/Ts1rCv0CYs6RzB+RMje4dAOovxs+YYenEHzRbtNucTudhBMC
X-Gm-Gg: AZFdTZeNdlzHIXrJ3PIXBXrUn+m/A3Hr3RSlgT1OYSQ9+iq3/MAATSn5O8OUGgNGYKw
	JhG2Jd6iYBwK6903g1fMEfLqA+/yY5Ak+hvDhk1PZXryrsJRZ4rCuWLBNmm7JXiU3IJDnsBXuqy
	XQybDGfWgkROm4Mt/wy/bpozgElNz1VsMZPiL4z/keA0RsxJGuX00nBTdtTnmqsCxEybV7W5+2S
	qTOW88zTFsDmCx63ITTSyswnB7d5Rg3aL/eOxT1+OIWTKWdrQhj1HdXfZtj3+E7X70JZr6WOu29
	kF9A8D3UGKSlr1Glaq3YK9sKmcEcdFKTut0zRoa/i1rSPMij9UXsihUmp97LQ2HMpiVBVGvUXx6
	kWNAsriV3rylTbzlcI3UXZerlZBlg2yJpWrCCIgoPHHMA9/mgvp8AaNMarGJrYEgdhtgnSif4av
	tV98Nu3CVNwdRXt1KQWkHAJzMTefalJOKUwHEpxuRXeTA5OGQOQfhbmlNUeyOEHExpNs9wqkY/z
	qh9TfcEd+OExCx1QEnqAzwLBlI4Dt0cytQChn2mZDLFhoN/NZu0/7KODtZm0W2iN/1ez/4VnQ+Y
	zXNxzTOsmflZqs86+SFFRRBexT/E1Sooxole6C9tT0pqejeDI6yv4ku88QfFQZ8nXifzZyhteLl
	VHQcPdvTjaU5/uY8uLrhN1mWoxO3xP+pm841xd5AF3HutZNk=
X-Received: by 2002:a05:6000:41c2:b0:490:71a7:6f3c with SMTP id ffacd0b85a97d-4a63fa2615bmr1519890f8f.55.1794953181671;
        Tue, 17 Nov 2026 14:06:21 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a655f9f4a7sm1091018f8f.34.2026.11.17.14.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:06:21 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tsbogend@alpha.franken.de,
	linux-mtd@lists.infradead.org,
	linusw@kernel.org,
	kaloz@kernel.org,
	ulli.kroll@googlemail.com,
	john@phrozen.org,
	nico@fluxnic.net,
	dwmw2@infradead.org,
	corbet@lwn.net
Subject: Re: [PATCH v4 2/4] mtd: cfi_cmdset_0002: implement point() for simple linear maps
Date: Tue, 17 Nov 2026 22:06:19 +0000
Message-ID: <20261117220620.3834899-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <sashiko-outbox-219722@kernel.org>
References: <20261117214141.3826637-1-orgads@gmail.com> <20261117214141.3826637-3-orgads@gmail.com> <sashiko-outbox-219722@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_140623_724178_181ADAAB 
X-CRM114-Status: UNSURE (   6.10  )
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
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Does cfi_amdstd_point() leave *virt set to a non-NULL address when
> do_point_onechip() fails on the first chip?

It does, and jffs2 would then scan through it. v5 clears *virt and
*phys when nothing was pointed. I'll wait for review of the rest
before posting it.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
