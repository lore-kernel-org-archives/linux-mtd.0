Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81479CA0ED1
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Aug 2025 13:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1vVB8P3FJjalD+udiJEAM3bV50irGwfHvBYuqkPxNYg=; b=LdhwCxWgQRzybN
	OPh4OBjpEpjuUtl0o8+AWl+K4YcNSq0l0rA6l8/Zm9klep9A/ZQr+RicVjk02bkFMoolopzkBbKft
	tuGEG7ZKA88XoidpdoZ+wThhW2VzmBIY0+zoH+eet2ernbeCWyMGYcLla7D48inPFidUwF4shV1N2
	WMYSWhHGiBwoY6yhu5cDv9ib6yQSvJpRbt+FvHfwnwKqrDK1/hlkbpFwp6oFlw1Cgyzf2+N3jCed/
	qVIO9epr+GennplYe5tQPZyDrIQY9jM5OpjvGdYFpDKRQLS52kFyB8YqmmkJorssc+7Fo/rIfd6P7
	rbSDiwdO1mQCwNj61jdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo05I-00000007XWr-3CbE;
	Mon, 18 Aug 2025 13:39:36 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unvkQ-000000070I8-2R0Z
	for linux-mtd@lists.infradead.org;
	Mon, 18 Aug 2025 09:01:47 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b47174c3817so2815305a12.2
        for <linux-mtd@lists.infradead.org>; Mon, 18 Aug 2025 02:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755507705; x=1756112505; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OcTOinIlKkgzYvoZaHWXm+nnbinthSn1xXH8lpBhhbM=;
        b=bjzKy6czUptjlMeJY/7ae4J296jp8oFlE82q3yyIzFNqvQM2Ik5MWT5frifGYGFjiQ
         BbgjQ6obK8msyRNLidYiguYqo+RFXDzWMYPibtZv6964Y51rT6YSg6BpP14+HrNsaoDc
         BTymmYRo6ZV+TKLocvf89RK4j0wd5HYkFoeIvzvZj+2Mlt9jVr6Ef0b+kjjAIcug6g9M
         PFoq6R5w2f3RL4FseiTlrHr4bdQtR0c6ERemcXrcxAal/Ex3pniGwKLZXu2LDvMb4xea
         Ttw9AzrSdOFOq2RjLX7Kkkn3kI/WkPMJjqAPIpat5JEvD9u4TE8vOv1/39jtoJpRozjd
         eWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755507705; x=1756112505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OcTOinIlKkgzYvoZaHWXm+nnbinthSn1xXH8lpBhhbM=;
        b=TBzomBWA1hJKcwYEEq5vv/yOcjDfYNK0F0+zjXYNmTJ8wdpCwV81s6L74G2Q5rXgzg
         hs9f2ffH7TMGkvgJtqsNadSeZzrT2IN2muhBZjlvYS0WLaKjqhppWzNulfVFeEU0xm93
         FUv3OKDW4GB9h6b6Q07BseN47Io3B1iAwBUlGmZIsyeAdksiv+M8RZQa9jjh3fgfA7Ub
         FkqaRxWzmg96WYAB8wwHSVWRZzp+mQ4s4aKopFDI00DTISQbCD2nFmWFefGixdqEjZ/e
         mMUqVUFEt8CUo8hBv1xZaBEUecPAkKS4som36qVJchNZdTOpU5agT2NJvOfjSEC6xSfJ
         xYzA==
X-Forwarded-Encrypted: i=1; AJvYcCXKvUu3ypvDDU+Jx8tEwevYP878MqBiqXx3LdRMan2QIvNmtqi0ptiLgD/0Nb0OF/HtWh8+zvtOWH8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwBsZtVZh7sKfWSC2mAa1v+T8cc3ffVpVmEH8SU1KiKDBeZqLhD
	BJmhyfaysZgd7Y7rGvx+96qEytRSsVfDCFKaJlI/zm822ZqCyj1pYS199+JN5wV+3XZZgNGL5rU
	nrDivIl8p6/FVDMlTARWZ5qfpKZn3k2g=
X-Gm-Gg: ASbGnct3WNYDHnlf2q3T5ABufT/RKf06QI6qEgmHV4y+Hpc2NDi62w9U3Fxt9yJ5wzB
	6ct2YkB7dL2S7YiG3EjhLSQtQQhW4rL9PGY3S27JfI80UvBGymALWxZCHJenCCGnKm9KyOO/bC/
	bZ5rNYjKmZbB3QQsuBMs2H3hmtdlUNekrJLDUHyez04FulYH6MOKVneNDyHDp3fYqDuD8toBEww
	fr1Xw==
X-Google-Smtp-Source: AGHT+IHFiMvOj6zE4tw13IbbqMhK1S0rP2Re6EX64vcHvfnbK+PVm/hE+V+4Pgpj6IMVJbdklE9XRrAj8pwnH4P5Dbo=
X-Received: by 2002:a17:903:b07:b0:23d:fa76:5c3b with SMTP id
 d9443c01a7336-2446d745130mr162855865ad.22.1755507705452; Mon, 18 Aug 2025
 02:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250818164635573BQolnx5DcBqRicqxF0DMl@zte.com.cn>
In-Reply-To: <20250818164635573BQolnx5DcBqRicqxF0DMl@zte.com.cn>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 18 Aug 2025 11:01:32 +0200
X-Gm-Features: Ac12FXy4yBxw9ty29Vpw3cXzgph1ImGW6cgDm4IopFR2nOck3AfRDA4sfwW0U_k
Message-ID: <CAFLxGvz-NnCRYXrn59Gh9EYnoBTAQ-5LBN=1=MQN=Yz3iEQsTw@mail.gmail.com>
Subject: Re: [PATCH] ubifs: address bit flips in unused free space
To: shao.mingyin@zte.com.cn
Cc: chengzhihao1@huawei.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, yang.yang29@zte.com.cn, xu.xin16@zte.com.cn, 
	yang.tao172@zte.com.cn, richard@nod.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_020146_617495_EA53D6A5 
X-CRM114-Status: UNSURE (   9.91  )
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

T24gTW9uLCBBdWcgMTgsIDIwMjUgYXQgMTA6NDbigK9BTSA8c2hhby5taW5neWluQHp0ZS5jb20u
Y24+IHdyb3RlOgo+Cj4gRnJvbTogU2hhbyBNaW5neWluIDxzaGFvLm1pbmd5aW5AenRlLmNvbS5j
bj4KPgo+IFdoZW4gdGhlIHJlY292ZXJ5IGRldGVjdHMgYSBmcmVlIHNwYWNlIGJpdCBmbGlwLCB0
aGUgVUJJRlMgbW91bnQgZmFpbHMsCj4gcmVuZGVyaW5nIHRoZSBVQklGUyB1bnVzYWJsZS4gVGhp
cyBpc3N1ZSBjYW4gYmUgYWRkcmVzc2VkIGJ5IHJlY2xhaW1pbmcKPiB0aGUgYWZmZWN0ZWQgZXJh
c2UgYmxvY2ssIHdoaWNoIGludm9sdmVzIHJlbG9jYXRpbmcgaXRzIHZhbGlkIGRhdGEuIFNvCj4g
YXR0ZW1wdGluZyB0byBmaXggZnJlZSBzcGFjZSBiaXQgZmxpcCBkdXJpbmcgcmVjb3ZlcnkgcmVk
dWNlcyBzY2VuYXJpb3MKPiB3aGVyZSB1c2VycyBjYW5ub3QgYWNjZXNzIFVCSUZTIG5vcm1hbGx5
LgoKVUJJRlMgc2hvdWxkIG5ldmVyIHNlZSBiaXQgZmxpcHMgaW4gZW1wdHkgc3BhY2UuCkZpeGlu
ZyB0aGlzIHNpdHVhdGlvbiBoYXBwZW5zIGluIHRoZSBOQU5EIGxheWVyLgpQbGVhc2Ugc2VlICBu
YW5kX2NoZWNrX2VyYXNlZF9lY2NfY2h1bmsoKSBhbmQgaXQncyB1c2Vycy4KCk1heWJlIHlvdXIg
TkFORCBkcml2ZXIgZG9lcyBub3QgY2FsbCBpdD8KCi0tIApUaGFua3MsCi8vcmljaGFyZAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
