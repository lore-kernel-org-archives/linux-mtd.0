Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB77C54E67
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2024 12:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=20HSfzzoA8apcsVb0YYPzpoCohJnik7Y5DOi5qdJ4+A=; b=HyRcSi9OtBKJzO
	qbi6LoyY9jBq/R3ZwLUmCiGIgkfDhVWTxynx87+c1jIl34buMU1yKUtylvYRGpflEeYOuQwsZyLMh
	LIlkRheC9EoMSuhz4ObRKhHU6cWh5ENPndt28zzC4sn2TvJpRd17qRPZtbFyAEHfFvb9FBKYRLLo5
	Ckzb6XBA8ZnUG0ZICGE36LHiQsDd/fliymRzTcO0cVpz7FtXaYiBm9IO8nM13cOT1qkLfMqd0/yv9
	FVwBtEzQKsRBIOIz4SLoKdGrcCSfN1ErFORt4OuJhL/Jc4hDrOCcxmbDn7z21nAH3rKsl7mtG93lL
	gvtlvYhcIBbWxvYpr58Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl6XJ-00000000AMD-36JZ;
	Fri, 15 Mar 2024 12:19:45 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl6XG-00000000ALK-4AGm
	for linux-mtd@lists.infradead.org;
	Fri, 15 Mar 2024 12:19:44 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-60a0a1bd04eso20900597b3.1
        for <linux-mtd@lists.infradead.org>; Fri, 15 Mar 2024 05:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710505181; x=1711109981; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QyQptOt/A2+N+1FcbXKs6QUV1qHpAqBCMfYtR9NPPuU=;
        b=IhBFCbCwuUACwqrFUXFknOFdBrnczpBQPGiqFAZ3pPVbH1SLONUY2+b/aJwcPQ3zWi
         fg7FU4XWXhIUscrreAblx1Kj3Fm6O83ercddsJ9/rLwn76mDi37O8m9TvrO5LVcPdHSB
         3ncg8uDlDI0C93WPvpsxAQoCDR3JwDwP0R+k7c11NZ9scpuIjrzCG6cL5Of/+8uu7QkH
         idzAkfR46RCN9djjifTIeDb0m/Y4eEt8+uJpNQ6ZFUX0YeRfwe0kAYniOmJ83Z7EnkcD
         Q4b+3/QjCcdpF7YeVvUKvM4hj/TXwQlBaSRB9NK8+cFry85Z4qVPVI0bfAumXwF1hJjT
         7ZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710505181; x=1711109981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QyQptOt/A2+N+1FcbXKs6QUV1qHpAqBCMfYtR9NPPuU=;
        b=v8fgAHAgNJ76JCwhjZHoombVp9CL6V4cSCCXe2e3fI9dVHN78NWoUygPnm+S310DC5
         VvX3SqY4mmhi/nnNES1r/t+2lmmaSxBOF0EDRZVtQJHQc9OPsZZI07E2cqVBA5zkajAR
         XN0G+ao2NVLX6xtwK2RIVR4F9ES//ROmd3B5bbYUEf/A3H/MAbQ9TXAAFePso+CRvnhU
         KWa7Tw/ToDTnOxBuFF/hUnhz02fDseWUPxWzFcn61XlqHW8FYDo8l2rAu3QFibzbQGHb
         3JJf6EFbkUPEP8WvkO9PVx30i9VenI+Lxi03V+VnFfDf0YfU/D9wnD97zraLISOTpGyE
         F91Q==
X-Forwarded-Encrypted: i=1; AJvYcCXgHcVhz+8GWoA5xqPAFePZD35LZtJgHeOW2gOTP+62A/uK6KIwaZ05RTArC/mRmLlFYMX0EeTRrUTRx/up4kFlwy88lz06NGa3NcDlVA==
X-Gm-Message-State: AOJu0YzV2JaT+UyrjpR+1Rzz2lNspqrxo6rAIGSlNDizxLa/nR7Fz3Jz
	V29W5JZp/bO6179k9QEUDvYCr2PtxkwssOMuO419nq4UjgcUuhb9PIFcqw+NPPoAp0jwAV9aFD4
	oDiTi+69oJM43gWpbIplDuA/1TJ0=
X-Google-Smtp-Source: AGHT+IFnnmzqQgVEPIQh1LiikkCiallcR8WNikpr0/DAgKIkVU3t8SMYkDr8CIa9XHE0fFSJIC3rmUuLZz3rj48MIxA=
X-Received: by 2002:a25:8412:0:b0:dcd:4878:1f9 with SMTP id
 u18-20020a258412000000b00dcd487801f9mr1833473ybk.8.1710505181541; Fri, 15 Mar
 2024 05:19:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240315075946.587679-1-dqfext@gmail.com> <ff19df82-3fd4-9098-667c-0502b2452334@huawei.com>
In-Reply-To: <ff19df82-3fd4-9098-667c-0502b2452334@huawei.com>
From: Qingfang Deng <dqfext@gmail.com>
Date: Fri, 15 Mar 2024 20:19:30 +0800
Message-ID: <CALW65jbKBUDN8ybE1oqrNW5VK1QGpZ1RmnFCCzxjQCo4obaA4A@mail.gmail.com>
Subject: Re: [RFC PATCH] jffs2: fix recursive fs_reclaim deadlock
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_051943_049704_036910A5 
X-CRM114-Status: GOOD (  10.44  )
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

SGkgWmhpaGFvLAoKT24gRnJpLCBNYXIgMTUsIDIwMjQgYXQgNzoxOeKAr1BNIFpoaWhhbyBDaGVu
ZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+IHdyb3RlOgo+IEkgdGhpbmsgaXQncyBhIGZhbHNl
IHBvc2l0aXZlIHdhcm5pbmcuIEpmZnMyIGlzIHRyeWluZyB0byBnZXQgcm9vdCBpbm9kZQo+IGlu
IHByb2Nlc3MgJyMxJywgd2hpY2ggbWVhbnMgdGhhdCB0aGUgZmlsZXN5c3RlbSBpcyBub3QgbW91
bnRlZAo+IHlldChCZWNhdXNlIGRfbWFrZV9yb290IGlzIGFmdGVyIGpmZnMyX2lnZXQoc2IsMSks
IHRoZXJlIGlzIG5vIHdheSB0bwo+IGFjY2VzcyBvdGhlciBpbm9kZXMuKSwgc28gaXQgaXMgaW1w
b3NzaWJsZSB0aGF0IGpmZnMyIGlub2RlIGlzIGJlaW5nCj4gZXZpY3RlZCBpbiAnIzAnLgo+CgpZ
b3UncmUgcmlnaHQgdGhhdCBwcm9jZXNzICcjMScgaXMgZ2V0dGluZyB0aGUgcm9vdCBpbm9kZS4g
SG93ZXZlciwKbG9ja2RlcCBvbmx5IHJlY29yZHMgdGhlIHN0YWNrIG9mIHRoZSBmaXJzdCB1bmlx
dWUgbG9jayBvcmRlcmluZyAoc2VlCmh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL2xvY2tpbmcvbG9j
a2RlcC1kZXNpZ24uaHRtbCNwZXJmb3JtYW5jZSApLCBhbmQKdGhlcmUgYXJlIG1hbnkgb2NjYXNp
b25zIHdoZXJlIEdGUF9LRVJORUwgaXMgdXNlZCBpbnNpZGUgYQpqZmZzMl9pbm9kZV9pbmZvOjpz
ZW0gJ3MgY3JpdGljYWwgc2VjdGlvbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
