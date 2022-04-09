Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBA9C433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Apr 2022 08:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QTtkBMir6534+HfHl9Bxsa18L9nckA6vencGDrEU6Ts=; b=uHAFYrbujjZHo+
	nxx6V4/N1NsOEaIm3R8cysGPvL8l3GmEh/FM1EVj1ZIfns+AXi23h2rB7d2BtCdw1qONmv2bqJ6CV
	Asrjv8t4xfrBsxbxw0finxSxrry3Y8cEACGe1tvneOByjSEGYi8BXIsuRhejI51+9PtiXJob0WwO9
	bHLHn3qVspmnrls8OB0GsaqgGME7bRF1oWkJQlmpDucbiwXrvKBTpTVj2ulRFYiyYxu1TnRCaCuLF
	I9sCXb65CpLdTfBK1HapxFJhfR39QLSKO+YBA8RHvpQRs9GhUPuFMkU3+MC1OFL1A1UxkZwD3Jvaj
	5gPnS4q4eGtubJsiy19Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nd6HO-002ZeQ-5x; Sat, 09 Apr 2022 08:17:10 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd6HH-002Zab-5W
 for linux-mtd@lists.infradead.org; Sat, 09 Apr 2022 08:17:05 +0000
Received: by mail-wr1-x42e.google.com with SMTP id k23so16037868wrd.8
 for <linux-mtd@lists.infradead.org>; Sat, 09 Apr 2022 01:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linbit-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Ga61vN/TMGQoWv5pdVva9yHEVEk7JvDu8SvkqTkiHOU=;
 b=16VWXfTcecI6vKD89hlxEi4M1sM+lDWraPFKcdJek4zYvKgcUI+UTTfswq4WTG3pUA
 DwGdvejVPHmGbB6WxyxpG5RxCDgxrI8ELqeSKx9xnWZSuDqFsfTR7C0q23UBJ4NTUUke
 9rs/lGq9PScZMcSAS9SHkk+s8lIoFrVgzxTJ9NRLUES2XsBvbZXGJskPHSy0jdzHruaB
 iGqoe9YksSt5XleGcAhaVmv2OHki/8AO1/zdgDuyMqAmL6dyveVZDyPGB/rY+7+4UaaK
 b7o7nIN/SrEk1fy76OtZuySau99YX+Sryl6fYO8t+jUUvribl7KiF9nqytVWelfdH+Mk
 O4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ga61vN/TMGQoWv5pdVva9yHEVEk7JvDu8SvkqTkiHOU=;
 b=V8sQLkEkIdn6Rye6hFVwkZwKjHdsdD6DmPRbUljNB4qgM662Aoic2OeWE0GnpgrWLv
 iIGm1GJuTZIGYjUpc+VfEz9WeKNrFPiyUzPaFUMdlssLzi7gJ5tXDAwU0JC5/ti5xv5Y
 9A45MJk6Nragawt1S8KRE/HtPBa5V6By+109/FABJbR67d/8NdG31wXoxOjr/ErqVQpS
 +Y9uY2JI3+C72n/mrlhsCBOi4xgKCF7dzQek8tNxNsQ6SxBextpDIDSi6EY76hgQKb6d
 mphfekk3ysgFiaoijobtSevANkMtMoBVEDwsv//09rfD++lt0ghKN8IzdtcFrOY0ZrRR
 OzGA==
X-Gm-Message-State: AOAM532FCMrUN792VotZxZfDT55Yqx1DD/ISdmABClP5KVckIjiu/7ln
 RHEFPHN5sz8IPNzzGKXdCk0yoQ==
X-Google-Smtp-Source: ABdhPJyMl7hUdRWB67QUv24ZWK8mJRwBaxhnGq09ejE28bU5zjvkHivlidIC/JIf/EdWqVvIZNI6nA==
X-Received: by 2002:adf:9581:0:b0:1ed:c341:4ed1 with SMTP id
 p1-20020adf9581000000b001edc3414ed1mr16998132wrp.299.1649492221449; 
 Sat, 09 Apr 2022 01:17:01 -0700 (PDT)
Received: from [192.168.169.127] (178.115.52.210.wireless.dyn.drei.com.
 [178.115.52.210]) by smtp.gmail.com with ESMTPSA id
 r14-20020a05600c35ce00b0038c9f469979sm12169802wmq.40.2022.04.09.01.16.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 01:17:01 -0700 (PDT)
Message-ID: <5a26cdb1-b63b-8d35-640b-bc0e0f78a181@linbit.com>
Date: Sat, 9 Apr 2022 10:16:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Drbd-dev] [PATCH 04/27] drbd: remove assign_p_sizes_qlim
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 linux-um@lists.infradead.org, nbd@other.debian.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-btrfs@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
References: <20220409045043.23593-1-hch@lst.de>
 <20220409045043.23593-5-hch@lst.de>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20220409045043.23593-5-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220409_011703_234412_7D363AE7 
X-CRM114-Status: GOOD (  16.51  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMDkuMDQuMjIgMDY6NTAsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+IEZvbGQgZWFjaCBi
cmFuY2ggaW50byBpdHMgb25seSBjYWxsZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3Bo
IEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gLS0tCj4gICBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9t
YWluLmMgfCA0NyArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYyBiL2RyaXZlcnMvYmxvY2svZHJiZC9k
cmJkX21haW4uYwo+IGluZGV4IDk2NzZhMWQyMTRiYzUuLjEyNjJmZTFjMzM2MTggMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbWFpbi5jCj4gKysrIGIvZHJpdmVycy9ibG9j
ay9kcmJkL2RyYmRfbWFpbi5jCj4gQEAgLTkwMywzMSArOTAzLDYgQEAgdm9pZCBkcmJkX2dlbl9h
bmRfc2VuZF9zeW5jX3V1aWQoc3RydWN0IGRyYmRfcGVlcl9kZXZpY2UgKnBlZXJfZGV2aWNlKQo+
ICAgCX0KPiAgIH0KPiAgIAo+IC0vKiBjb21tdW5pY2F0ZWQgaWYgKGFncmVlZF9mZWF0dXJlcyAm
IERSQkRfRkZfV1NBTUUpICovCj4gLXN0YXRpYyB2b2lkCj4gLWFzc2lnbl9wX3NpemVzX3FsaW0o
c3RydWN0IGRyYmRfZGV2aWNlICpkZXZpY2UsIHN0cnVjdCBwX3NpemVzICpwLAo+IC0JCQkJCXN0
cnVjdCByZXF1ZXN0X3F1ZXVlICpxKQo+IC17Cj4gLQlpZiAocSkgewo+IC0JCXAtPnFsaW0tPnBo
eXNpY2FsX2Jsb2NrX3NpemUgPSBjcHVfdG9fYmUzMihxdWV1ZV9waHlzaWNhbF9ibG9ja19zaXpl
KHEpKTsKPiAtCQlwLT5xbGltLT5sb2dpY2FsX2Jsb2NrX3NpemUgPSBjcHVfdG9fYmUzMihxdWV1
ZV9sb2dpY2FsX2Jsb2NrX3NpemUocSkpOwo+IC0JCXAtPnFsaW0tPmFsaWdubWVudF9vZmZzZXQg
PSBjcHVfdG9fYmUzMihxdWV1ZV9hbGlnbm1lbnRfb2Zmc2V0KHEpKTsKPiAtCQlwLT5xbGltLT5p
b19taW4gPSBjcHVfdG9fYmUzMihxdWV1ZV9pb19taW4ocSkpOwo+IC0JCXAtPnFsaW0tPmlvX29w
dCA9IGNwdV90b19iZTMyKHF1ZXVlX2lvX29wdChxKSk7Cj4gLQkJcC0+cWxpbS0+ZGlzY2FyZF9l
bmFibGVkID0gYmxrX3F1ZXVlX2Rpc2NhcmQocSk7Cj4gLQkJcC0+cWxpbS0+d3JpdGVfc2FtZV9j
YXBhYmxlID0gMDsKPiAtCX0gZWxzZSB7Cj4gLQkJcSA9IGRldmljZS0+cnFfcXVldWU7Cj4gLQkJ
cC0+cWxpbS0+cGh5c2ljYWxfYmxvY2tfc2l6ZSA9IGNwdV90b19iZTMyKHF1ZXVlX3BoeXNpY2Fs
X2Jsb2NrX3NpemUocSkpOwo+IC0JCXAtPnFsaW0tPmxvZ2ljYWxfYmxvY2tfc2l6ZSA9IGNwdV90
b19iZTMyKHF1ZXVlX2xvZ2ljYWxfYmxvY2tfc2l6ZShxKSk7Cj4gLQkJcC0+cWxpbS0+YWxpZ25t
ZW50X29mZnNldCA9IDA7Cj4gLQkJcC0+cWxpbS0+aW9fbWluID0gY3B1X3RvX2JlMzIocXVldWVf
aW9fbWluKHEpKTsKPiAtCQlwLT5xbGltLT5pb19vcHQgPSBjcHVfdG9fYmUzMihxdWV1ZV9pb19v
cHQocSkpOwo+IC0JCXAtPnFsaW0tPmRpc2NhcmRfZW5hYmxlZCA9IDA7Cj4gLQkJcC0+cWxpbS0+
d3JpdGVfc2FtZV9jYXBhYmxlID0gMDsKPiAtCX0KPiAtfQo+IC0KPiAgIGludCBkcmJkX3NlbmRf
c2l6ZXMoc3RydWN0IGRyYmRfcGVlcl9kZXZpY2UgKnBlZXJfZGV2aWNlLCBpbnQgdHJpZ2dlcl9y
ZXBseSwgZW51bSBkZHNfZmxhZ3MgZmxhZ3MpCj4gICB7Cj4gICAJc3RydWN0IGRyYmRfZGV2aWNl
ICpkZXZpY2UgPSBwZWVyX2RldmljZS0+ZGV2aWNlOwo+IEBAIC05NTcsMTQgKzkzMiwzMiBAQCBp
bnQgZHJiZF9zZW5kX3NpemVzKHN0cnVjdCBkcmJkX3BlZXJfZGV2aWNlICpwZWVyX2RldmljZSwg
aW50IHRyaWdnZXJfcmVwbHksIGVudQo+ICAgCQlxX29yZGVyX3R5cGUgPSBkcmJkX3F1ZXVlX29y
ZGVyX3R5cGUoZGV2aWNlKTsKPiAgIAkJbWF4X2Jpb19zaXplID0gcXVldWVfbWF4X2h3X3NlY3Rv
cnMocSkgPDwgOTsKPiAgIAkJbWF4X2Jpb19zaXplID0gbWluKG1heF9iaW9fc2l6ZSwgRFJCRF9N
QVhfQklPX1NJWkUpOwo+IC0JCWFzc2lnbl9wX3NpemVzX3FsaW0oZGV2aWNlLCBwLCBxKTsKPiAr
CQlwLT5xbGltLT5waHlzaWNhbF9ibG9ja19zaXplID0KPiArCQkJY3B1X3RvX2JlMzIocXVldWVf
cGh5c2ljYWxfYmxvY2tfc2l6ZShxKSk7Cj4gKwkJcC0+cWxpbS0+bG9naWNhbF9ibG9ja19zaXpl
ID0KPiArCQkJY3B1X3RvX2JlMzIocXVldWVfbG9naWNhbF9ibG9ja19zaXplKHEpKTsKPiArCQlw
LT5xbGltLT5hbGlnbm1lbnRfb2Zmc2V0ID0KPiArCQkJY3B1X3RvX2JlMzIocXVldWVfYWxpZ25t
ZW50X29mZnNldChxKSk7Cj4gKwkJcC0+cWxpbS0+aW9fbWluID0gY3B1X3RvX2JlMzIocXVldWVf
aW9fbWluKHEpKTsKPiArCQlwLT5xbGltLT5pb19vcHQgPSBjcHVfdG9fYmUzMihxdWV1ZV9pb19v
cHQocSkpOwo+ICsJCXAtPnFsaW0tPmRpc2NhcmRfZW5hYmxlZCA9IGJsa19xdWV1ZV9kaXNjYXJk
KHEpOwo+ICAgCQlwdXRfbGRldihkZXZpY2UpOwo+ICAgCX0gZWxzZSB7Cj4gKwkJc3RydWN0IHJl
cXVlc3RfcXVldWUgKnEgPSBkZXZpY2UtPnJxX3F1ZXVlOwo+ICsKPiArCQlwLT5xbGltLT5waHlz
aWNhbF9ibG9ja19zaXplID0KPiArCQkJY3B1X3RvX2JlMzIocXVldWVfcGh5c2ljYWxfYmxvY2tf
c2l6ZShxKSk7Cj4gKwkJcC0+cWxpbS0+bG9naWNhbF9ibG9ja19zaXplID0KPiArCQkJY3B1X3Rv
X2JlMzIocXVldWVfbG9naWNhbF9ibG9ja19zaXplKHEpKTsKPiArCQlwLT5xbGltLT5hbGlnbm1l
bnRfb2Zmc2V0ID0gMDsKPiArCQlwLT5xbGltLT5pb19taW4gPSBjcHVfdG9fYmUzMihxdWV1ZV9p
b19taW4ocSkpOwo+ICsJCXAtPnFsaW0tPmlvX29wdCA9IGNwdV90b19iZTMyKHF1ZXVlX2lvX29w
dChxKSk7Cj4gKwkJcC0+cWxpbS0+ZGlzY2FyZF9lbmFibGVkID0gMDsKPiArCj4gICAJCWRfc2l6
ZSA9IDA7Cj4gICAJCXVfc2l6ZSA9IDA7Cj4gICAJCXFfb3JkZXJfdHlwZSA9IFFVRVVFX09SREVS
RURfTk9ORTsKPiAgIAkJbWF4X2Jpb19zaXplID0gRFJCRF9NQVhfQklPX1NJWkU7IC8qIC4uLiBt
dWx0aXBsZSBCSU9zIHBlciBwZWVyX3JlcXVlc3QgKi8KPiAtCQlhc3NpZ25fcF9zaXplc19xbGlt
KGRldmljZSwgcCwgTlVMTCk7Cj4gICAJfQo+ICAgCj4gICAJaWYgKHBlZXJfZGV2aWNlLT5jb25u
ZWN0aW9uLT5hZ3JlZWRfcHJvX3ZlcnNpb24gPD0gOTQpCgpMR1RNIG5vdywgdGhhbmtzLgoKQWNr
ZWQtYnk6IENocmlzdG9waCBCw7ZobXdhbGRlciA8Y2hyaXN0b3BoLmJvZWhtd2FsZGVyQGxpbmJp
dC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
