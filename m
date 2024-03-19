Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C768C54E5D
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2024 06:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FWS2vRgIJJ5VvFQxFxnImZWsyFTSXOEivcZc5MZ7xyU=; b=ipNZSYh085Txm9
	M2OYqc6xg+DNNq8NqlArdBcm86dhr6Hww1VrUEU2CrUYixUV4zyRh6Xlq2omv7XpFmpb7VLigK7H0
	kBxBHHknagQg2RaiZ9jYA/sIkclvaaGgCUut/KZj9bvNU2lfOTuoaeF4v+9IGIVBIjdYpgGVyCOFV
	VcKdGjGKb2Ic1TtgttSBOCMe3l0BYc1c+a8PjPM/YLnMGDytFlMAXPQpQ3zl4qpMkcW8uQd/n3ILS
	xupWVrbhl6EpHtF5iBLUs4rC1iyQRQu2t2G4eB2rUi68548mhgyU2e2HMWhsQWUTEoPpskqhzrTJA
	64oEI3vQuDdZdPJ/n1cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmTB0-0000000BY5C-3Ebn;
	Tue, 19 Mar 2024 06:42:22 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmTAw-0000000BY3T-1t3e
	for linux-mtd@lists.infradead.org;
	Tue, 19 Mar 2024 06:42:19 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-dcc6fc978ddso4216376276.0
        for <linux-mtd@lists.infradead.org>; Mon, 18 Mar 2024 23:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710830536; x=1711435336; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjCclsKgamBj/oumWQvsgzk6MPjbrWJp1JAZ1wSEgoo=;
        b=fboSV2hoqoZSxUJ4TflTf8CH8fx54hzEpzeyidL7RUTsqaEz1vtk7XgKWBxVtuwzbo
         kVZm1r0lR3u+DR0Xura0ooaVRpp1zq9RUXIwBjehMdYZJptsiikvqO19ZCV04smjWrm8
         F2WwiMHhS09ofvQp/jmyPWnBX3Azyl7gyk7ig9hrn/82GIYQIK4mQp35eBr8WmytMVuR
         V+Ni+1LHHPFwTU3P5yt6mrctG4UXwneZZTDvY/YjMUdjO+qFpu5C6qBPLY4A7qK1Rh2P
         ScVGcSBNK2JLAXJHj212tQgwStfaQMeDvWUSGGRURpWakvkC44eZy47saUX0nvzG5eHE
         qSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710830536; x=1711435336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NjCclsKgamBj/oumWQvsgzk6MPjbrWJp1JAZ1wSEgoo=;
        b=LGaKGKtt2mjy+8t18BgTVUJgqzsPrwoAax1Sj69jNJvgpURNlOkZHEI5Y9QAPphcLq
         J+cVch26xIvj2B8Rw+PUVk3vKEiO3TWNzSmkrlNRTU8BlW6T35SfX6VlN5h5HbPC9ckX
         1OZIhFH0/a8xZXQh97FugfWPT7RVAE1AmkcD3ecHPrG+5beDIlchk8tqyh9479gOvna4
         wpn/1FSItfP0+k2KtVdDqkXUOB0NhC3lENLyeL4fCxMTHFqGB4ydchXI8YHtrbU5EZCe
         fFQg7BtstGv/llYTIGxVb2SZzalEuiSFVR9WassMPvu27+hIkRwKRc9HYU5+9r8ehb3z
         VlrQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7PAf8+ONwi8t+UNiz+wkr1ucCK63xiakiQXXWUBUc+HoqKfuQmtJ4+J3bLUUtHXirqr8Ywy6F8vwuL6b2AHJg4WE2MEvJNVKykI1ziQ==
X-Gm-Message-State: AOJu0YxV9eGuWcykeUteyb5ZN/xzFk3eAO7u6yX1NLZQrEHSBe2RvGsz
	2Vy4IzphIqf0Y2gUnwB4/EuR8wXIBJdmTk8WHIXkV8zy9V8smp9qfiVEGyMQsqpgH4tJrFXiLy8
	qtr9/gvAJzBlw/OlkixEAfFmRBuU=
X-Google-Smtp-Source: AGHT+IFQkgQWLO4YyYxqJiKAXRUVNmi3CyAl2nb1/6YLgkoNvFwF7RFaW4p1IIDApOescDNaAFK05HSkWbZsjmemulA=
X-Received: by 2002:a25:ce02:0:b0:dcc:623e:1b5d with SMTP id
 x2-20020a25ce02000000b00dcc623e1b5dmr970546ybe.31.1710830536238; Mon, 18 Mar
 2024 23:42:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240315075946.587679-1-dqfext@gmail.com> <ff19df82-3fd4-9098-667c-0502b2452334@huawei.com>
 <CALW65jbKBUDN8ybE1oqrNW5VK1QGpZ1RmnFCCzxjQCo4obaA4A@mail.gmail.com> <e5c2c285-0b10-0d23-2c02-7582c026dbfd@huawei.com>
In-Reply-To: <e5c2c285-0b10-0d23-2c02-7582c026dbfd@huawei.com>
From: Qingfang Deng <dqfext@gmail.com>
Date: Tue, 19 Mar 2024 14:41:59 +0800
Message-ID: <CALW65jbQCvkpeoOv275jgQAHf+Tk3QBR0HdwdGhK3s7gF+HVeg@mail.gmail.com>
Subject: Re: [RFC PATCH] jffs2: fix recursive fs_reclaim deadlock
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_234218_549940_79FD82D9 
X-CRM114-Status: GOOD (  16.27  )
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

T24gRnJpLCBNYXIgMTUsIDIwMjQgYXQgOTowMOKAr1BNIFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGlo
YW8xQGh1YXdlaS5jb20+IHdyb3RlOgo+Cj4g5ZyoIDIwMjQvMy8xNSAyMDoxOSwgUWluZ2Zhbmcg
RGVuZyDlhpnpgZM6Cj4gPiBIaSBaaGloYW8sCj4gPgo+ID4gT24gRnJpLCBNYXIgMTUsIDIwMjQg
YXQgNzoxOeKAr1BNIFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+IHdyb3Rl
Ogo+ID4+IEkgdGhpbmsgaXQncyBhIGZhbHNlIHBvc2l0aXZlIHdhcm5pbmcuIEpmZnMyIGlzIHRy
eWluZyB0byBnZXQgcm9vdCBpbm9kZQo+ID4+IGluIHByb2Nlc3MgJyMxJywgd2hpY2ggbWVhbnMg
dGhhdCB0aGUgZmlsZXN5c3RlbSBpcyBub3QgbW91bnRlZAo+ID4+IHlldChCZWNhdXNlIGRfbWFr
ZV9yb290IGlzIGFmdGVyIGpmZnMyX2lnZXQoc2IsMSksIHRoZXJlIGlzIG5vIHdheSB0bwo+ID4+
IGFjY2VzcyBvdGhlciBpbm9kZXMuKSwgc28gaXQgaXMgaW1wb3NzaWJsZSB0aGF0IGpmZnMyIGlu
b2RlIGlzIGJlaW5nCj4gPj4gZXZpY3RlZCBpbiAnIzAnLgo+ID4+Cj4gPgo+ID4gWW91J3JlIHJp
Z2h0IHRoYXQgcHJvY2VzcyAnIzEnIGlzIGdldHRpbmcgdGhlIHJvb3QgaW5vZGUuIEhvd2V2ZXIs
Cj4gPiBsb2NrZGVwIG9ubHkgcmVjb3JkcyB0aGUgc3RhY2sgb2YgdGhlIGZpcnN0IHVuaXF1ZSBs
b2NrIG9yZGVyaW5nIChzZWUKPiA+IGh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL2xvY2tpbmcvbG9j
a2RlcC1kZXNpZ24uaHRtbCNwZXJmb3JtYW5jZSApLCBhbmQKPiA+IHRoZXJlIGFyZSBtYW55IG9j
Y2FzaW9ucyB3aGVyZSBHRlBfS0VSTkVMIGlzIHVzZWQgaW5zaWRlIGEKPiA+IGpmZnMyX2lub2Rl
X2luZm86OnNlbSAncyBjcml0aWNhbCBzZWN0aW9uLgo+ID4gLgo+ID4KPiBBbGxvY2F0aW5nIG1l
bW9yeSB3aXRob3V0IEdGUF9OT0ZTIGZsYWdzIHVuZGVyIHNsZWVwaW5nIGxvY2sgaXMgYSBub3Jt
YWwKPiB0aGluZy4gVGhlIHZmc193cml0ZSBpcyBhbiBleGFtcGxlKGVnLiBleHQ0KSwgcGFnZSBp
cyBhbGxvY2F0ZWQgd2l0aAo+IEZHUF9XUklURUJFR0lOIGZsYWcobm8gRkdQX05PRlMpIHdoZW4g
aG9sZGluZyBpbm9kZSBsb2NrLgoKSWYgdGhpcyBpcyBhIGZhbHNlIHBvc2l0aXZlLCBpcyB0aGVy
ZSBhIHdheSB0byBzdXBwcmVzcyB0aGUgd2FybmluZz8KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
