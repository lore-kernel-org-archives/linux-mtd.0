Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4396EF41807
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2026 15:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9NaAMnCC/t1pj7rJM3ztypdBEIzbq6kRngQDYlZ5O64=; b=oPojtCVZ2Ez31n
	/UWTsqivTn9GH07BmlEy1n06AwWPbBUr8OCCjSefv6SBy2LhLhUfbMNp8gyL8+H+LZb7J4aAvXgEU
	lUfAcgoIPvQTdpejhyoCVP0q808lV6mLIZzygHBaj+GMuTZ8syclH2k0Qsteli9cBZK61KFkws2kN
	S8h0lKoRsjQgKPtv2YdaN4bwdmKnv/jBkWP8ablqGzzHGdljqzu1Pv1CiONJA9cpxD741iqlPZpvQ
	uCnvyT8/BwDV0y1d2c7GF2d9FQXAMKERg9DEFnQFdC5iMTcL3B7Etz2rA0MhPMZuFPXHjVFiJ63Pq
	cHKN076tzh6v9ysqrrHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcaH-00000007bre-0CnJ;
	Mon, 09 Mar 2026 15:31:53 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcaE-00000007bqh-2Sdw
	for linux-mtd@lists.infradead.org;
	Mon, 09 Mar 2026 15:31:51 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7d746975576so46017a34.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Mar 2026 08:31:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773070310; cv=none;
        d=google.com; s=arc-20240605;
        b=Puvm8ckkiwCc1GEtr2wvOXDu1dE5D8cC7ADhE4+yYP0d3kQJ43s5xHk1RYBsMkJX2/
         NX2wp2LRZD3Jernvlg2rzqyyWVWDxzZjqtQ9WEcdomsZEPv5gFP5LuN+8SnQeTzqcpt1
         Bo9oM9KdR+TZ6nnT0CZrnPNUAlTUYzR7CmX7QZlSqMNG/mgeSWeNiTNNlt3UMLG6qa6M
         mDYUP+lb6hCVHin+r9C7eHWOmA7M5buyR0dqZKOOjpkZm1/RP02gLbEPOoVGEu2O5nQY
         g/DAgwO1sk1kmANWNMr1wSWBH+3Or9tsTtwzkkJb6QHlAIWWO7jhNH10H9yUBtZct4aN
         Zlqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oeNCYoeh9aVUManQKA2h7rmbYGtX7bI6QzEClpFzvxQ=;
        fh=hB9CLy6MUzo7XlUVeeOKFJ/JsCi1Of+Km5YmyXfxJdA=;
        b=FSHI7AfRv1lehdH3iF3FwEjWnJ+b2dwbV1vfrmJ8wFeFBsPVRkTbgyyaC9CYnd5cUb
         5tnkMGhzEOZsh3ciuf5X3p88afTmn3d9ngAvpfOznw8PUCTAy/2HT797Gx4csPZtFK2W
         3nvvOTtuxrXUbY/wlnSthe+88OpZ4Rh7+D67xQhkcm9L7/a+ebgVZ6GP35msADKif4iY
         odOxrXruUusdA1f6eUjRK7f7nolDHnTAk3exAbKAkPJjaiKFSpU0wrYiy+VZEGyL8fPe
         KbNZX/3RvWFX7y6CIBewt0T49R5bb4vAdeSt+Jvi0zdlusX0gdQ640kPXKosi1xbfAod
         L6cw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1773070310; x=1773675110; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oeNCYoeh9aVUManQKA2h7rmbYGtX7bI6QzEClpFzvxQ=;
        b=gFP7vNFylR1+6AiQohPJyJx/vmUuB8lJMvdchvGFnpV3nOph6G0Y17aFwDzeZ8zJfg
         AjPlUDRRMdLlP+S9CsMfKzRWX/n10dz2QMLYlZPkCILcslQnIROavpuOVaoZyiIlJqTa
         8+dpjIaWv+5bue8VFKFbMlRXCc4IeBRb+zGV8m2WO5v+yaPczIl7Sw4LhWtAXR+3Zo/I
         kmeix2JVJ9K6t8KDkJ/AktGgtR9AeAwnlFks9BkR3A4v8j/I8qoHsUDDdoyaTS7ed3c4
         Ledfsu5k9XGSRkSU5ZIuAFt78ZnrR2e4vMNCiWHv6TKoNqOIvj+3RIQJDr7vJsuzM7Et
         VhLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773070310; x=1773675110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oeNCYoeh9aVUManQKA2h7rmbYGtX7bI6QzEClpFzvxQ=;
        b=N/XRWwLSJTEibcoAXBTQZCcKSTL0AYbQfynHqvkN11Kth1D6C6PA1JjsgUhAxDNz9j
         UpQ3BWAjGphRsO6Fkr3w+ntzEaVpIeqcZYLJ8DLhL71Sf/dh9Zzsd0pKJTWv+wRgmoEo
         wXAMO31j89vD5lQD14zMc7eDngQSDz0iMe51hHU0VF1SeK2Ik7/BXkXPEzfxbJt6LfbP
         lV5eT8UyUyIpgCsGZ6NJ/I8vXpgmM+WWXz6p1o/0mj87IrRk383AdmkLyWbhpMenvvi4
         WjrtAgeSgxz93GO+0mbGqgp5x/LDsi+t8GDqJ1MpJX9upjSL/rd7Oq+5GChBNNC3Vz1x
         g1jA==
X-Forwarded-Encrypted: i=1; AJvYcCWnR01Sp//BHGt6G1luycFB9McWRJLAh5d1H2SwEt3Y9SmTMEeslgG5OhVUskg12kotg4zyWyettWQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8isyF0DPVksuIObMvjmnCCShoufSMDNVIpRjCequqJsUwbkmT
	1CPjANJ+o3QHSBgaMbpPNLcNbb6CVMDbv1VA31jDGon7HqrPoYYW03l4aAmf/JjnoevO+wDk22Y
	NlS4Ze+RxcVmo6Z2g9mwWxO4/4yTjVHepzqXjiOcCVQ==
X-Gm-Gg: ATEYQzxjoNQMLnWwv1Wl/gznyCswwPHkBssHwxYPCi5egvrq++Su1Jq3sJmeSdOWQGl
	kQAU6YgkMpoNGnr3xFUVoBxHKjly79cTPKpyhTPlw0Vp//SvOv/z9OvcKvC4dW24LY36c5Zo9qZ
	VD1tW17OPpdJYdDGY18fn2ncl0zPBh9t+yit6OgfnQCwx17yOfcYeUgiXGEghsyfXRHdeosEuxh
	YJti7rXRP1jLZejhQkeFKSUpY27bIB9Xt6f8I1Quk3TNPiE9QnnM79oEi1aZQgdMUkCg1xLXPAd
	8sXbS1ZSVJ4Bfj3atQ==
X-Received: by 2002:a05:6830:4486:b0:7d7:4cf3:76eb with SMTP id
 46e09a7af769-7d74cf37b02mr2194872a34.4.1773070309370; Mon, 09 Mar 2026
 08:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260309062840.2937858-2-iam@sung-woo.kim> <202603090911.0DdOwjTR-lkp@intel.com>
In-Reply-To: <202603090911.0DdOwjTR-lkp@intel.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Mon, 9 Mar 2026 08:31:38 -0700
X-Gm-Features: AaiRm52Z14MD0OSGkRezE5rp23B4YvHF_3hxCrYP4X9p-5DR-qWhmespFt1uSGc
Message-ID: <CADUfDZqBZWwy+6XOde_aZTwLisRP8j5qRqB6X_EJJPr+wmdGZQ@mail.gmail.com>
Subject: Re: [PATCH] blk-mq: nvme: Fix general protection fault in nvme_setup_descriptor_pools()
To: kernel test robot <lkp@intel.com>
Cc: Sungwoo Kim <iam@sung-woo.kim>, Jens Axboe <axboe@kernel.dk>, 
	Josef Bacik <josef@toxicpanda.com>, Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Mikulas Patocka <mpatocka@redhat.com>, dm-devel@lists.linux.dev, 
	Ulf Hansson <ulf.hansson@linaro.org>, Richard Weinberger <richard@nod.at>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, James Smart <james.smart@broadcom.com>, 
	Chaitanya Kulkarni <kch@nvidia.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, oe-kbuild-all@lists.linux.dev, 
	Chao Shi <cshi008@fiu.edu>, Weidong Zhu <weizhu@fiu.edu>, Dave Tian <daveti@purdue.edu>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nbd@other.debian.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, asahi@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_083150_637943_EC7C0473 
X-CRM114-Status: GOOD (  18.09  )
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

T24gTW9uLCBNYXIgOSwgMjAyNiBhdCAxOjQy4oCvQU0ga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBp
bnRlbC5jb20+IHdyb3RlOgo+Cj4gSGkgU3VuZ3dvbywKPgo+IGtlcm5lbCB0ZXN0IHJvYm90IG5v
dGljZWQgdGhlIGZvbGxvd2luZyBidWlsZCBlcnJvcnM6Cj4KPiBbYXV0byBidWlsZCB0ZXN0IEVS
Uk9SIG9uIGF4Ym9lL2Zvci1uZXh0XQo+IFthbHNvIGJ1aWxkIHRlc3QgRVJST1Igb24gZGV2aWNl
LW1hcHBlci1kbS9mb3ItbmV4dCBsaW51cy9tYXN0ZXIgdjYuMTYtcmMxIG5leHQtMjAyNjAzMDZd
Cj4gW2Nhbm5vdCBhcHBseSB0byBsaW51eC1udm1lL2Zvci1uZXh0XQo+IFtJZiB5b3VyIHBhdGNo
IGlzIGFwcGxpZWQgdG8gdGhlIHdyb25nIGdpdCB0cmVlLCBraW5kbHkgZHJvcCB1cyBhIG5vdGUu
Cj4gQW5kIHdoZW4gc3VibWl0dGluZyBwYXRjaCwgd2Ugc3VnZ2VzdCB0byB1c2UgJy0tYmFzZScg
YXMgZG9jdW1lbnRlZCBpbgo+IGh0dHBzOi8vZ2l0LXNjbS5jb20vZG9jcy9naXQtZm9ybWF0LXBh
dGNoI19iYXNlX3RyZWVfaW5mb3JtYXRpb25dCj4KPiB1cmw6ICAgIGh0dHBzOi8vZ2l0aHViLmNv
bS9pbnRlbC1sYWItbGtwL2xpbnV4L2NvbW1pdHMvU3VuZ3dvby1LaW0vYmxrLW1xLW52bWUtRml4
LWdlbmVyYWwtcHJvdGVjdGlvbi1mYXVsdC1pbi1udm1lX3NldHVwX2Rlc2NyaXB0b3JfcG9vbHMv
MjAyNjAzMDktMTQzMTA3Cj4gYmFzZTogICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9heGJvZS9saW51eC5naXQgZm9yLW5leHQKPiBwYXRjaCBsaW5rOiAg
ICBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYwMzA5MDYyODQwLjI5Mzc4NTgtMi1pYW0l
NDBzdW5nLXdvby5raW0KPiBwYXRjaCBzdWJqZWN0OiBbUEFUQ0hdIGJsay1tcTogbnZtZTogRml4
IGdlbmVyYWwgcHJvdGVjdGlvbiBmYXVsdCBpbiBudm1lX3NldHVwX2Rlc2NyaXB0b3JfcG9vbHMo
KQo+IGNvbmZpZzogeDg2XzY0LXJoZWwtOS40LXJ1c3QgKGh0dHBzOi8vZG93bmxvYWQuMDEub3Jn
LzBkYXktY2kvYXJjaGl2ZS8yMDI2MDMwOS8yMDI2MDMwOTA5MTEuMERkT3dqVFItbGtwQGludGVs
LmNvbS9jb25maWcpCj4gY29tcGlsZXI6IGNsYW5nIHZlcnNpb24gMjAuMS44IChodHRwczovL2dp
dGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3QgODdmMDIyN2NiNjAxNDdhMjZhMWVlYjRmYjA2ZTNi
NTA1ZTljNzI2MSkKPiBydXN0YzogcnVzdGMgMS44OC4wICg2YjAwYmMzODggMjAyNS0wNi0yMykK
PiByZXByb2R1Y2UgKHRoaXMgaXMgYSBXPTEgYnVpbGQpOiAoaHR0cHM6Ly9kb3dubG9hZC4wMS5v
cmcvMGRheS1jaS9hcmNoaXZlLzIwMjYwMzA5LzIwMjYwMzA5MDkxMS4wRGRPd2pUUi1sa3BAaW50
ZWwuY29tL3JlcHJvZHVjZSkKPgo+IElmIHlvdSBmaXggdGhlIGlzc3VlIGluIGEgc2VwYXJhdGUg
cGF0Y2gvY29tbWl0IChpLmUuIG5vdCBqdXN0IGEgbmV3IHZlcnNpb24gb2YKPiB0aGUgc2FtZSBw
YXRjaC9jb21taXQpLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWdzCj4gfCBSZXBvcnRlZC1ieTog
a2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gfCBDbG9zZXM6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyNjAzMDkwOTExLjBEZE93alRSLWxrcEBpbnRl
bC5jb20vCj4KPiBBbGwgZXJyb3JzIChuZXcgb25lcyBwcmVmaXhlZCBieSA+Pik6Cj4KPiA+PiBl
cnJvcltFMDMwOF06IG1pc21hdGNoZWQgdHlwZXMKPiAgICAtLT4gcnVzdC9rZXJuZWwvYmxvY2sv
bXEvb3BlcmF0aW9ucy5yczoyNzQ6MjgKPiAgICB8Cj4gICAgMjc0IHwgICAgICAgICBpbml0X3Jl
cXVlc3Q6IFNvbWUoU2VsZjo6aW5pdF9yZXF1ZXN0X2NhbGxiYWNrKSwKPiAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICAtLS0tIF5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXiBleHBlY3RlZCBm
biBwb2ludGVyLCBmb3VuZCBmbiBpdGVtCj4gICAgfCAgICAgICAgICAgICAgICAgICAgICAgfAo+
ICAgIHwgICAgICAgICAgICAgICAgICAgICAgIGFyZ3VtZW50cyB0byB0aGlzIGVudW0gdmFyaWFu
dCBhcmUgaW5jb3JyZWN0Cj4gICAgfAo+ICAgID0gbm90ZTogZXhwZWN0ZWQgZm4gcG9pbnRlciBg
dW5zYWZlIGV4dGVybiAiQyIgZm4oXywgXywgXywgaTMyKSAtPiBfYAo+ICAgIGZvdW5kIGZuIGl0
ZW0gYHVuc2FmZSBleHRlcm4gIkMiIGZuKF8sIF8sIF8sIHUzMikgLT4gXyB7YmxvY2s6Om1xOjpv
cGVyYXRpb25zOjpPcGVyYXRpb25zVlRhYmxlOjo8VD46OmluaXRfcmVxdWVzdF9jYWxsYmFja31g
Cj4gICAgaGVscDogdGhlIHR5cGUgY29uc3RydWN0ZWQgY29udGFpbnMgYHVuc2FmZSBleHRlcm4g
IkMiIGZuKCptdXQgYmluZGluZ3M6OmJsa19tcV90YWdfc2V0LCAqbXV0IGJpbmRpbmdzOjpyZXF1
ZXN0LCB1MzIsIHUzMikgLT4gaTMyIHtibG9jazo6bXE6Om9wZXJhdGlvbnM6Ok9wZXJhdGlvbnNW
VGFibGU6OjxUPjo6aW5pdF9yZXF1ZXN0X2NhbGxiYWNrfWAgZHVlIHRvIHRoZSB0eXBlIG9mIHRo
ZSBhcmd1bWVudCBwYXNzZWQKCkxvb2tzIGxpa2UgdGhlIHR5cGUgb2YgX251bWFfbm9kZSBpbiB0
aGUgc2lnbmF0dXJlIG9mCmluaXRfcmVxdWVzdF9jYWxsYmFjaygpIG5lZWRzIHRvIGJlIHVwZGF0
ZWQgYWNjb3JkaW5nbHkgZnJvbSBjX3VpbnQgdG8KY19pbnQuCgpCZXN0LApDYWxlYgoKCj4gICAg
LS0+IHJ1c3Qva2VybmVsL2Jsb2NrL21xL29wZXJhdGlvbnMucnM6Mjc0OjIzCj4gICAgfAo+ICAg
IDI3NCB8ICAgICAgICAgaW5pdF9yZXF1ZXN0OiBTb21lKFNlbGY6OmluaXRfcmVxdWVzdF9jYWxs
YmFjayksCj4gICAgfCAgICAgICAgICAgICAgICAgICAgICAgXl5eXl4tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS1eCj4gICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8Cj4gICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB0aGlzIGFyZ3VtZW50IGluZmx1ZW5jZXMgdGhlIHR5
cGUgb2YgYFNvbWVgCj4gICAgbm90ZTogdHVwbGUgdmFyaWFudCBkZWZpbmVkIGhlcmUKPiAgICAt
LT4gL29wdC9jcm9zcy9ydXN0Yy0xLjg4LjAtYmluZGdlbi0wLjcyLjEvcnVzdHVwL3Rvb2xjaGFp
bnMvMS44OC4wLXg4Nl82NC11bmtub3duLWxpbnV4LWdudS9saWIvcnVzdGxpYi9zcmMvcnVzdC9s
aWJyYXJ5L2NvcmUvc3JjL29wdGlvbi5yczo1OTc6NQo+ICAgIHwKPiAgICA1OTcgfCAgICAgU29t
ZSgjW3N0YWJsZShmZWF0dXJlID0gInJ1c3QxIiwgc2luY2UgPSAiMS4wLjAiKV0gVCksCj4gICAg
fCAgICAgXl5eXgo+Cj4gLS0KPiAwLURBWSBDSSBLZXJuZWwgVGVzdCBTZXJ2aWNlCj4gaHR0cHM6
Ly9naXRodWIuY29tL2ludGVsL2xrcC10ZXN0cy93aWtpCj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
