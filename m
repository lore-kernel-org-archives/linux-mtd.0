Return-Path: <SRS0=zmx6=62=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55520C54E4B
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 07:34:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A35620733
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 07:34:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="agWbEMcM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sMw5Ou1D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A35620733
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/c23ZOXbZ8klsBa0zFLQjX0DOb2FvEDmKbRAk9F5rmk=; b=agWbEMcM++XsBl
	3+M1W2DqYJll8tqTfE/IJgKyupVTcUzyKk3edvuPL3W+sBznMo8uKZHMdAxqThAwQYF2fw6+QzNHi
	RTvUqltKwYf29U697qb+WBv0UgV9gss9pgJvMaZ6vMAbax0EV1Yu+ig1T1b8zPyXCyAPqIXKMv2gF
	XxUVv4+iOW2j+gexeN23Q8kaBC9OfFJVZ2k6r8KiIwyYVvQCRa9Zb/ESV/72CYgM1sVCDBBXuxNHF
	7SlW+mLNdIIhH6jnagq2iguELKvPk3QUvrPciw1BBT94VUI74XwagNONm2pcE2uoyE7Pjxx7cRQxk
	p+PWtfFiLL4JNMFyoGfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYPQF-0004t9-W1; Tue, 12 May 2020 07:33:52 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYPPz-0004dT-IP
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 07:33:36 +0000
Received: by mail-wm1-x344.google.com with SMTP id f134so8394686wmf.1
 for <linux-mtd@lists.infradead.org>; Tue, 12 May 2020 00:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jqkgqmkJOKoKq9LVMSsdUKqLeUylhGstfJdiNW1m0pU=;
 b=sMw5Ou1DxQ0gDVShwnb+r0jVY9OgvPxlTdxCYMUjeHxnjkdnMZEHlB/ETLFPEyrQTV
 f3UPUtvn02e8incuNsrA11dODEo8ERiZctXWIS9t+3PUT1b2uMacgCg3/Ld5pqCI6iSS
 jHNB9PxINIhrl5lkZjVJuurycwFhX7NfNY5F1P7ObmQLDN6gOj+iBSUkifaxIlHcgIaV
 R3TvhWGCzwiwQ8CDEHA0GKqkXovGyr1DhUAs93B7lppeobuG6EQ+WncjtZN1nOtfxt01
 F1pfYC+jfYvXSiySnTpWSwVxAj0mPGkNxduwk6Jgf4NEyPx2ePn7ttz4TKL+dz5uhjQq
 pAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jqkgqmkJOKoKq9LVMSsdUKqLeUylhGstfJdiNW1m0pU=;
 b=EDwZOHleQYPJUGwtMsttYsvyAY+twC5zs+AMrwW9DrRGVXqMbCx+Yfj2XdUPdzqS6t
 +eSAC85uirHbmMasuWfFk6A7GW0GypjBh9Lp4cwxKQABxcu0y7JrMF+ip23ZLcYR1/0j
 fxfIpy6IE8z+HioPwZGjXrFSuJOiPW8yhQlcmXpoGhMYJzcG61++y0hINBGPozEoA4DS
 bkDgGwXx8Pld6ByczfYh1exbcEQ4CFtH9GOIjjy5eDL/U/cKe1PwUVln27cevFMWbr5G
 shMRD7c8krLFUerG+v2Ndod2Bk2DYP+9RVCjPsl1XyXPJecvYwPTzE0FxHvVOrAcepzM
 oEaA==
X-Gm-Message-State: AGi0PuZ5vh+TimdUFfjwvtMwYVaRPktNT10HrVVMWNdV8SuYKqTmqqY8
 TUqO4TIJUpeLbFXHRk6TqJk=
X-Google-Smtp-Source: APiQypLLSffxSVovV7tqZUrpdXOgAzbPqHBnVWM76vtOVvD70huOXD6rxYEtuZXYxJgRz4MPLxVK8w==
X-Received: by 2002:a7b:c74d:: with SMTP id w13mr34531649wmk.36.1589268814233; 
 Tue, 12 May 2020 00:33:34 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net.
 [83.49.57.198])
 by smtp.gmail.com with ESMTPSA id d9sm5961197wmd.10.2020.05.12.00.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 00:33:33 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v2 1/5] mtd: rawnand: brcmnand: rename v4 registers
Date: Tue, 12 May 2020 09:33:25 +0200
Message-Id: <20200512073329.742893-2-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512073329.742893-1-noltari@gmail.com>
References: <20200510151406.2527856-1-noltari@gmail.com>
 <20200512073329.742893-1-noltari@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_003335_608393_9BB6A273 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhlc2UgcmVnaXN0ZXJzIGFyZSBhbHNvIHVzZWQgb24gdjMuMy4KClNpZ25lZC1vZmYtYnk6IMOB
bHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgotLS0KIHYyOiBmaXggY29t
bWl0IHRpdGxlLgoKIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgfCA4
ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMg
Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCmluZGV4IGU0ZTNjZWVh
YzM4Zi4uNmEwOGRkMDdiMDU4IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNt
bmFuZC9icmNtbmFuZC5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21u
YW5kLmMKQEAgLTMzOCw4ICszMzgsOCBAQCBlbnVtIGJyY21uYW5kX3JlZyB7CiAJQlJDTU5BTkRf
RkNfQkFTRSwKIH07CiAKLS8qIEJSQ01OQU5EIHY0LjAgKi8KLXN0YXRpYyBjb25zdCB1MTYgYnJj
bW5hbmRfcmVnc192NDBbXSA9IHsKKy8qIEJSQ01OQU5EIHYzLjMtdjQuMCAqLworc3RhdGljIGNv
bnN0IHUxNiBicmNtbmFuZF9yZWdzX3YzM1tdID0gewogCVtCUkNNTkFORF9DTURfU1RBUlRdCQk9
ICAweDA0LAogCVtCUkNNTkFORF9DTURfRVhUX0FERFJFU1NdCT0gIDB4MDgsCiAJW0JSQ01OQU5E
X0NNRF9BRERSRVNTXQkJPSAgMHgwYywKQEAgLTU5MSw4ICs1OTEsOCBAQCBzdGF0aWMgaW50IGJy
Y21uYW5kX3JldmlzaW9uX2luaXQoc3RydWN0IGJyY21uYW5kX2NvbnRyb2xsZXIgKmN0cmwpCiAJ
CWN0cmwtPnJlZ19vZmZzZXRzID0gYnJjbW5hbmRfcmVnc192NjA7CiAJZWxzZSBpZiAoY3RybC0+
bmFuZF92ZXJzaW9uID49IDB4MDUwMCkKIAkJY3RybC0+cmVnX29mZnNldHMgPSBicmNtbmFuZF9y
ZWdzX3Y1MDsKLQllbHNlIGlmIChjdHJsLT5uYW5kX3ZlcnNpb24gPj0gMHgwNDAwKQotCQljdHJs
LT5yZWdfb2Zmc2V0cyA9IGJyY21uYW5kX3JlZ3NfdjQwOworCWVsc2UgaWYgKGN0cmwtPm5hbmRf
dmVyc2lvbiA+PSAweDAzMDMpCisJCWN0cmwtPnJlZ19vZmZzZXRzID0gYnJjbW5hbmRfcmVnc192
MzM7CiAKIAkvKiBDaGlwLXNlbGVjdCBzdHJpZGUgKi8KIAlpZiAoY3RybC0+bmFuZF92ZXJzaW9u
ID49IDB4MDcwMSkKLS0gCjIuMjYuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
