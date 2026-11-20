Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0340B606A332
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 16:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HMnP3rw4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a0Iby+SQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8fiMx8lSJxA+ddKeXfcYoSa5edtre3NxFsjL5OVF7IE=; b=HMnP3rw401VIO0LJCLDcgzZAMX
	qsfq1QagKTyqNm06iIzpgcsZX2yFPhBIkNFclfEF7B1SfuR8zXQeUF0fX2eGGVBA3BUB0eENvYmFQ
	TJ8KvKCbmgY3T1JhHIOfxWQyM6evxImZi9o1FsNxFKecHV69IcfErXFLEiKCmLlGWRmZ4GlOd1LQk
	SUPvDeIspdU49tQRnq/jEZ+ONblC9y6hVNa1kKEkH3nvlgndVYtH3I6PB2uBX4HZusSBtscVqH/o5
	hLK1+SQDcfWlkPouXLX6UnBAqg+64AU4GSd3rn36KRrANE40CfjckKkH+B1RR/lLZ8JrFc+CIe0Kq
	iZQssUgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURNG-0000000FXnk-1CeR;
	Fri, 20 Nov 2026 16:22:06 +0000
Received: from mail-oi2-x07.google.com ([2607:f8b0:4864:32::7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURNB-0000000FXls-3Msw
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 16:22:04 +0000
Received: by mail-oi2-x07.google.com with SMTP id 5614622812f47-574d803e863so417961b6e.0
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 08:22:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795191721; cv=none;
        d=google.com; s=arc-20260327;
        b=OQ0sRkHpfIipm4iuniOtFJ948nVNBZ111n7rfNMtXMXA8howms/qn+SshfdrCTjp9p
         qcoJ3IRwgt4AA3QjqqCau5PQuMsf784B30coFUJSHGedDTbN2Xyo/LVP95mEAtx9/h2i
         X+vAUq26ZfU4sOKQhKNdbomT0Nx+d+2pmf8YMIxlCiceLcWEFWciFo9H6u4YJEjbX5F3
         kstZ7KP9cLLSWn737RSYIP6CCmuTjzPDyfaAJOKfbsOWTH2Q5Qkh0kYz31PjUWSos6G6
         nnAYRhx6mDxY1FGMkW1fQUdFTmaOf+E/VvYJgzcbc+A/4rJVyq6DLONsvVPIXsAYT8+b
         moww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YtzrsiYRAYlK8UNdUBau7Z8+kGG0uMSS1m3uavQxSD0=;
        fh=jhKp/veUxwZKOK4Nb72eeCClIJqqyVXTwLfUOiGAkd0=;
        b=W5noaU+gTgjXHwueG0vKWtmZBlSKwAjQ5xZwsMDzZ0vf14xulL42FG60x5myaQS1Un
         5135/5ZGe6YUULFoclrJ5Ova72xhL3SmiR9e/LiyA91dvkOwUoLKRqzzfr3MHuAtcFMW
         oLes4pUmzkDbTVf7s4ZEOs34EoNNUHaDIt4GcTFG6OOLrurf8zTsix4/zd89eKSJzjYy
         YuZBmfkccUbrVcRY7SpgxopP9O9HsIBnzaXQuVKLPyYHkGxaSl3vB0l62WykkuZnAY6r
         KzUr/g3tha69gL6rdJt5KhMYDUeHNTRvDYYUBQmNxfXMxoqJPRSD1pg++375dy4jvhhS
         yFYg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795191721; x=1795796521; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YtzrsiYRAYlK8UNdUBau7Z8+kGG0uMSS1m3uavQxSD0=;
        b=a0Iby+SQt0rMdtExSAuH9VT5wwwrY/CeFxXsvvTElIjKPlQprlhn+wNTHgYCfy1hMd
         HXyHxdwYExE0xI8iPWbAaiIALcWsYvG92pVG1rgrXIN/WXuwX4hFtiKOoIGyrs6Q2OaH
         zkxmUyPCYBtuD7D2qfuNDdjfqxwl+tbUCoVAyTfVgqyvR30WyAGiD/pMTtHbKzyA4ojR
         nGwToagvtGUKc9lWUKPhLkjKboZVrbS45KmD36QHXKX8d5Z0bjCdnTLAb9jgiOi0GsYG
         wJYITeINg7ZnOZ2cjuuGLtinbW4hAaeq3PnMSRX8xiuKjEa8DTmncIRQI8+4yzjXqy3c
         9odA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191721; x=1795796521;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YtzrsiYRAYlK8UNdUBau7Z8+kGG0uMSS1m3uavQxSD0=;
        b=ElLRYVXybeVkRr5+s7oXA0WNfsRzYem1HYIQ5YeOVUolqAD7AeOorcBFlaEfalshzj
         y/5vq0oItLqaD+7btNsNu0b3epWpi/9K21RFiUQ9z6XLL2X5plufkSFKHxZ+u4gNxOu+
         AJJgzBmKkRmMiSwF85ol/1YAGb613dFnSz1skmpG09qdUPrh+rN2wCzYdfPbdlmSVidM
         7ezz9Y7tk9HwrXeTQ5gBekzu8uYo/MSgh1pvqNzSP0IL2URZ4SIRbnUX606/+f1Ozz1h
         obgCUJpSj50AH2/Fy+aMnQb9Nt/CulPhLYd5D0F67keQEPRi9gGDoQ+qc2zJKFmmP9YR
         5seA==
X-Forwarded-Encrypted: i=1; AL+hErHKSuDhYZiU4g7/oLrHuAcvI+n5jnsLbSwNFmfv/DwsaKINE6EwgMnO5WHyCUkvrK/aMThM0PB50iE=@lists.infradead.org
X-Gm-Message-State: APuU4Z/xeVMO5+e2QienmE/DEOgVo+H49uop7yhPT94pdf3afV3TIaKU
	zFoqIhNcE6WUej3yFck+4vD+cGNFvsgBdCzMP3G43oCk0Nz/5t1a6BL+zIHbNaNoVr1bhXMrIOl
	OJzsVBS31MMsMS7ZjrD2H1NUS1AUDRFxTTsDj3fqjlMmE
X-Gm-Gg: AYBFou3EQE4J/pQo8TvRN48geRnZnJYs0nKu2R3mE+9G7gA/FH/pj3FH72r5eCAQRgu
	FzPf4C+B9VBe+xAZNfLreedc949bVPbd9zkSD0kOgsJTCuDI/OEmYqjF1oWyLC7VvxqDynvJLRd
	qnSep1WQqYGrmiXkoYoi9zauNUA8Z5zvilNMPXjnrLPy0TbK2P1eOr0HdtZD4/w06NqTObARs+M
	91pzIqSAnFjbPK4IXxMMemorXdCkDmlePDgjzkNnWfliGuAOFioFv05qLADJRMmxaHhBJMblse8
	HRJM8xOgM1M3pZ3VFGovv/tRGz9RM+VzjBTkDVee00YeJ4fSqDJmPxrk39N9D5UqvQ1WZfJbKIc
	Lyhd97z5OfvF7PHtNQosKhxud6grOZ15SvT2PbT5/K0+CVokg8pVgBxOS1RHFHHAE+hD9TeqDyG
	s1ALdBEuWjq+swi4aL0aQ3hUw52j4KG3jox+H03tfKPgjlITcsnJdC
X-Received: by 2002:a05:6808:13d3:b0:531:7f68:842e with SMTP id
 5614622812f47-57a06d1a865mr4088651b6e.8.1795191720553; Fri, 20 Nov 2026
 08:22:00 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112135839.6451-1-dennylin0707@gmail.com>
In-Reply-To: <20261112135839.6451-1-dennylin0707@gmail.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Fri, 20 Nov 2026 08:21:49 -0800
X-Gm-Features: Aa3M54rLCY5Ln1-BqmNVhIEKYaX4QPZ4mKm2voTzZa-x93WPoRkSXTUCtcqgWss
Message-ID: <CAGEkeHcvJnuSFhsUkKMFMQNsA=Q4-Zq3G6XmDwtca0VcK7zi0Q@mail.gmail.com>
Subject: Re: [PATCH v2] ubifs: account for short copies in ubifs_write_end
To: richard@nod.at
Cc: chengzhihao1@huawei.com, lin.nan@h3c.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_082202_622988_7C4329E7 
X-CRM114-Status: UNSURE (   5.07  )
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
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Richard,

Just following up on this patch.

Thanks,
Hungyu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
