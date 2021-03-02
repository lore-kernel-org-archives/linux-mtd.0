Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A81BC433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 15:14:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6323964EEC
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 15:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6323964EEC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:In-Reply-To:
	References:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EHAMicKhYhidb/oOPOZNkGZtxahU8fyzDJnfGtCyPVE=; b=PBxY83+A+NraPskl+dTzjH2WW
	YONp1wQdicEVUHvqS5/QFEuzVP+9UmxiAQ5v6BOqr0NnE6SEMZ6T2a8WXqPnTpDtqk/GI3KLzco04
	btcDeYJDMdfkMKjqbWXCpLvksluxz7WPbNx6H5YrYYN5i7Jl84AvGkWrYnk1k2tR6vFKsclyZlqCb
	HipjJLMeNge+RYecAidV/ry7K4xAAefOeEiiCkXU+nxFM18joT0/hTavH0lod+7QXoBJBVnu8L1uD
	ospi27TEtU5/50zakT7TIkNtHLx0sN9utvKQxeb41KWJKaH6nNvEqa7vACF1et4RtEcYsMEg9VHQz
	PAbK0fiwQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHTCU-005LBH-5y; Wed, 03 Mar 2021 15:14:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSD9-0054yP-22
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 14:10:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Date:Subject:In-Reply-To:References:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=dZDxDKo9DUriFwd/ch3hW/kAL9W5if4uwIjXpYhSxQA=; b=JfOWywNZ8PxOtmdXvthTniO2pv
 25cWbE7w06whVPFRw4q9eJSR/9e80uIbBBRQqQY/+hvFq4s6aSxifXHEahSt3MsFKc85RW/fGZsQU
 AzeS+P/punJ5YKtk7bjrsw1EHCRwUExJRph+aZnAU8SROdnLnU3khyN8EzfMCNZ0dzP0AIIZoOxiq
 eSYMX+RSbjh1VcuG4TIhDEtQ+9nLk09Rn1BRFul6p40r5Gn9uYCd4wwRZEn4MBwUVP8+SR7ok4BAH
 h4armRA27mZXkUAR9nI6OQ5ODciCerWTywGZDLnLgpjUWdlMy/3ikacNtzXHl3X4Aca/Vf1d3JlYn
 epKpeHwQ==;
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHArT-000Bcb-R1
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 19:39:17 +0000
Received: by mail-ed1-x531.google.com with SMTP id bd6so13513965edb.10
 for <linux-mtd@lists.infradead.org>; Tue, 02 Mar 2021 11:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=dZDxDKo9DUriFwd/ch3hW/kAL9W5if4uwIjXpYhSxQA=;
 b=FZvzGYjrzlk3SqBpDsP+L0dGTi3rk9qagI90zrFRHM+i6HgHqAo+3ZOP56elyztJj3
 9nLqmqnApMYjOO+KlqGI2KZjUONIm83xdwlg32tEMNofUyoIFTKE10SO8/dZqtTRO++M
 jUaYb7PT8XuDbGCdAFrcAh/O3mbXGAYhMoxHvHJPdz0/wv08V4N2uJg6x63C6QP0kphv
 GhPqjp197/0+c1yKZh6UJw27oAlv/ynas6jrmVrALIaX+sMtSEYkFfBtGRhmKUpgPmrr
 bpEdAmbHOvPoF2jLqw3IErLrPaCYct3UBVvOX8jj14AgR8tFf+BX+Ee3QwlnhHVw223Q
 3Z1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=dZDxDKo9DUriFwd/ch3hW/kAL9W5if4uwIjXpYhSxQA=;
 b=VPgCTzwbBYCyWmWTAcdH2OJy5ABRbV2r8snzWJ/FN3YOM3HgoFmjfmD25bL9Zc9bII
 GU8BHc5qVWS44GLuJc7q8/MpGSX/tPHvgyIHCuvpYomogDTHOukFBze4m2gPXRiKedb0
 fXSlx+VFlscs9AY5DzRyzdzicSQBf19u/Xh4EKO73eEVTL1NU5FitjLuX/X7iSXiUw7s
 9tJEDQS7TuZc1MfGrVrUc1i+bVgotIZRsf4cNoyCgH0RVC7xvtMQvmRhytPzFOfNf2pq
 8FGqi6CAoV/dYB+PWG+3HgzfFwXTShBOaNeQ20EiilytQs8L+FOZrZLaD0JMs+McGfDw
 YFyw==
X-Gm-Message-State: AOAM530t+cAiP8m9YnqzVKGkTcdIW4m/CA9Qfupxc13BL/zBchUo4oFV
 Ra+3o3a43MG5oaY4ArPmuUw=
X-Google-Smtp-Source: ABdhPJwrKUQuDeINh7Q590LD4909NbWtcfleghR6UdWITGE/tqyNfIlOHaZ78vD8MxkSMdYA0xUrBA==
X-Received: by 2002:a05:6402:375:: with SMTP id
 s21mr14891694edw.287.1614713892731; 
 Tue, 02 Mar 2021 11:38:12 -0800 (PST)
Received: from Ansuelxps (host-82-53-189-185.retail.telecomitalia.it.
 [82.53.189.185])
 by smtp.gmail.com with ESMTPSA id g1sm15377707edh.31.2021.03.02.11.38.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Mar 2021 11:38:11 -0800 (PST)
From: <ansuelsmth@gmail.com>
To: =?UTF-8?Q?'Rafa=C5=82_Mi=C5=82ecki'?= <zajec5@gmail.com>,
 "'Miquel Raynal'" <miquel.raynal@bootlin.com>,
 "'Richard Weinberger'" <richard@nod.at>,
 "'Vignesh Raghavendra'" <vigneshr@ti.com>
Cc: "'Boris Brezillon'" <bbrezillon@kernel.org>,
 <linux-mtd@lists.infradead.org>,
 =?UTF-8?Q?'Rafa=C5=82_Mi=C5=82ecki'?= <rafal@milecki.pl>
References: <20210302190012.1255-1-zajec5@gmail.com>
In-Reply-To: <20210302190012.1255-1-zajec5@gmail.com>
Subject: R: [PATCH] mtd: parsers: ofpart: limit parsing of deprecated DT syntax
Date: Tue, 2 Mar 2021 20:38:23 +0100
Message-ID: <000801d70f9b$9c902980$d5b07c80$@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHaHTYXsfoBEN6bRxRk1kixCIDFL6pq+PCA
Content-Language: it
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_193917_644820_CD7A9402 
X-CRM114-Status: UNSURE (   6.48  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

PiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gCj4gRm9yIGJhY2t3
YXJkIGNvbXBhdGliaWxpdHkgb2ZwYXJ0IHN0aWxsIHN1cHBvcnRzIHRoZSBvbGQgc3ludGF4IGxp
a2U6Cj4gc3BpLWZsYXNoQDAgewo+IAljb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3IiOwo+IAly
ZWcgPSA8MHgwPjsKPiAKPiAJcGFydGl0aW9uQDAgewo+IAkJbGFiZWwgPSAiYm9vdGxvYWRlciI7
Cj4gCQlyZWcgPSA8MHgwIDB4MTAwMDAwPjsKPiAJfTsKPiB9Owo+ICh3aXRob3V0ICJwYXJ0aXRp
b25zIiBzdWJub2RlKS4KPiAKPiBUaGVyZSBpcyBubyByZWFzb24gaG93ZXZlciB0byBzdXBwb3J0
IG5lc3RlZCBwYXJ0aXRpb25zIHdpdGhvdXQgYSBjbGVhcgo+ICJjb21wYXRpYmxlIiBzdHJpbmcg
bGlrZToKPiBwYXJ0aXRpb25zIHsKPiAJY29tcGF0aWJsZSA9ICJmaXhlZC1wYXJ0aXRpb25zIjsK
PiAJI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gCSNzaXplLWNlbGxzID0gPDE+Owo+IAo+IAlwYXJ0
aXRpb25AMCB7Cj4gCQlsYWJlbCA9ICJib290bG9hZGVyIjsKPiAJCXJlZyA9IDwweDAgMHgxMDAw
MDA+Owo+IAo+IAkJcGFydGl0aW9uQDAgewo+IAkJCWxhYmVsID0gImNvbmZpZyI7Cj4gCQkJcmVn
ID0gPDB4ODAwMDAgMHg4MDAwMD47Cj4gCQl9Owo+IAl9Owo+IH07Cj4gKHdlIG5ldmVyIG9mZmlj
aWFsbHkgc3VwcG9ydGVkIG9yIGRvY3VtZW50ZWQgdGhhdCkuCj4gCj4gTWFrZSBzdXJlIG9mcGFy
dCBkb2Vzbid0IGF0dGVtcHQgdG8gcGFyc2UgYWJvdmUuCj4gCgpJIGhhdmUgb25lIHF1ZXN0aW9u
LiAKRnJvbSB3aGF0IEkgY2FuIHNlZSBpbiB0aGUgbmV3IGNvZGUsIGluIHRoaXMgZXhhbXBsZSAi
c29tZXRoaW5nIgpwYXJ0aXRpb24gd29uJ3QgYmUgcGFyc2VkIHdpdGggdGhlIGZpeGVkLXBhcnRp
dGlvbiBwYXJzZXIuIENvcnJlY3Q/CgpwYXJ0aXRpb25zIHsKCWNvbXBhdGlibGUgPSAiZml4ZWQt
cGFydGl0aW9ucyI7CgkjYWRkcmVzcy1jZWxscyA9IDwxPjsKCSNzaXplLWNlbGxzID0gPDE+OwoK
CXBhcnRpdGlvbkAwIHsKCQlsYWJlbCA9ICJib290bG9hZGVyIjsKCQlyZWcgPSA8MHgwIDB4MTAw
MDAwPjsKCQljb21wYXRpYmxlID0gInJhbmRvbS1wYXJzZXIiOwoKCQlwYXJ0aXRpb25AMCB7CgkJ
CWxhYmVsID0gInNvbWV0aGluZyI7CgkJCXJlZyA9IDwweDAgMHgxMDA+OwoJCX07Cgl9Owp9OwoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
