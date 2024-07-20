Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111B1C3DA49
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Jul 2024 10:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6rZqK6vb2s0BmGDRiUlGka1yS3De9OgzcIQGVQDLsRU=; b=haotumhCNkFE64
	RzhjRFwcHjjre7s/9CWdxU23MRV1cfkgSwlyYaZwooNj7sLpnPazFqVuu8UAqv0j9KfDFa5rhLMAj
	/iLpBvmEHPlMNXR7Ifc82/DPjv3ohgPzZe5HEQGor+1NrLf6zfoPg+tLIwMpDdQ8ZwffHguYf6nqs
	IaGpWtz34jbvMISg5xrhyqzJgpYzw5RVmlMVafds6WpCKOx1slwGjrvsp/dnKtQlk0C1XwoA8Sab2
	p01N5rbzd4IznqZ9IKP2aMt8AtbViESO824/2S+G8syOHVEfwHylzLQ0yQuBqkJKNfrAJUAJWWgpv
	MZx2XaehAnFZ3XxlLpQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sV7Xu-00000004wNf-0Rv8;
	Sat, 20 Jul 2024 10:42:34 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sV7Xq-00000004wM3-12bq
	for linux-mtd@lists.infradead.org;
	Sat, 20 Jul 2024 10:42:31 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-427b9dcbb09so19448015e9.3
        for <linux-mtd@lists.infradead.org>; Sat, 20 Jul 2024 03:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721472148; x=1722076948; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yvVRqveKCbnKGjsii996Z+A1wxik6ho1ZN1Ar+GN1jU=;
        b=NzEVuule78hvrSU46rbXLdYCRM9aIkzH+gnWffAat1bm3hOuPbu4zqO4iscrjvaWcs
         MSLMhZfrZDOrgO994wpagVhPJ8TqMsdxJUipM0ApV/rjNAA4g6c8ZtIP5Fh1d5NQgJhp
         Upf/+63XPufcX+Th0jOs7Qs6IqmGjK+th1TfnlkNOnVQ+twqUWWEmQyLDp3D/7+CZIgJ
         YvWfTu0WncvQfsd2cr0cIukRGdE6YKrQPoi+Ao1ezs0xD1P9lmktUGW/neCmZt5C/F7d
         yxeZ0YQlDwv3GXiP+MW2GrMkLIjte/vAHabMVeIgMe5RBXKSSvFIE+V/oA401dG77vjF
         e09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721472148; x=1722076948;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yvVRqveKCbnKGjsii996Z+A1wxik6ho1ZN1Ar+GN1jU=;
        b=XcprIQWWyNvK3pV67DOste9KghYvvSgFmSfv9c0YYjmhrWc154CqXf8CLsmRv0wktu
         CqYcQvDRxP3etigqr+YzXk+20EaAN1zd95pxoC5w3PUJEIv7Ly/XZjvmAef5kpFJvHXF
         e1k7xtPpT2dhLcreOK4JLLbca2eYf294S2oWYx0lj9ztrH5a43JNStII4pm6xapWWD6j
         IAXzTpXlxGFpPdvcZ5vC1/fb1G74oCBIx086TPPAgxNJejLl9m6eftZCuPt4i9MKlyTE
         cHpPEGF5SiJfe+vK6bAOS/Zx73LyJmpPlZCVBocop48DES9he0/eQVAyAtcSbZzBhlxH
         lczw==
X-Forwarded-Encrypted: i=1; AJvYcCW97AjhZs2W3X/qUoz8QULd9cq+Xwnceyg6dZLe88VTq+Q7uZx4+Foekvl2TRAW4uwolyavGtXqeFR4utVohb+Y35hKow/N3VOiomWKyg==
X-Gm-Message-State: AOJu0YzLZGTu3iz+0ZSTGS36R7xzKt/g6nntRmgKULsFar+QglWkou3p
	mL3h9wHRoG/2XniNfSFML+VheEiggrZdWqtOfScTt5+D0KWp5XtB
X-Google-Smtp-Source: AGHT+IFtjw6W19sDZIGkdGb3I2QzTdMrxKBtLKtuA6pZllYy+sAObBJu8M1Kqk6cGFm7GvJaZE7/IQ==
X-Received: by 2002:a05:600c:4ec7:b0:426:6f15:2e4d with SMTP id 5b1f17b1804b1-427dc51cecbmr7415135e9.9.1721472148099;
        Sat, 20 Jul 2024 03:42:28 -0700 (PDT)
Received: from f (cst-prg-77-238.cust.vodafone.cz. [46.135.77.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d6906c77sm52947855e9.23.2024.07.20.03.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jul 2024 03:42:27 -0700 (PDT)
Date: Sat, 20 Jul 2024 12:42:15 +0200
From: Mateusz Guzik <mjguzik@gmail.com>
To: Zhihao Cheng <chengzhihao@huaweicloud.com>
Cc: Jan Kara <jack@suse.cz>, Theodore Ts'o <tytso@mit.edu>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-ext4@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Christoph Hellwig <hch@infradead.org>, linux-mtd <linux-mtd@lists.infradead.org>, 
	Richard Weinberger <richard@nod.at>, "zhangyi (F)" <yi.zhang@huawei.com>, 
	yangerkun <yangerkun@huawei.com>, "wangzhaolong (A)" <wangzhaolong1@huawei.com>
Subject: Re: [BUG REPORT] potential deadlock in inode evicting under the
 inode lru traversing context on ext4 and ubifs
Message-ID: <yakewaqynmapatlh3s45huq6dutkkkcdj26tqpfx6yllsjmyie@rh6xthl5pwkb>
References: <37c29c42-7685-d1f0-067d-63582ffac405@huaweicloud.com>
 <20240712143708.GA151742@mit.edu>
 <20240718134031.sxnwwzzj54jxl3e5@quack3>
 <0b0a7b95-f6d0-a56e-5492-b48882d9a35d@huaweicloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0b0a7b95-f6d0-a56e-5492-b48882d9a35d@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240720_034230_314917_A7BA698A 
X-CRM114-Status: GOOD (  24.89  )
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

T24gRnJpLCBKdWwgMTksIDIwMjQgYXQgMTE6MjE6NTFBTSArMDgwMCwgWmhpaGFvIENoZW5nIHdy
b3RlOgo+IOWcqCAyMDI0LzcvMTggMjE6NDAsIEphbiBLYXJhIOWGmemBkzoKPiA+IEknbSBwb25k
ZXJpbmcgYWJvdXQgdGhlIGJlc3Qgd2F5IHRvIGZpeCB0aGlzLiBNYXliZSB3ZSBjb3VsZCBoYW5k
bGUgdGhlCj4gPiBuZWVkIGZvciBpbm9kZSBwaW5uaW5nIGluIGlub2RlX2xydV9pc29sYXRlKCkg
aW4gYSBzaW1pbGFyIHdheSBhcyBpbgo+ID4gd3JpdGViYWNrIGNvZGUgc28gdGhhdCBsYXN0IGlw
dXQoKSBjYW5ub3QgaGFwcGVuIGZyb20gaW5vZGVfbHJ1X2lzb2xhdGUoKS4KPiA+IEluIHdyaXRl
YmFjayB3ZSB1c2UgSV9TWU5DIGZsYWcgdG8gcGluIHRoZSBpbm9kZSBhbmQgZXZpY3QoKSB3YWl0
cyBmb3IgdGhpcwo+ID4gZmxhZyB0byBjbGVhci4gSSdsbCBwcm9iYWJseSBzbGVlcCB0byBpdCBh
bmQgaWYgSSB3b24ndCBmaW5kIGl0IHRvbwo+ID4gZGlzZ3VzdGluZyB0byBsaXZlIHRvbW9ycm93
LCBJIGNhbiBjb2RlIGl0Lgo+ID4gCj4gCj4gSSBndWVzcyB0aGF0IHlvdSBtYXkgbW9kaWZ5IGxp
a2UgdGhpczoKPiBkaWZmIC0tZ2l0IGEvZnMvaW5vZGUuYyBiL2ZzL2lub2RlLmMKPiBpbmRleCBm
MzU2ZmUyZWMyYjYuLjViMWE5YjIzZjUzZiAxMDA2NDQKPiAtLS0gYS9mcy9pbm9kZS5jCj4gKysr
IGIvZnMvaW5vZGUuYwo+IEBAIC00NTcsNyArNDU3LDcgQEAgRVhQT1JUX1NZTUJPTChpaG9sZCk7
Cj4gCj4gIHN0YXRpYyB2b2lkIF9faW5vZGVfYWRkX2xydShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBi
b29sIHJvdGF0ZSkKPiAgewo+IC0gICAgICAgaWYgKGlub2RlLT5pX3N0YXRlICYgKElfRElSVFlf
QUxMIHwgSV9TWU5DIHwgSV9GUkVFSU5HIHwKPiBJX1dJTExfRlJFRSkpCj4gKyAgICAgICBpZiAo
aW5vZGUtPmlfc3RhdGUgJiAoSV9ESVJUWV9BTEwgfCBJX1NZTkMgfCBJX0ZSRUVJTkcgfCBJX1dJ
TExfRlJFRQo+IHwgSV9QSU5JTkcpKQo+ICAgICAgICAgICAgICAgICByZXR1cm47Cj4gICAgICAg
ICBpZiAoYXRvbWljX3JlYWQoJmlub2RlLT5pX2NvdW50KSkKPiAgICAgICAgICAgICAgICAgcmV0
dXJuOwo+IEBAIC04NDUsNyArODQ1LDcgQEAgc3RhdGljIGVudW0gbHJ1X3N0YXR1cyBpbm9kZV9s
cnVfaXNvbGF0ZShzdHJ1Y3QKPiBsaXN0X2hlYWQgKml0ZW0sCj4gICAgICAgICAgKiBiZSB1bmRl
ciBwcmVzc3VyZSBiZWZvcmUgdGhlIGNhY2hlIGluc2lkZSB0aGUgaGlnaG1lbSB6b25lLgo+ICAg
ICAgICAgICovCj4gICAgICAgICBpZiAoaW5vZGVfaGFzX2J1ZmZlcnMoaW5vZGUpIHx8ICFtYXBw
aW5nX2VtcHR5KCZpbm9kZS0+aV9kYXRhKSkgewo+IC0gICAgICAgICAgICAgICBfX2lnZXQoaW5v
ZGUpOwo+ICsgICAgICAgICAgICAgICBpbm9kZS0+aV9zdGF0ZSB8PSBJX1BJTklORzsKPiAgICAg
ICAgICAgICAgICAgc3Bpbl91bmxvY2soJmlub2RlLT5pX2xvY2spOwo+ICAgICAgICAgICAgICAg
ICBzcGluX3VubG9jayhscnVfbG9jayk7Cj4gICAgICAgICAgICAgICAgIGlmIChyZW1vdmVfaW5v
ZGVfYnVmZmVycyhpbm9kZSkpIHsKPiBAQCAtODU3LDcgKzg1NywxMCBAQCBzdGF0aWMgZW51bSBs
cnVfc3RhdHVzIGlub2RlX2xydV9pc29sYXRlKHN0cnVjdAo+IGxpc3RfaGVhZCAqaXRlbSwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fY291bnRfdm1fZXZlbnRzKFBHSU5PREVT
VEVBTCwgcmVhcCk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgbW1fYWNjb3VudF9yZWNsYWlt
ZWRfcGFnZXMocmVhcCk7Cj4gICAgICAgICAgICAgICAgIH0KPiAtICAgICAgICAgICAgICAgaXB1
dChpbm9kZSk7Cj4gKyAgICAgICAgICAgICAgIHNwaW5fbG9jaygmaW5vZGUtPmlfbG9jayk7Cj4g
KyAgICAgICAgICAgICAgIGlub2RlLT5pX3N0YXRlICY9IH5JX1BJTklORzsKPiArICAgICAgICAg
ICAgICAgd2FrZV91cF9iaXQoJmlub2RlLT5pX3N0YXRlLCBfX0lfUElOSU5HKTsKPiArICAgICAg
ICAgICAgICAgc3Bpbl91bmxvY2soJmlub2RlLT5pX2xvY2spOwo+ICAgICAgICAgICAgICAgICBz
cGluX2xvY2sobHJ1X2xvY2spOwo+ICAgICAgICAgICAgICAgICByZXR1cm4gTFJVX1JFVFJZOwo+
ICAgICAgICAgfQo+IEBAIC0xNzcyLDYgKzE3NzUsNyBAQCBzdGF0aWMgdm9pZCBpcHV0X2ZpbmFs
KHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4gICAgICAgICAgICAgICAgIHJldHVybjsKPiAgICAgICAg
IH0KPiAKPiArICAgICAgIGlub2RlX3dhaXRfZm9yX3BpbmluZyhpbm9kZSk7Cj4gICAgICAgICBz
dGF0ZSA9IGlub2RlLT5pX3N0YXRlOwo+ICAgICAgICAgaWYgKCFkcm9wKSB7Cj4gICAgICAgICAg
ICAgICAgIFdSSVRFX09OQ0UoaW5vZGUtPmlfc3RhdGUsIHN0YXRlIHwgSV9XSUxMX0ZSRUUpOwo+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2ZzLmggYi9pbmNsdWRlL2xpbnV4L2ZzLmgKPiBp
bmRleCBmZDM0YjU3NTVjMGIuLmRhZjA5NGZmZjVmZSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xp
bnV4L2ZzLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L2ZzLmgKPiBAQCAtMjQxNSw2ICsyNDE1LDgg
QEAgc3RhdGljIGlubGluZSB2b2lkIGtpb2NiX2Nsb25lKHN0cnVjdCBraW9jYiAqa2lvY2IsCj4g
c3RydWN0IGtpb2NiICpraW9jYl9zcmMsCj4gICNkZWZpbmUgSV9ET05UQ0FDSEUgICAgICAgICAg
ICAoMSA8PCAxNikKPiAgI2RlZmluZSBJX1NZTkNfUVVFVUVEICAgICAgICAgICgxIDw8IDE3KQo+
ICAjZGVmaW5lIElfUElOTklOR19ORVRGU19XQiAgICAgKDEgPDwgMTgpCj4gKyNkZWZpbmUgX19J
X1BJTklORyAgICAgICAgICAgICAxOQo+ICsjZGVmaW5lIElfUElOSU5HICAgICAgICAgICAgICAg
KDEgPDwgX19JX1BJTklORykKPiAKPiAgI2RlZmluZSBJX0RJUlRZX0lOT0RFIChJX0RJUlRZX1NZ
TkMgfCBJX0RJUlRZX0RBVEFTWU5DKQo+ICAjZGVmaW5lIElfRElSVFkgKElfRElSVFlfSU5PREUg
fCBJX0RJUlRZX1BBR0VTKQo+IAo+ICwgd2hpY2ggbWVhbnMgdGhhdCB3ZSB3aWxsIGltcG9ydCBh
IG5ldyBpbm9kZSBzdGF0ZSB0byBzb2x2ZSB0aGUgcHJvYmxlbS4KPiAKCk15IG5vbi1tYWludGFp
bmVyICQwLDAzIGlzIGFzIGZvbGxvd3M6CgoxLiBJX1BJTklORyBpcyB0b28gZ2VuZXJpYyBvZiBh
IG5hbWUuIElfTFJVX1BJTk5FRCBvciBzb21ldGhpbmcgZWxzZQppbmRpY2F0aW5nIHdoYXQgdGhp
cyBpcyBmb3Igd291bGQgYmUgcHJ1ZGVudAoyLiB3aGlsZSBub3Qgc3BlY2lmaWMgdG8gdGhpcyBw
YXRjaCwgdGhlIGhhbmRsaW5nIG9mIGlfc3RhdGUgaXMgdG9vCmFjY2lkZW50YWwtYnJlYWthZ2Ug
ZnJpZW5kbHkuIGEgZnVsbCBibG93biBzb2x1dGlvbiBpcyB3YXkgb3V0IG9mIHRoZQpzY29wZSBo
ZXJlLCBidXQgc29tZXRoaW5nIGNhbiBiZSBkb25lIHRvIGZ1dHVyZS1wcm9vZiB0aGlzIHdvcmsg
YW55d2F5LgoKVG8gdGhhdCBlbmQgSSB3b3VsZCBzdWdnZXN0OgoxLiBpbm9kZV9scnVfcGluKCkg
d2hpY2ggYXBwYXJ0IGZyb20gc2V0dGluZyB0aGUgZmxhZyBpbmNsdWRlczoKCUJVR19PTihpbm9k
ZS0+aV9zdGF0ZSAmIChJX0xSVV9QSU5ORUQgfCBJX0ZSRUVJTkcgfCBJX1dJTExfRlJFRSkKMi4g
aW5vZGVfbHJ1X3VucGluKCkgd2hpY2ggYXBhcnQgZnJvbSB1bnNldHRpbmcgdGhlIGZsYWcgKyB3
YWtldXAgaW5jbHVkZXM6CglCVUdfT04oIShpbm9kZS0+aV9zdGF0ZSAmIElfTFJVX1BJTk5FRCkp
CjMuIGlub2RlX2xydV93YWl0X2Zvcl9waW5uZWQoKSAKCkhvd2V2ZXIsIGEgbm9uLWNvc21ldGlj
IHJlbWFyayBpcyB0aGF0IGF0IHRoZSBzcG90IGlub2RlX3dhaXRfZm9yX3BpbmluZwpnZXRzIGlu
dm9rZWQgbm9uZSBvZiB0aGUgb2YgdGhlIHBpbm5pbmctYmxvY2tpbmcgZmxhZ3MgbWF5IGJlIHNl
dCAodG8gbXkKcmVhZGluZyBhbnl3YXkpLiBUaGlzIGlzIG5vdCB0aGUgZW5kIG9mIHRoZSB3b3Js
ZCwgYnV0IGl0IGRvZXMgbWVhbiB0aGUKd2FpdGluZyByb3V0aW5lIHdpbGwgaGF2ZSB0byBjaGVj
ayBzdHVmZiBpbiBhIGxvb3AuCgpOYW1lcyBhcmUgbm90IHRoYXQgaW1wb3J0YW50LCB0aGUga2V5
IGlzIHRvIGtlZXAgdGhlIGxvZ2ljIGFuZApkZXBlbmRlbmNpZXMgY2xvc2UgYnkgY29kZS13aXNl
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
