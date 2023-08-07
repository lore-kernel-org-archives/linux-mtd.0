Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6199C00528
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 14:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wyHfbPPqyatT1WTszvM4BqZ+Ujfq84l6+sCr5kaRW1Y=; b=HFSjZYmVsK0igI
	13yvChvvkq/Ur4xZbWSolSE3J1JQ3eMMuoH8M9ywbZWcoxIh7sRHV30+kGY92xmaztfrt4hXjfeT0
	mm1SRJ+5nFdd7ZZ2JX6SUnnmEfVtmfBDlKa7VFKnobjj1vl2O8hwejsFfZTNyXrYG2gVtPJIZRd1S
	nWy9CJe5mh/GMni8221hbDaZRQVXRlyiyemrYDxltZXSbF5oR0G33luFNxbtZ9mhHH3EyuvHlC49D
	30GNnKdzwVE4RNu+GtcDuUgAopZ0G05D2ctqq/+dyfZAH3H7o2PZynuBGhMFOQdcwvY2vH0qCVD4s
	W13H/H8gWQnItUKQh0eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT10u-00HVOJ-1G;
	Mon, 07 Aug 2023 14:15:16 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT10r-00HVJ4-0o
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 14:15:14 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b9db1de50cso69908881fa.3
        for <linux-mtd@lists.infradead.org>; Mon, 07 Aug 2023 07:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1691417694; x=1692022494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miXhKIkPE3lmozcU/B+jO2gbohIQfxtvXQrL6JQrLaA=;
        b=rUbGf+JZcp35dmq7w8slw0nHgKluYcuW30g35dHvkRNE8GAplx/bmohiweQc5R1m+t
         n8zrOL6x18GLNviLyBdF1SBbwknD+YT0R92Z3r7ozf/LbxR/ZX+oGNC6AweYXTnFy1Td
         qjM3KL4IzdURsMRiax7oRl3ig1sdRDyJ5+2Ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691417694; x=1692022494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=miXhKIkPE3lmozcU/B+jO2gbohIQfxtvXQrL6JQrLaA=;
        b=QB4e+tTEO8xoEofDS76ER7qM2ejUL6e7PZvFdM8/Ikjc2tbNQd7cqtW+Z9cIhDRudk
         9K97dLbpbkNnQvwlTDBzAQWhIV9wecmgoXEq4z+3sie6iyGTDyLnr1JqAyAfPDgsIv1K
         ixPqCL0XQIaLj5EXII7eNGz+Bup5lztkUYFctRZ89AdGcem+tbzXt22g8yIGT5ClvMxV
         hcpY/jezwzSLvxSbwJhNqKzlQ+q7bU9roaCuFkY+RKhw5bD6HT1NqoB5+OJLJ/0cLxUk
         8GN60GUBNTnsizjSZp/bGhd+Wrof+jg6X70cN8r/hA5HW5CtHWHpAuv8h1qUWtj48LpA
         ebeQ==
X-Gm-Message-State: AOJu0Yx8Hu4l9jMkcbOvADOh8fVMHnUKq9q3CgOULYXDRVKHQIWAFlHy
	FO7ODrtmrhSW6OuzEIEgP4l40sGfRaYLk3sKzezXOg==
X-Google-Smtp-Source: AGHT+IEUzxQ8uhfef4Gwj5w4R2S1a/fG2YmFdaAnrERcAODuTjnUg5MW8ffcyCI3WwFTK01hsv/WyE2OTkrmMwFZBOU=
X-Received: by 2002:a2e:9254:0:b0:2b6:dfef:d526 with SMTP id
 v20-20020a2e9254000000b002b6dfefd526mr6547671ljg.11.1691417693488; Mon, 07
 Aug 2023 07:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com> <20230807110936.21819-20-zhengqi.arch@bytedance.com>
In-Reply-To: <20230807110936.21819-20-zhengqi.arch@bytedance.com>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Mon, 7 Aug 2023 10:14:48 -0400
Message-ID: <CAEXW_YQHGBE2kKupLf12BGOEU5GnQsBUtVQcyMnzxUZ4y48QFA@mail.gmail.com>
Subject: Re: [PATCH v4 19/48] rcu: dynamically allocate the rcu-kfree shrinker
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru, 
	vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org, 
	brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu, steven.price@arm.com, 
	cel@kernel.org, senozhatsky@chromium.org, yujie.liu@intel.com, 
	gregkh@linuxfoundation.org, muchun.song@linux.dev, simon.horman@corigine.com, 
	dlemoal@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	x86@kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net, 
	cluster-devel@redhat.com, linux-nfs@vger.kernel.org, 
	linux-mtd@lists.infradead.org, rcu@vger.kernel.org, netdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dm-devel@redhat.com, linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, linux-fsdevel@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org, 
	linux-btrfs@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_071513_289747_278BCB30 
X-CRM114-Status: GOOD (  16.84  )
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

T24gTW9uLCBBdWcgNywgMjAyMyBhdCA3OjE34oCvQU0gUWkgWmhlbmcgPHpoZW5ncWkuYXJjaEBi
eXRlZGFuY2UuY29tPiB3cm90ZToKPgo+IFVzZSBuZXcgQVBJcyB0byBkeW5hbWljYWxseSBhbGxv
Y2F0ZSB0aGUgcmN1LWtmcmVlIHNocmlua2VyLgo+Cj4gU2lnbmVkLW9mZi1ieTogUWkgWmhlbmcg
PHpoZW5ncWkuYXJjaEBieXRlZGFuY2UuY29tPgoKRm9yIFJDVToKUmV2aWV3ZWQtYnk6IEpvZWwg
RmVybmFuZGVzIChHb29nbGUpIDxqb2VsQGpvZWxmZXJuYW5kZXMub3JnPgoKdGhhbmtzLAoKLSBK
b2VsCgoKPiAtLS0KPiAga2VybmVsL3JjdS90cmVlLmMgfCAyMiArKysrKysrKysrKysrLS0tLS0t
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9yY3UvdHJlZS5jIGIva2VybmVsL3JjdS90cmVlLmMKPiBp
bmRleCA3Yzc5NDgwYmZhYTAuLjNiMjBmYzQ2YzUxNCAxMDA2NDQKPiAtLS0gYS9rZXJuZWwvcmN1
L3RyZWUuYwo+ICsrKyBiL2tlcm5lbC9yY3UvdHJlZS5jCj4gQEAgLTM0NDksMTMgKzM0NDksNiBA
QCBrZnJlZV9yY3Vfc2hyaW5rX3NjYW4oc3RydWN0IHNocmlua2VyICpzaHJpbmssIHN0cnVjdCBz
aHJpbmtfY29udHJvbCAqc2MpCj4gICAgICAgICByZXR1cm4gZnJlZWQgPT0gMCA/IFNIUklOS19T
VE9QIDogZnJlZWQ7Cj4gIH0KPgo+IC1zdGF0aWMgc3RydWN0IHNocmlua2VyIGtmcmVlX3JjdV9z
aHJpbmtlciA9IHsKPiAtICAgICAgIC5jb3VudF9vYmplY3RzID0ga2ZyZWVfcmN1X3Nocmlua19j
b3VudCwKPiAtICAgICAgIC5zY2FuX29iamVjdHMgPSBrZnJlZV9yY3Vfc2hyaW5rX3NjYW4sCj4g
LSAgICAgICAuYmF0Y2ggPSAwLAo+IC0gICAgICAgLnNlZWtzID0gREVGQVVMVF9TRUVLUywKPiAt
fTsKPiAtCj4gIHZvaWQgX19pbml0IGtmcmVlX3JjdV9zY2hlZHVsZXJfcnVubmluZyh2b2lkKQo+
ICB7Cj4gICAgICAgICBpbnQgY3B1Owo+IEBAIC00OTMxLDYgKzQ5MjQsNyBAQCBzdGF0aWMgdm9p
ZCBfX2luaXQga2ZyZWVfcmN1X2JhdGNoX2luaXQodm9pZCkKPiAgewo+ICAgICAgICAgaW50IGNw
dTsKPiAgICAgICAgIGludCBpLCBqOwo+ICsgICAgICAgc3RydWN0IHNocmlua2VyICprZnJlZV9y
Y3Vfc2hyaW5rZXI7Cj4KPiAgICAgICAgIC8qIENsYW1wIGl0IHRvIFswOjEwMF0gc2Vjb25kcyBp
bnRlcnZhbC4gKi8KPiAgICAgICAgIGlmIChyY3VfZGVsYXlfcGFnZV9jYWNoZV9maWxsX21zZWMg
PCAwIHx8Cj4gQEAgLTQ5NjIsOCArNDk1NiwxOCBAQCBzdGF0aWMgdm9pZCBfX2luaXQga2ZyZWVf
cmN1X2JhdGNoX2luaXQodm9pZCkKPiAgICAgICAgICAgICAgICAgSU5JVF9ERUxBWUVEX1dPUkso
JmtyY3AtPnBhZ2VfY2FjaGVfd29yaywgZmlsbF9wYWdlX2NhY2hlX2Z1bmMpOwo+ICAgICAgICAg
ICAgICAgICBrcmNwLT5pbml0aWFsaXplZCA9IHRydWU7Cj4gICAgICAgICB9Cj4gLSAgICAgICBp
ZiAocmVnaXN0ZXJfc2hyaW5rZXIoJmtmcmVlX3JjdV9zaHJpbmtlciwgInJjdS1rZnJlZSIpKQo+
IC0gICAgICAgICAgICAgICBwcl9lcnIoIkZhaWxlZCB0byByZWdpc3RlciBrZnJlZV9yY3UoKSBz
aHJpbmtlciFcbiIpOwo+ICsKPiArICAgICAgIGtmcmVlX3JjdV9zaHJpbmtlciA9IHNocmlua2Vy
X2FsbG9jKDAsICJyY3Uta2ZyZWUiKTsKPiArICAgICAgIGlmICgha2ZyZWVfcmN1X3Nocmlua2Vy
KSB7Cj4gKyAgICAgICAgICAgICAgIHByX2VycigiRmFpbGVkIHRvIGFsbG9jYXRlIGtmcmVlX3Jj
dSgpIHNocmlua2VyIVxuIik7Cj4gKyAgICAgICAgICAgICAgIHJldHVybjsKPiArICAgICAgIH0K
PiArCj4gKyAgICAgICBrZnJlZV9yY3Vfc2hyaW5rZXItPmNvdW50X29iamVjdHMgPSBrZnJlZV9y
Y3Vfc2hyaW5rX2NvdW50Owo+ICsgICAgICAga2ZyZWVfcmN1X3Nocmlua2VyLT5zY2FuX29iamVj
dHMgPSBrZnJlZV9yY3Vfc2hyaW5rX3NjYW47Cj4gKyAgICAgICBrZnJlZV9yY3Vfc2hyaW5rZXIt
PnNlZWtzID0gREVGQVVMVF9TRUVLUzsKPiArCj4gKyAgICAgICBzaHJpbmtlcl9yZWdpc3Rlcihr
ZnJlZV9yY3Vfc2hyaW5rZXIpOwo+ICB9Cj4KPiAgdm9pZCBfX2luaXQgcmN1X2luaXQodm9pZCkK
PiAtLQo+IDIuMzAuMgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
