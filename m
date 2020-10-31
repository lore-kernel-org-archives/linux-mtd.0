Return-Path: <SRS0=Ys1R=EG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3AFDC388F7
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 21:14:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67EB0206E9
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 21:14:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oE1q43Gw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFztuJ6y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67EB0206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5VUs3KivGIQ9y8v6ADre4PPGMObn0GaCWFOmhaAswBE=; b=oE1q43GwG0NwHnhSc8Ce+L20c
	RXv0reuuV9JVVqygbNCJceynD/94oKhum/RZVW0hV3hFzyiPf9dBUsZP3eEczP1/e2bocoJfVMCQx
	XG3R0IPJUrQbieEJ0uav43NH84a3h7N9jDu7jEjTXUHIVtevfv97WsNSAc1OeNRbu+pxTjeX8Hjke
	DCHCQhZW8PSBziBQ62pgnFy+tERFnFnIXQN/MOLupHzjVHNsveWDekG1xWuJ/dtuavqvnDYtENRJO
	ENk0qXwQzQkmooeH+0UAo7eLFhHHIwvMHwLwaAWHucQRoL3iLmURJWpTQ6u1tEmK1TIyPd15BQLK1
	IikiUAIKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYyBo-0004Hf-Bo; Sat, 31 Oct 2020 21:13:32 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYyBk-0004GW-Tv
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2020 21:13:30 +0000
Received: by mail-qk1-x741.google.com with SMTP id x20so8290643qkn.1
 for <linux-mtd@lists.infradead.org>; Sat, 31 Oct 2020 14:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KZODEmvXyflv6SQKdmBGuZIGTDEH0YI52o0/uFD+i6M=;
 b=bFztuJ6y/haedJQw5hF/nF6VbGHZV7ZTnjVcNG7oCf7oFghBazkx6bAKOmRQr2nZ0k
 pxyCTssBMyZtOqJqIW4pQdEEEPS03fcbGqn8u3UezI7qTB7N/KRcy9VE7O+FXZLh9DDF
 /lMpUVi/7GYzAL+ap/+rMoI8+gOEP+TXYXojZHa1qJKDmHrjXBOWlzqtaVi3g03cpu3B
 WvtkeKgykpf86L9dLtTHygEHclwQK3/N5/r2fvjEfHGEVE+IcgIfPlyKYbDzRhIPv7af
 refKZp1p3v/VWKHF4YpTK25NmSNfs4Bic6fkFilMQFfBE/KyFTAi29kF6zhIL1QOqND9
 eJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KZODEmvXyflv6SQKdmBGuZIGTDEH0YI52o0/uFD+i6M=;
 b=UwKsIlteCRF03iEdM2yKNcpVujpeK+GmCFkMf8/BKk9BCMDT/rAhhmumMScOqmX6Gh
 NAI0u1vrS2Q91MSV37VQLgPPyN5hCyVn2slADYRnA3OknADovo+Ga2yC8P/YfzskVPzc
 og1aGByzWA9IRTF9B/KzLB4jZ5oGHBQyVrmKn5rZezFkcUGAu6Fbm/F74Jzo3H8Gfg3n
 6QIIp9LkjvOtt3VM6j0RrjKNi7aTBAmZILjxYGUpmjV27NfTZ1vO4MzdMyq45CEGzeoF
 EUz8Vwe5Z/0m8TAQyUs4LUGRyU+if2BPDqX3JhnZsux6wmyfwkjegD3hnEr0wOmc6/IF
 NKTg==
X-Gm-Message-State: AOAM532QanDF7sZET5hSqzIiQLgZ03jn8gJ5sY+1ddIVxyQFSYOsuJsq
 RiA6GcWPl5ZOeBy4SjZ4X8f+gSCwSegR/QFzTwM=
X-Google-Smtp-Source: ABdhPJyUC9i+NKGsq7Bn8TpUuFeIFGl325Ap8ciy9Tuc2ocVvLGPm0dOau+UrW0L3GepkgvlUq4gBBHL0skxpWbPDb4=
X-Received: by 2002:a37:4b4f:: with SMTP id y76mr8735825qka.108.1604178807385; 
 Sat, 31 Oct 2020 14:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200616071146.2607061-1-chengzhihao1@huawei.com>
 <f22055d4-47c8-d83d-f650-6fd82ce54a29@huawei.com>
In-Reply-To: <f22055d4-47c8-d83d-f650-6fd82ce54a29@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 31 Oct 2020 22:13:16 +0100
Message-ID: <CAFLxGvyi1hVLmQ3Q8+nGZT-wgHVjwBewmg4NdEQ=iX5svJsY2Q@mail.gmail.com>
Subject: Re: [PATCH RFC 0/5] ubifs: Prevent memory oob accessing while dumping
 node
To: Zhihao Cheng <chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201031_171329_015235_E83949DF 
X-CRM114-Status: GOOD (  22.40  )
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
Cc: Richard Weinberger <richard@nod.at>, "zhangyi \(F\)" <yi.zhang@huawei.com>,
 linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 liu.song11@zte.com.cn
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBPY3QgMTksIDIwMjAgYXQgNToxMyBBTSBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFv
MUBodWF3ZWkuY29tPiB3cm90ZToKPgo+IOWcqCAyMDIwLzYvMTYgMTU6MTEsIFpoaWhhbyBDaGVu
ZyDlhpnpgZM6Cj4gPiBXZSB1c2UgZnVuY3Rpb24gdWJpZnNfZHVtcF9ub2RlKCkgdG8gZHVtcCBi
YWQgbm9kZSBjYXVzZWQgYnkgc29tZQo+ID4gcmVhc29ucyAoU3VjaCBhcyBiaXQgZmxpcHBpbmcg
Y2F1c2VkIGJ5IGhhcmR3YXJlIGVycm9yLCB3cml0aW5nIGJ5cGFzcwo+ID4gdWJpZnMgb3IgdW5r
bm93biBidWdzIGluIHViaWZzKS4gVGhlIG5vZGUgY29udGVudCBjYW4gbm90IGJlIHRydXN0ZWQK
PiA+IGFueW1vcmUsIHNvIHdlIHNob3VsZCBwcmV2ZW50IG1lbW9yeSBvdXQtb2YtYm91bmRzIGFj
Y2Vzc2luZyB3aGlsZQo+ID4gZHVtcGluZyBub2RlIGluIGZvbGxvd2luZyBzaXR1YXRpb25zOgo+
ID4KPiA+IDEuIGJhZCBub2RlX2xlbjogRHVtcGluZyBkYXRhIGFjY29yZGluZyB0byAnY2gtPmxl
bicgd2hpY2ggbWF5IGV4Y2VlZAo+ID4gICAgIHRoZSBzaXplIG9mIG1lbW9yeSBhbGxvY2F0ZWQg
Zm9yIG5vZGUuCj4gPiAyLiBiYWQgbm9kZSBjb250ZW50OiBTb21lIGtpbmRzIG9mIG5vZGUgY2Fu
IHJlY29yZCBhZGRpdGlvbmFsIGRhdGEsIGVnLgo+ID4gICAgIGluZGV4IG5vZGUgYW5kIG9ycGhh
biBub2RlLCBtYWtlIHN1cmUgdGhlIHNpemUgb2YgYWRkaXRpb25hbCBkYXRhCj4gPiAgICAgbm90
IGJleW9uZCB0aGUgbm9kZSBsZW5ndGguCj4gPiAzLiBub2RlX3R5cGUgY2hhbmdlczogUmVhZCBk
YXRhIGFjY29yZGluZyB0byB0eXBlIEEsIGJ1dCBleHBlY3RlZCB0eXBlCj4gPiAgICAgQiwgYmVm
b3JlIHRoYXQsIG5vZGUgaXMgYWxsb2NhdGVkIGFjY29yZGluZyB0byB0eXBlIEIncyBzaXplLiBM
ZW5ndGgKPiA+ICAgICBvZiB0eXBlIEEgbm9kZSBpcyBncmVhdGVyIHRoYW4gdHlwZSBCIG5vZGUu
Cj4gPgo+ID4gQ29tbWl0IGFjYzVhZjNlZmEzMDNkNWYzICgidWJpZnM6IEZpeCBvdXQtb2YtYm91
bmRzIG1lbW9yeSBhY2Nlc3MgY2F1c2VkCj4gPiBieSBhYm5vcm1hbCB2YWx1ZSBvZiBub2RlX2xl
biIpIGhhbmRsZXMgc2l0dWF0aW9uIDEgZm9yIGRhdGEgbm9kZSBvbmx5LAo+ID4gaXQgd291bGQg
YmUgYmV0dGVyIGlmIHdlIGNhbiBzb2x2ZSBwcm9ibGVtcyBpbiBhYm92ZSBzaXR1YXRpb25zIGZv
ciBhbGwKPiA+IGtpbmRzIG9mIG5vZGVzLgo+ID4KPiA+IFBhdGNoIDEgYWRkcyBhIG5ldyBwYXJh
bWV0ZXIgJ25vZGVfbGVuJyhzaXplIG9mIG1lbW9yeSB3aGljaCBpcyBhbGxvY2F0ZWQKPiA+IGZv
ciB0aGUgbm9kZSkgaW4gZnVuY3Rpb24gdWJpZnNfZHVtcF9ub2RlKCksIHNhZmUgZHVtcGluZyBs
ZW5ndGggb2YgdGhlCj4gPiBub2RlIHNob3VsZCBiZTogbWluaW11bShjaC0+bGVuLCBjLT5yYW5n
ZXNbbm9kZV90eXBlXS5tYXhfbGVuLCBub2RlX2xlbikuCj4gPiBCZXNpZGVzLCBjLT5yYW5nZXNb
bm9kZV90eXBlXS5taW5fbGVuIGNhbiBub3QgZ3JlYXRlciB0aGFuIHNhZmUgZHVtcGluZwo+ID4g
bGVuZ3RoLCB3aGljaCBtYXkgY2F1c2VkIGJ5IG5vZGVfdHlwZSBjaGFuZ2VzKHNpdHVhdGlvbiAz
KS4KPiA+Cj4gPiBQYXRjaCAyIHJldmVydHMgY29tbWl0IGFjYzVhZjNlZmEzMDNkNWYgKCJ1Ymlm
czogRml4IG91dC1vZi1ib3VuZHMgbWVtb3J5Cj4gPiBhY2Nlc3MgY2F1c2VkIGJ5IGFibm9ybWFs
IHZhbHVlIG9mIG5vZGVfbGVuIikgdG8gcHJlcGFyZSBmb3IgcGF0Y2ggMy4KPiA+Cj4gPiBQYXRj
aCAzIHJlcGxhY2VzIG1vZGlmaWVkIGZ1bmN0aW9uIHViaWZzX2R1bXBfbm9kZSgpIGluIGFsbCBu
b2RlIGR1bXBpbmcKPiA+IHBsYWNlcyBleGNlcHQgZm9yIHViaWZzX2R1bXBfc2xlYigpLgo+ID4K
PiA+IFBhdGNoIDQgcmVtb3ZlcyB1bnVzZWQgZnVuY3Rpb24gdWJpZnNfZHVtcF9zbGViKCksCj4g
Pgo+ID4gUGF0Y2ggNSBhbGxvd3MgdWJpZnNfZHVtcF9ub2RlKCkgdG8gZHVtcCBhbGwgYnJhbmNo
ZXMgb2YgdGhlIGluZGV4IG5vZGUuCj4gPgo+ID4gU29tZSB0ZXN0cyBhZnRlciBwYXRjaHNldCBh
cHBsaWVkOgo+ID4gaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0y
MDgyMDMKPiA+Cj4gPiBaaGloYW8gQ2hlbmcgKDUpOgo+ID4gICAgdWJpZnM6IExpbWl0IGR1bXBp
bmcgbGVuZ3RoIGJ5IHNpemUgb2YgbWVtb3J5IHdoaWNoIGlzIGFsbG9jYXRlZCBmb3IKPiA+ICAg
ICAgdGhlIG5vZGUKPiA+ICAgIFJldmVydCAidWJpZnM6IEZpeCBvdXQtb2YtYm91bmRzIG1lbW9y
eSBhY2Nlc3MgY2F1c2VkIGJ5IGFibm9ybWFsCj4gPiAgICAgIHZhbHVlIG9mIG5vZGVfbGVuIgo+
ID4gICAgdWJpZnM6IFBhc3Mgbm9kZSBsZW5ndGggaW4gYWxsIG5vZGUgZHVtcGluZyBjYWxsZXJz
Cj4gPiAgICB1YmlmczogdWJpZnNfZHVtcF9zbGViOiBSZW1vdmUgdW51c2VkIGZ1bmN0aW9uCj4g
PiAgICB1YmlmczogdWJpZnNfZHVtcF9ub2RlOiBEdW1wIGFsbCBicmFuY2hlcyBvZiB0aGUgaW5k
ZXggbm9kZQo+ID4KPiA+ICAgZnMvdWJpZnMvY29tbWl0LmMgICB8ICAgNCArLQo+ID4gICBmcy91
Ymlmcy9kZWJ1Zy5jICAgIHwgMTExICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLS0tCj4gPiAgIGZzL3ViaWZzL2RlYnVnLmggICAgfCAgIDUgKy0KPiA+ICAgZnMvdWJp
ZnMvZmlsZS5jICAgICB8ICAgMiArLQo+ID4gICBmcy91Ymlmcy9pby5jICAgICAgIHwgIDM3ICsr
KysrLS0tLS0tLS0tLQo+ID4gICBmcy91Ymlmcy9qb3VybmFsLmMgIHwgICAzICstCj4gPiAgIGZz
L3ViaWZzL21hc3Rlci5jICAgfCAgIDQgKy0KPiA+ICAgZnMvdWJpZnMvb3JwaGFuLmMgICB8ICAg
NiArKy0KPiA+ICAgZnMvdWJpZnMvcmVjb3ZlcnkuYyB8ICAgNiArLS0KPiA+ICAgZnMvdWJpZnMv
cmVwbGF5LmMgICB8ICAgNCArLQo+ID4gICBmcy91Ymlmcy9zYi5jICAgICAgIHwgICAyICstCj4g
PiAgIGZzL3ViaWZzL3NjYW4uYyAgICAgfCAgIDQgKy0KPiA+ICAgZnMvdWJpZnMvc3VwZXIuYyAg
ICB8ICAgMiArLQo+ID4gICBmcy91Ymlmcy90bmMuYyAgICAgIHwgICA4ICsrLS0KPiA+ICAgZnMv
dWJpZnMvdG5jX21pc2MuYyB8ICAgNCArLQo+ID4gICBmcy91Ymlmcy91Ymlmcy5oICAgIHwgICA0
ICstCj4gPiAgIDE2IGZpbGVzIGNoYW5nZWQsIDEwOCBpbnNlcnRpb25zKCspLCA5OCBkZWxldGlv
bnMoLSkKPiA+Cj4gcGluZywgYWx0aG91Z2ggaXQgaXMgbm90IGEgc2VyaW91cyBwcm9ibGVtIGZv
ciB1YmlmcywgYnV0IGR1bXBpbmcgZXh0cmEKPiBtZW1vcnkgYnkgZm9ybWF0aW5nIHNwZWNpZmll
ZCB1YmlmcyBpbWcgbWF5IGNhdXNlIHNlY3VyaXR5IHByb2JsZW0uCgpUaGFua3MgZm9yIHJlbWlu
ZGluZyBtZSwgeWVzIHRoaXMgbmVlZHMgZml4aW5nLgpJJ2xsIGdpdmUgaXQgYSB0cnkgYW5kIHRo
ZW4gYXBwbHkgaXQgZm9yIG5leHQuCgotLSAKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
