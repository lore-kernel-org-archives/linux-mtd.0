Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02AEFF6E7D
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 20:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5/tN1KUMNf957BQdjQbsq8/MF62wES0FH+CLtbw/He4=; b=3+d8jATV1oHR1J
	KXaZEoNqgQmHqGpE7Y/3v04JfHJoznKiowFcIIgbrHp09sHbgJoRORYUiAyf0fiQ2snAivLNa7WTV
	6ada1R+jR3CcSRJlbrPFyV2AB9Er3ciICH6dbcepuIqmyoaQl9fPJxBxmU1trdJICi8yztEQCIHYA
	vS9ggNw9z/MHI3CYXJQsfPwbpOiD6C7/LqghErtJDg/d61t488D7dcd3A+lVWE9TOXGHQD+49J598
	EKiHRJTGEWZFjhmt6DzlulYc/c+7EDbXcfLhQYQAawI+/R50WxU/5y3SUaGxvTT8B8igORQ6J+6k1
	68yaxisYUzXB6qzQRtgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2bJV-00000007DBs-3rn4;
	Tue, 17 Mar 2026 20:46:53 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2bJQ-00000007DAH-2A9r
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 20:46:52 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-5091ed02c54so60341cf.1
        for <linux-mtd@lists.infradead.org>; Tue, 17 Mar 2026 13:46:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773780407; cv=none;
        d=google.com; s=arc-20240605;
        b=j+4PYWv161YOgOziwHNLuctiMNP3Pw1wz1JG12qTPSdG+sdze0TaNHAGEuQvjBQcu7
         /H7ug8D/qvetr/2aCaKRogNQVoqCxJKUF4AEnvHJu/z5ZFDjQojVltuyMp+KgI2wFpTr
         xMcX3QypIzJZpW6OHD52rEf2gg771JU43ObY2WrjJewEkwRFA/diz1ZgiY+D19aEewvG
         rC+SO1A1+GvhC4ImdrvqjAoeJ8gdbeRlWUo3wyNEX2OYShaQHzbG8rfErw3xjb6XKKEh
         N2/WBqMiCe9RcHGIzNPY9kE2c1jSXXDbL3LuKC0cBnZunac30VmTOM6dX6nxdKCqlmV2
         Y+Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=puh87Pmz2QIedt98QmYFqHshzK8OJIco1FTLmkjNO+s=;
        fh=KYiId2aGf9kXqnqTBZi9YMl0xYSmPU++3253PbmLDKg=;
        b=NpEEmtXqudwPnuVMnLhPgyqBLig2lcm5LjrRGGxQtWYiiiymoorVT+0tK/i6bgA8as
         G+LboeNeAx8LB+rarLedbTUJQAvD5ju7iCKRiz76udmbUDy2EYO24oWqs7WCYr0MVstT
         2LCg13GmNXzJnleQUKWjnAloS8c1fuoVh9yW2omerVOCJmSRs1GiYHgirs/nrPyKwn1y
         lhy+0vdVa6RfOOYqX9By4eE6nTBLR84tG2WDoroKKvObsHdc36ZDbtiO0irikJfbWB+p
         q8p3ImrSkogC1I5Pm7qYlujkVBE+BrLEkKdqRKTuUVdkftORn9a5hnsqyxFHYBu8vAfj
         d0QQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773780407; x=1774385207; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puh87Pmz2QIedt98QmYFqHshzK8OJIco1FTLmkjNO+s=;
        b=qV6jB89Af25T95zro2bxjypscuxJok1ydjRmTE6ww/SrsKqclKZpwPEpG909H9w+07
         B/Rt/aVMYx5qBmKiq/gyVLjK/gnUvz7I4I7N6aMEXNkmdn3DMcuc+BjjrnTzKorumKe6
         DNNtfpzzX3cOzjlcwQKgxku0aM7yvPoqZx6SLo8LOeSxE2/UQ1UM6py4MDzHotAGu2lS
         e6qkf4qaHnGaKmdsrJ/PriVLR/M/r/8QC6jKZbWJdRsStl4TxEvo+Bssm9K4KmuvDvTK
         PYa2bMpIbkkwB0Y3SocQ81HHMtzph41+azGoucVT8o5yxFbOt/2fMXtqNidYT946Zscw
         Iouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773780407; x=1774385207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=puh87Pmz2QIedt98QmYFqHshzK8OJIco1FTLmkjNO+s=;
        b=CwYoQDdrdQ9bmh1xYVxl9Wy3ReiLFCltf8NeX4D9NhdpIy76E0BR7z9CY+E835ndy4
         D4TCN/9TpTF+43f+MPBdxlF7hLY6YQw5VOOxbPfjjr8Mk2IQx+GRATDaAIqhc0iREp6b
         HUbsPpg5R4JksOlMrQa+AEdPtqd/bZBoi47NaHeGnb1/36W13x0PYChS6n0tbyqHmk0v
         hR8Hg+vybeC9aoKeuxVeLHXMQo9NnvOWbfNiKF1u+kDw23Qk69C0wkcv7lg1qZ5GRwcS
         a1JgWlqbvzddQkceo2EiET0OwbD6NMwgGCm3PiY4s1bLlSr9J4b4lHRSERly5mOluGHs
         LPjA==
X-Forwarded-Encrypted: i=1; AJvYcCUWnufadIStqXsPjnFTqwdfr6dgFTCwJSTspr1Hj5QyI87a1SafDjTuKQgoANsmJnWtzQYBNHJc9so=@lists.infradead.org
X-Gm-Message-State: AOJu0YwXZm7dmGRyJ3aeWUaOLbWtOVGwxbIxWhZ5zeDkvKPvw7UDvIN4
	ryjR/SE0S4iQz22bJ7+wd/G3ypNoUK5DYnsz+24JA2WtdW6hFRRSGVHH5HB/MAZ8oWyZadJk3wJ
	RAcKEHkS8RRQZCK/+yA68AnOnrYX1YxzU64apb1bP
X-Gm-Gg: ATEYQzx99vhqGBylGpHh9iI0xCoHeVNs3FCwSl5RH+0acdR7wpQp1ARwei29bDyYRb9
	nBidXhVNSe757esHjiQ31954cgrVmlB4XYhPL2rln5lRK/o2J1jfAiOSr7G9dDFKHh8W+7Wi+B+
	8fg2LIQy6aRMcNtVni0rwfVIJad94rH0StSUdBt5qcwsWEWWHSBXgl4inne884GB3QDGgh13XX3
	fwAU9PFlGVUBsRSo/P7EuuUpfT2egn1rdQB8gSkz0RE3QSGcR5PKffY5xnXHDMYjZaBfuACbL6r
	unC2N90hXzojja6tCYLVt0T3aeAKTes9KQ1lag==
X-Received: by 2002:a05:622a:130f:b0:509:371:f2ab with SMTP id
 d75a77b69052e-50b14848d70mr3924821cf.16.1773780406374; Tue, 17 Mar 2026
 13:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773695307.git.ljs@kernel.org> <d34056a65bd387286f4e155d52449106ddc99f78.1773695307.git.ljs@kernel.org>
In-Reply-To: <d34056a65bd387286f4e155d52449106ddc99f78.1773695307.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Mar 2026 13:46:34 -0700
X-Gm-Features: AaiRm50ZSv0JOBEsyaTpLpUZLAlSOUqng_UaLNmSO0lPuUbLHyEvRlv0uikpAUM
Message-ID: <CAJuCfpH653zdE=mXArpx8BUszVVC1PoN+rvp+WxdM3aAUbpqRw@mail.gmail.com>
Subject: Re: [PATCH v2 10/16] stm: replace deprecated mmap hook with mmap_prepare
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "K . Y . Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Bodo Stroesser <bostroesser@gmail.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, David Howells <dhowells@redhat.com>, 
	Marc Dionne <marc.dionne@auristor.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, David Hildenbrand <david@kernel.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	Ryan Roberts <ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_134650_519902_65F452A6 
X-CRM114-Status: GOOD (  22.99  )
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

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgMjoxNOKAr1BNIExvcmVuem8gU3RvYWtlcyAoT3JhY2xl
KSA8bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gVGhlIGZfb3AtPm1tYXAgaW50ZXJmYWNlIGlz
IGRlcHJlY2F0ZWQsIHNvIHVwZGF0ZSBkcml2ZXIgdG8gdXNlIGl0cwo+IHN1Y2Nlc3NvciwgbW1h
cF9wcmVwYXJlLgo+Cj4gVGhlIGRyaXZlciBwcmV2aW91c2x5IHVzZWQgdm1faW9tYXBfbWVtb3J5
KCksIHNvIHRoaXMgY2hhbmdlIHJlcGxhY2VzIGl0Cj4gd2l0aCBpdHMgbW1hcF9wcmVwYXJlIGVx
dWl2YWxlbnQsIG1tYXBfYWN0aW9uX3NpbXBsZV9pb3JlbWFwKCkuCj4KPiBBbHNvLCBpbiBvcmRl
ciB0byBjb3JyZWN0bHkgbWFpbnRhaW4gcmVmZXJlbmNlIGNvdW50aW5nLCBhZGQgYQo+IHZtX29w
cy0+bWFwcGVkIGNhbGxiYWNrIHRvIGluY3JlbWVudCB0aGUgcmVmZXJlbmNlIGNvdW50IHdoZW4g
c3VjY2Vzc2Z1bGx5Cj4gbWFwcGVkLgo+Cj4gU2lnbmVkLW9mZi1ieTogTG9yZW56byBTdG9ha2Vz
IChPcmFjbGUpIDxsanNAa2VybmVsLm9yZz4KClJldmlld2VkLWJ5OiBTdXJlbiBCYWdoZGFzYXJ5
YW4gPHN1cmVuYkBnb29nbGUuY29tPgoKPiAtLS0KPiAgZHJpdmVycy9od3RyYWNpbmcvc3RtL2Nv
cmUuYyB8IDMxICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIxIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvaHd0cmFjaW5nL3N0bS9jb3JlLmMgYi9kcml2ZXJzL2h3dHJhY2luZy9zdG0vY29yZS5j
Cj4gaW5kZXggMzc1ODRlNzg2YmI1Li5mNDhjNmE4YTA2NTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9od3RyYWNpbmcvc3RtL2NvcmUuYwo+ICsrKyBiL2RyaXZlcnMvaHd0cmFjaW5nL3N0bS9jb3Jl
LmMKPiBAQCAtNjY2LDYgKzY2NiwxNiBAQCBzdGF0aWMgc3NpemVfdCBzdG1fY2hhcl93cml0ZShz
dHJ1Y3QgZmlsZSAqZmlsZSwgY29uc3QgY2hhciBfX3VzZXIgKmJ1ZiwKPiAgICAgICAgIHJldHVy
biBjb3VudDsKPiAgfQo+Cj4gK3N0YXRpYyBpbnQgc3RtX21tYXBfbWFwcGVkKHVuc2lnbmVkIGxv
bmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kLCBwZ29mZl90IHBnb2ZmLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBmaWxlICpmaWxlLCB2b2lkICoqdm1fcHJpdmF0
ZV9kYXRhKQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3Qgc3RtX2ZpbGUgKnN0bWYgPSBmaWxlLT5wcml2
YXRlX2RhdGE7Cj4gKyAgICAgICBzdHJ1Y3Qgc3RtX2RldmljZSAqc3RtID0gc3RtZi0+c3RtOwo+
ICsKPiArICAgICAgIHBtX3J1bnRpbWVfZ2V0X3N5bmMoJnN0bS0+ZGV2KTsKPiArICAgICAgIHJl
dHVybiAwOwo+ICt9Cj4gKwo+ICBzdGF0aWMgdm9pZCBzdG1fbW1hcF9vcGVuKHN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3Qgc3RtX2ZpbGUgKnN0bWYgPSB2
bWEtPnZtX2ZpbGUtPnByaXZhdGVfZGF0YTsKPiBAQCAtNjg0LDEyICs2OTQsMTQgQEAgc3RhdGlj
IHZvaWQgc3RtX21tYXBfY2xvc2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gIH0KPgo+
ICBzdGF0aWMgY29uc3Qgc3RydWN0IHZtX29wZXJhdGlvbnNfc3RydWN0IHN0bV9tbWFwX3Ztb3Bz
ID0gewo+ICsgICAgICAgLm1hcHBlZCA9IHN0bV9tbWFwX21hcHBlZCwKPiAgICAgICAgIC5vcGVu
ICAgPSBzdG1fbW1hcF9vcGVuLAo+ICAgICAgICAgLmNsb3NlICA9IHN0bV9tbWFwX2Nsb3NlLAo+
ICB9Owo+Cj4gLXN0YXRpYyBpbnQgc3RtX2NoYXJfbW1hcChzdHJ1Y3QgZmlsZSAqZmlsZSwgc3Ry
dWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gK3N0YXRpYyBpbnQgc3RtX2NoYXJfbW1hcF9wcmVw
YXJlKHN0cnVjdCB2bV9hcmVhX2Rlc2MgKmRlc2MpCj4gIHsKPiArICAgICAgIHN0cnVjdCBmaWxl
ICpmaWxlID0gZGVzYy0+ZmlsZTsKPiAgICAgICAgIHN0cnVjdCBzdG1fZmlsZSAqc3RtZiA9IGZp
bGUtPnByaXZhdGVfZGF0YTsKPiAgICAgICAgIHN0cnVjdCBzdG1fZGV2aWNlICpzdG0gPSBzdG1m
LT5zdG07Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIHNpemUsIHBoeXM7Cj4gQEAgLTY5NywxMCAr
NzA5LDEwIEBAIHN0YXRpYyBpbnQgc3RtX2NoYXJfbW1hcChzdHJ1Y3QgZmlsZSAqZmlsZSwgc3Ry
dWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gICAgICAgICBpZiAoIXN0bS0+ZGF0YS0+bW1pb19h
ZGRyKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7Cj4KPiAtICAgICAgIGlm
ICh2bWEtPnZtX3Bnb2ZmKQo+ICsgICAgICAgaWYgKGRlc2MtPnBnb2ZmKQo+ICAgICAgICAgICAg
ICAgICByZXR1cm4gLUVJTlZBTDsKPgo+IC0gICAgICAgc2l6ZSA9IHZtYS0+dm1fZW5kIC0gdm1h
LT52bV9zdGFydDsKPiArICAgICAgIHNpemUgPSB2bWFfZGVzY19zaXplKGRlc2MpOwo+Cj4gICAg
ICAgICBpZiAoc3RtZi0+b3V0cHV0Lm5yX2NoYW5zICogc3RtLT5kYXRhLT5zd19tbWlvc3ogIT0g
c2l6ZSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gQEAgLTcxMiwxMyArNzI0
LDEyIEBAIHN0YXRpYyBpbnQgc3RtX2NoYXJfbW1hcChzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0
IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gICAgICAgICBpZiAoIXBoeXMpCj4gICAgICAgICAgICAg
ICAgIHJldHVybiAtRUlOVkFMOwo+Cj4gLSAgICAgICBwbV9ydW50aW1lX2dldF9zeW5jKCZzdG0t
PmRldik7Cj4gLQo+IC0gICAgICAgdm1hLT52bV9wYWdlX3Byb3QgPSBwZ3Byb3Rfbm9uY2FjaGVk
KHZtYS0+dm1fcGFnZV9wcm90KTsKPiAtICAgICAgIHZtX2ZsYWdzX3NldCh2bWEsIFZNX0lPIHwg
Vk1fRE9OVEVYUEFORCB8IFZNX0RPTlREVU1QKTsKPiAtICAgICAgIHZtYS0+dm1fb3BzID0gJnN0
bV9tbWFwX3Ztb3BzOwo+IC0gICAgICAgdm1faW9tYXBfbWVtb3J5KHZtYSwgcGh5cywgc2l6ZSk7
Cj4gKyAgICAgICBkZXNjLT5wYWdlX3Byb3QgPSBwZ3Byb3Rfbm9uY2FjaGVkKGRlc2MtPnBhZ2Vf
cHJvdCk7Cj4gKyAgICAgICB2bWFfZGVzY19zZXRfZmxhZ3MoZGVzYywgVk1BX0lPX0JJVCwgVk1B
X0RPTlRFWFBBTkRfQklULAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIFZNQV9ET05URFVN
UF9CSVQpOwo+ICsgICAgICAgZGVzYy0+dm1fb3BzID0gJnN0bV9tbWFwX3Ztb3BzOwo+Cj4gKyAg
ICAgICBtbWFwX2FjdGlvbl9zaW1wbGVfaW9yZW1hcChkZXNjLCBwaHlzLCBzaXplKTsKPiAgICAg
ICAgIHJldHVybiAwOwo+ICB9Cj4KPiBAQCAtODM2LDcgKzg0Nyw3IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgZmlsZV9vcGVyYXRpb25zIHN0bV9mb3BzID0gewo+ICAgICAgICAgLm9wZW4gICAgICAg
ICAgID0gc3RtX2NoYXJfb3BlbiwKPiAgICAgICAgIC5yZWxlYXNlICAgICAgICA9IHN0bV9jaGFy
X3JlbGVhc2UsCj4gICAgICAgICAud3JpdGUgICAgICAgICAgPSBzdG1fY2hhcl93cml0ZSwKPiAt
ICAgICAgIC5tbWFwICAgICAgICAgICA9IHN0bV9jaGFyX21tYXAsCj4gKyAgICAgICAubW1hcF9w
cmVwYXJlICAgPSBzdG1fY2hhcl9tbWFwX3ByZXBhcmUsCj4gICAgICAgICAudW5sb2NrZWRfaW9j
dGwgPSBzdG1fY2hhcl9pb2N0bCwKPiAgICAgICAgIC5jb21wYXRfaW9jdGwgICA9IGNvbXBhdF9w
dHJfaW9jdGwsCj4gIH07Cj4gLS0KPiAyLjUzLjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
