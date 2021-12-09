Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEA1C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Dec 2021 20:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:In-Reply-To:
	Message-ID:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=CpFPBX4slDpvPKDGav4vAotVHFY1HCNgGISubpwxJIA=; b=2m1
	lGDEuCz1bA+HtAUTqV8u/YKZovIaRMOfUFzwZfBkR8/dsUv5dB9FNm4L2KmBOTlgJDrV8BkIk65h+
	31dZKMAAuIDuMPS3nhBPjeqM1P/g6cVUI2P+UsGPSJLOdrqSipyJHVdWgELcmIiYV3YxjbbQDUTrV
	cU6or7+SJAxRwnWWzDq30C7O3YVukkDe8MxeyEyOsfh3cnMscdaD+nx+063gzQrgSkF6f+R5Qq7Xf
	ZaBCihfINVWGnRy/FSTsDZ1ol5Yr7Tn+EmlR2EHLyvzijg/Inj000/UuRJmA6kFXS/q8p8g5Ew1Hp
	8cckRHbSez6KsfZD4XaS3LsBqFouBPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvPqj-00HSUm-NO; Thu, 09 Dec 2021 20:17:05 +0000
Received: from smtp5-g21.free.fr ([212.27.42.5])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvPqg-00HSU4-Bh
 for linux-mtd@lists.infradead.org; Thu, 09 Dec 2021 20:17:04 +0000
Received: from zimbra59-e10.priv.proxad.net (unknown [172.20.243.209])
 by smtp5-g21.free.fr (Postfix) with ESMTP id ADDBC5FFA5;
 Thu,  9 Dec 2021 21:17:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639081020;
 bh=Y9KdoqT3sRq9oz1363ZA2T5mkswclZ8YJCMiiraADuw=;
 h=Date:From:To:Cc:In-Reply-To:Subject:From;
 b=bwrjckVrt7ijk4idwi1nsiOUmrS0dTJR1Qlm+R+MKCLQE5MZ7PQXGollLw9r+I0Ji
 tYjis/AAt7/xQ+jgO3KYUaCJzgMG8q/81ZR2YpSpW8z3m9aB8KeKnYsWUdWTb8p2Av
 RUtGlSY6Wrp7tXyHzPkMdPEXhQtZNyDpQSIQHRX1wJhcg6+OxVssnJUbLufbSQOHh/
 BMaFbQM7EK1pisgoTK/gAwJ4dKs1Pqiln+CaKo/n2BBU+JSqzNgbpNZLuOo7NBQpWU
 LD85GXMKScJx8KQ5ViMSKruW9jcJ3EyMU3L/u2qH4I+YclvS8LxznuyjtPTC6NijcG
 P7prkM7cj5JYA==
Date: Thu, 9 Dec 2021 21:17:00 +0100 (CET)
From: valentio@free.fr
To: =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: OpenWrt Development List <openwrt-devel@lists.openwrt.org>, 
 MTD Maling List <linux-mtd@lists.infradead.org>
Message-ID: <740398666.171888898.1639081020251.JavaMail.root@zimbra59-e10.priv.proxad.net>
In-Reply-To: <CACna6rwRtP-_SoAZVV0ZjFAcWQucRWVoZ0bxSZrFtDFW2McyYw@mail.gmail.com>
Subject: Re: Identifying UBI volume instance / storing UBI volume metadata
MIME-Version: 1.0
X-Originating-IP: [81.14.22.69]
X-Mailer: Zimbra 7.2.0-GA2598 (ZimbraWebClient - GC79 (Linux)/7.2.0-GA2598)
X-Authenticated-User: valentio@free.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_121702_576417_4D19CB76 
X-CRM114-Status: GOOD (  23.32  )
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

SGVsbG8gUmFmYcWCLAoKSG93IGFib3V0IHN0b3JpbmcgdGhlIHNxdWFzaGZzIGludG8gdGhlIHJv
b3RmcyB1Ymkgdm9sdW1lIChhcyBhIGJhcmUgZmlsZSksIHN0YXJ0IHdpdGggYW4gaW5pdHJhbWZz
IGFwcGVuZGVkIHRvIHRoZSBrZXJuZWwgYW5kIG1vdW50IHRoZSByb290IGZpbGUgd2l0aCBsb29w
YmFjayBibG9jayBkZXYuIFRoZSBSVyBvdmVybGF5IHBhcnQgd291bGQgYmUgc3RvcmVkIGRpcmVj
dGx5IGluIHRoZSB1Ymlmcy4gKEFsbCBtb2RpZmljYXRpb25zIHRvIHRoZSByb290IGltYWdlIGZp
bGUgd291bGQgZ28gaW4gdGhlIG92ZXJsYXksIHNvIGltcG9zc2libGUgdG8gYnJlYWsgdGhlIGlt
YWdlKQoKVGhpcyB3YXksIHdoZW4geW91IGZsYXNoIGEgbmV3IGZpcm13YXJlLCBldmVyeXRoaW5n
IGdldHMgd2lwZWQsIGFuZCB5b3UgY2FuIGZhY3RvcnkgcmVzZXQgYnkgcm0gdGhlIFJXIGRpcmVj
dG9yeS4KCkl0IGRpdmVyZ2VzIHF1aXRlIGEgYml0IGZyb20gT3BlbldSVCB1c3VhbCB3YXkgdGhv
dWdoLgoKUmVnYXJkcywKCi0tCk9saXZpZXIKCi0tLS0tIE1haWwgb3JpZ2luYWwgLS0tLS0KPiBE
ZTogIlJhZmHFgiBNacWCZWNraSIgPHphamVjNUBnbWFpbC5jb20+Cj4gw4A6ICJNVEQgTWFsaW5n
IExpc3QiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4KPiBDYzogIk9wZW5XcnQgRGV2
ZWxvcG1lbnQgTGlzdCIgPG9wZW53cnQtZGV2ZWxAbGlzdHMub3BlbndydC5vcmc+Cj4gRW52b3nD
qTogSmV1ZGkgOSBEw6ljZW1icmUgMjAyMSAxNDoyMjozMAo+IE9iamV0OiBJZGVudGlmeWluZyBV
Qkkgdm9sdW1lIGluc3RhbmNlIC8gc3RvcmluZyBVQkkgdm9sdW1lIG1ldGFkYXRhCj4gCj4gSGks
Cj4gCj4gSSdtIExpbnV4IGRldmVsb3BlciBpbnZvbHZlZCBpbiBPcGVuV3J0ICYgYnVpbGRyb290
IHByb2plY3RzLiBJIHdvcmsKPiBvbiBidWlsZGluZyBmaXJtd2FyZSBpbWFnZXMgZm9yIGhvbWUg
cm91dGVycyBidXQgSSBuZWVkIHRvIHdvcmsgd2l0aAo+IGV4aXN0aW5nIGRlc2lnbnMuIEkgZG9u
J3Qgd29yayBmb3IgQnJvYWRjb20gKG9yIGFueSBvdGhlcgo+IG1hbnVmYWN0dXJlcikgYW5kIHNv
IEkgY2FuJ3QgY2hhbmdlIGhvdyBmaXJtd2FyZSBpbWFnZXMgYXJlIGhhbmRsZWQKPiBieQo+IG9y
aWdpbmFsIHNvZnR3YXJlLgo+IAo+IEknbSBkZWFsaW5nIHJpZ2h0IG5vdyB3aXRoIEJDTTQ5MDgg
cGxhdGZvcm0gdGhhdCB1c2VzIFVCSSBhbmQgSSBuZWVkCj4gc29tZSBoZWxwLgo+IAo+IEJ5IEJy
b2FkY29tJ3MgZGVzaWduIEJDTTQ5MDggdXNlcyB0d28gcmVsZXZhbnQgVUJJIHZvbHVtZXM6Cj4g
MS4gYm9vdGZzCj4gMi4gcm9vdGZzCj4gCj4gRXZlcnkgZmlybXdhcmUgZmlsZSAoYWNjZXB0ZWQg
YnkgYm9vdGxvYWRlciAmIG9yaWdpbmFsIGZpcm13YXJlIFVJKQo+IGNvbnRhaW5zIHR3byBpbWFn
ZXM6IGJvb3RmcyAod2l0aCBrZXJuZWwgJiBEVEJzKSBhbmQgcm9vdGZzLiBGbGFzaGluZwo+IGZp
cm13YXJlICh0aHJvdWdoIGJvb3Rsb2FkZXIgb2Ygb3JpZ2luYWwgVUkpIGlzIGEgcHJvY2VzcyBv
ZiBzaW1wbHkKPiB3cml0aW5nIGZpcm13YXJlLWNvbnRhaW5lZCAiYm9vdGZzIiBhbmQgInJvb3Rm
cyIgaW1hZ2VzIHRvCj4gY29ycmVzcG9uZGluZyBVQkkgdm9sdW1lcy4KPiAKPiAKPiBNeSBwcm9i
bGVtIGlzIG1ha2luZyBPcGVuV3J0J3MgZGVzaWduIGZpdCB0aGF0IEJDTTQ5MDggY2FzZS4gT3Bl
bldydAo+IHVzZXMgdHdvICpyb290ZnMqIHZvbHVtZXM6Cj4gMS4gcm9vdGZzOiBzcXVhc2hmcyBS
Two+IDIuIG92ZXJsYXk6IHViaWZzIG92ZXJsYXkKPiAKPiBBcyB5b3UgY2FuIHNlZSAib3Zlcmxh
eSIgbmVlZHMgdG8gYmUgY3JlYXRlZCBieSBPcGVuV3J0J3MgdXNlciBzcGFjZS4KPiBJdCBjYW4n
dCBiZSBwYXJ0IG9mIGZsYXNoZWQgZmlybXdhcmUgZmlsZS4KPiAKPiBNeSBwcm9ibGVtIGlzIC9s
aW5raW5nLyAib3ZlcmxheSIgd2l0aCBjdXJyZW50bHkgcnVubmluZyBmaXJtd2FyZS4KPiBMZXQK
PiBtIGV4cGxhaW46Cj4gV2hlbmV2ZXIgYSBuZXcgZmxhc2hpbmcgaGFwcGVucyB0aGUgT0xEICJv
dmVybGF5IiBuZWVkcyB0byBiZQo+IHJlY29nbml6ZWQgYW5kIHdpcGVkLgo+IEl0J3MgcmVxdWly
ZWQgdG8gbWFrZSBzdXJlIG5ld2x5IGZsYXNoZWQgZmlybXdhcmUgZG9lc24ndCB1c2Ugbm9uLW93
bgo+IGRhdGEuCj4gCj4gCj4gTXkgaWRlYXMgSSBoYXZlIGZvciBzb2x2aW5nIHRoYXQ6Cj4gCj4g
MS4gR2V0dGluZyAiYm9vdGZzIiAvICJyb290ZnMiIHZvbHVtZSBwZXItZmxhc2hpbmcgdW5pcXVl
IG51bWJlciBhbmQKPiB3cml0aW5nIGl0IGluICJvdmVybGF5IiB1Ymlmcy4gVGhlbiB3aXBlICJv
dmVybGF5IiBvbiBtaXNtYXRjaC4KPiBVbmZvcnR1bmF0ZWx5IEkgY2FuJ3Qgc2VlIGFueXRoaW5n
IGZsYXNoaW5nLXNwZWNpZmljIG51bWJlciBpbiBVQkkKPiB2b2x1bWUgaGVhZGVyLgo+IEltYWdl
IHNlcXVlbmNlIGRvZXMgbmV2ZXIgY2hhbmdlIGluIG15IGNhc2UgYXMgVUJJIGRvZXNuJ3QgZ2V0
Cj4gcmVmb3JtYXR0ZWQuCj4gSSdtIG5vdCBzdXJlIGlmIHNxbnVtIGlzIHVuaXF1ZSBidXQgaXQg
c2VlbXMgaXQgY2FuIGNoYW5nZSBhbnl3YXkKPiB3aGVuCj4gVUJJIG5lZWRzIHRvIGhhbmRsZSB3
aXRoIGZsYXNoIHdlYXJpbmcuCj4gCj4gMi4gR2VuZXJhdGluZyByYW5kb20gbnVtYmVyIGFuZCB3
cml0aW5nIGl0IGluIHNvbWUgbWV0YWRhdGEgb2YgUk8KPiAiYm9vdGZzIiBvciAicm9vdGZzIiBB
TkQgaW4gIm92ZXJsYXkiIHViaWZzLiBUaGVuIHdpcGUgIm92ZXJsYXkiIG9uCj4gbWlzbWF0Y2gu
Cj4gVGhhdCBJIHRoaW5rIHdvdWxkIHJlcXVpcmUgYWRkaW5nIGEgY3VzdG9tIGZpZWxkIGluIHRo
ZQo+ICJ1YmlfdnRibF9yZWNvcmQiIHN0cnVjdC4gSSdtIG5vdCBzdXJlIGlmIHVwc3RyZWFtIFVC
SSBjYW4gYmUKPiBleHRlbmRlZAo+IGxpa2UgdGhhdCBhbmQgSSBkb24ndCB3YW50IHN1Y2ggaGVh
dnkgZG93bnN0cmVhbSAoT3BlbldydCkgaGFja3MuCj4gCj4gCj4gQW55IGFkaXZjZXMsIHBsZWFz
ZT8KPiAKPiAtLQo+IFJhZmHFggo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gb3BlbndydC1kZXZlbCBtYWlsaW5nIGxpc3QKPiBvcGVud3J0LWRl
dmVsQGxpc3RzLm9wZW53cnQub3JnCj4gaHR0cHM6Ly9saXN0cy5vcGVud3J0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL29wZW53cnQtZGV2ZWwKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
