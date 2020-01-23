Return-Path: <SRS0=9DP4=3M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7124FC2D0DB
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jan 2020 17:21:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48B71214AF
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jan 2020 17:21:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KfDod5SC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pk8lMzDq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48B71214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UHKfraoeQRYo5WZxucT9chKnVeLlyQfNAPTqutRLXd0=; b=KfDod5SCWFl9pe
	xQAOFQOiEkjSmWVs8S8zt014IiGZWDlHTW2Gv3TN3B1fazeNwImLxS5PBuYXaaaYd82YZN7UdwJpJ
	Fj1e13g+nnPdQU33OQYkqK/raNT2gr/t+LdPd0eLftBE7R6OCyhXRnBsICxRG3Q4in7qQUsNz9yuK
	SPBRcnk30FRwRAHPhDQNFChHyP0At3g8IHVFdHkxFV8R07MuBaunRbrJ7DFm3d9vNzoZic0FTeGBe
	Zo1vICl9hkzzNbmA7aefgW1fUdwxBwPKkx+bkLP7Es6MwfHNDdKuotsblytACHEHN79PXzibcqNma
	XyszK4pZ5Wb3KaFIrmfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iugAG-00033D-Fg; Thu, 23 Jan 2020 17:21:08 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iugAE-00032c-2x
 for linux-mtd@lists.infradead.org; Thu, 23 Jan 2020 17:21:07 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00NHKsx4050826;
 Thu, 23 Jan 2020 11:20:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1579800054;
 bh=3gIbziJjyKajUTx1b0qn+STFFQnqmxy/nbpdeY5ApuY=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=pk8lMzDqe4modsPGk9srUr6q+8hDUKQT5SjYiaCK+0/NQpPnjLj0Bd1r8k0AWsd/d
 8ZeVQ+q5xnDJYth+qfR5BGJ6aaevQeUM+3dOvcUSMhXiPddNIrQNnwIy43HHrkqCCA
 /R/oj8fX843TXU2vHYwO6jdjCyj78JqxRT8f1yW8=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00NHKsC7018970
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 23 Jan 2020 11:20:54 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 23
 Jan 2020 11:20:54 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 23 Jan 2020 11:20:53 -0600
Received: from [10.250.133.86] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00NHKniV108940;
 Thu, 23 Jan 2020 11:20:50 -0600
Subject: Re: [PATCH v2] mtd: spi-nor: keep lock bits if they are non-volatile
To: Michael Walle <michael@walle.cc>
References: <20200103221229.7287-1-michael@walle.cc>
 <8187061.UfBqSTmf1g@192.168.0.113>
 <62b578b07d5eb46a015dafd4c2f45bc2@walle.cc>
 <5323055.WqobA3rpa8@192.168.0.113>
 <990b9b16-36e5-ce73-36c7-0ebfa391c26b@ti.com>
 <e64cc3ac32d2b44c9e6f4b4f795354ae@walle.cc>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <a4f3657b-8ebe-a54d-8a11-c6e4ce8a3561@ti.com>
Date: Thu, 23 Jan 2020 22:50:49 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <e64cc3ac32d2b44c9e6f4b4f795354ae@walle.cc>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200123_092106_232257_BFD7E72A 
X-CRM114-Status: GOOD (  24.39  )
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
Cc: marex@denx.de, Tudor.Ambarus@microchip.com, richard@nod.at,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAxLzIyLzIwMjAgNjoxNCBQTSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPiBIaSBWaWduZXNo
LAo+IAo+IEFtIDIwMjAtMDEtMjIgMTM6MTAsIHNjaHJpZWIgVmlnbmVzaCBSYWdoYXZlbmRyYToK
Pj4gT24gMjIvMDEvMjAgMTI6MjMgYW0sIFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbSB3cm90
ZToKPj4+IEhpLCBNaWNoYWVsLCBWaWduZXNoLAo+Pj4KPj4+IE9uIFN1bmRheSwgSmFudWFyeSAx
MiwgMjAyMCAxMjo1MDo1NyBBTSBFRVQgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4+PiBFWFRFUk5B
TCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlv
dQo+Pj4+IGtub3cgdGhlCj4+Pj4gY29udGVudCBpcyBzYWZlCj4+IFsuLi5dCj4+CgpbLi4uXQoK
Pj4+Pj4gUHJlZmVyZW5jZXMgb3Igc3VnZ2VzdGlvbnM/Cj4+Pj4KPj4+IEkgd291bGQgZ28gd2l0
aCAyLyBvciAzLy4gVmlnbmVzaCwgd2hhdCBkbyB5b3UgcHJlZmVyIGFuZCB3aHk/Cj4+Pgo+Pgo+
PiBJIGRvbnQgbGlrZSBvcHRpb24gMSwgYmVjYXVzZSBJIGFtIG5vdCBjb252aW5jZWQgdGhhdCB0
aGlzIGlzIGEgSFcKPj4gZGVzY3JpcHRpb24gdG8gYmUgcHV0IGluIERULsKgIElJVUMsIHByb2Js
ZW0gaXMgbW9yZSBvZiB3aGF0IHRvIGRvIHdpdGgKPj4gbG9ja2luZyBjb25maWd1cmF0aW9uIHRo
YXQgaXMgZG9uZSBiZWZvcmUgTGludXggY29tZXMgdXAoZWl0aGVyIGluCj4+IHByZXZpb3VzIGJv
b3Qgb3IgYnkgYm9vdGxvYWRlciBvciBQT1IgZGVmYXVsdCkuIEN1cnJlbnQgY29kZSBqdXN0Cj4+
IGRpc2NhcmRzIGl0IGFuZCB1bmxvY2tzIGVudGlyZSBmbGFzaC4KPiAKPiBCdXQgdGhpcyBpcyBu
b3QgdGhlIG1haW4gcHJvYmxlbS4gSXQgaXMgcmF0aGVyIHRoZSBpbnRlbnRpb24gb2YgdGhlCj4g
dXNlciB0byBhY3R1YWxseSB3YW50IHdyaXRlIHByb3RlY3QgdGhlIGZsYXNoIChmb3IgZmxhc2hl
cyB3aG8gaGFzCj4gcHJvcGVyIHN1cHBvcnQgZm9yIHRoZW0sIHRoYXQgaXMgdGhlIG9uZXMgd2hp
Y2ggaGF2ZSBub24tdm9sYXRpbGUKPiBiaXRzKS4KPiAKPiBGbGFzaGVzIHdpdGggdm9sYXRpbGUg
Yml0cyBhcmUgYW5vdGhlciBzdWJqZWN0LiBIZXJlIGl0IG1pZ2h0IGJlIHVzZWZ1bAo+IHRvIHVu
bG9jayB0aGVtIGVpdGhlciBhdCBwcm9iZSB0aW1lIG9yIHdoZW4gd2UgZmlyc3Qgd3JpdGUgdG8g
dGhlbSwgc28KPiB0aGUgdXNlciBkb2Vzbid0IG5lZWQgdG8ga25vdyBpZiBpdHMgdGhpcyBraW5k
IG9mIGZsYXNoIGFuZCBoZSB3b3VsZAo+IGFjdHVhbGx5IGhhdmUgdG8gdW5sb2NrIHRoZSBmbGFz
aCBiZWZvcmUgd3JpdGluZy4gSSd2ZSBsZWZ0IHRoZQo+IGJlaGF2aW91ciBmb3IgdGhlc2UgZmxh
c2hlcyBhcyBpdCB3YXMgYmVmb3JlLgo+IAo+IEFuZCB5ZXMsIHUtYm9vdCBzdWZmZXJzIGZyb20g
dGhlIHNhbWUgcHJvYmxlbSwgZWcuIGl0IHVubG9ja3MgdGhlIHdob2xlCj4gZmxhc2ggdG9vLiBJ
IGd1ZXNzIHRoZXkgaW5oZXJpdGVkIHRoZSBiZWhhdmlvdXIgZnJvbSBsaW51eC4gQnV0IEkKPiB3
YW50ZWQgdG8gc3RhcnQgd2l0aCBsaW51eCBmaXJzdC4KPiAKClUtQm9vdCBvbmx5IHVubG9ja3Mg
ZW50aXJlIGZsYXNoIGluIGNhc2Ugb2YgQXRtZWwgb3IgU1NUIG9yIEludGVsLgoKPj4gQnV0IHBy
b3Bvc2FsIGlzIG5vdCB0byB0b3VjaCB0aG9zZSBiaXRzIGF0IHByb2JlIHRpbWUgYW5kIGxlYXZl
IHRoaXMKPj4gdXB0byB1c2Vyc3BhY2UgdG8gaGFuZGxlLgo+IAo+IE5vLCBteSBwcm9wb3NhbCB3
YXMgdG8gZGl2aWRlIHRoZSBmbGFzaGVzIGludG8gdHdvIGNhdGVnb3JpZXMuIFRoZQo+IHVubG9j
a2luZyBpcyBvbmx5IGRvbmUgb24gdGhlIGZsYXNoZXMgd2hpY2ggaGF2ZSB2b2xhdGlsZSBsb2Nr
aW5nIGJpdHMsCj4gdGh1cyBldmVuIHdoZW4gdGhlIG5ldyBvcHRpb24gaXMgZW5hYmxlZCBpdCB3
b24ndCBicmVhayBhY2Nlc3MgdG8gdGhlc2UKPiBmbGFzaGVzLgo+IAoKSG1tLCBsb29rcyBsaWtl
IGJlZm9yZSBjb21taXQgM2UwOTMwZjEwOWU3ICgibXRkOiBzcGktbm9yOiBSZXdvcmsgdGhlCmRp
c2FibGluZyBvZiBibG9jayB3cml0ZSBwcm90ZWN0aW9uIikgZ2xvYmFsIHVubG9jayB3YXMgYmVp
bmcgZG9uZSBvbmx5CmZvciBBdG1lbCwgU1NUIGFuZCBJbnRlbCBmbGFzaGVzLiBTbyAzZTA5MzBm
MTA5ZTcgZGVmaW5pdGVseSBjaGFuZ2VzCnRoaXMgYmVoYXZpb3IgdG8gdW5sb2NrIGFsbCBmbGFz
aGVzIHRoYXQgaGF2ZSBTUElfTk9SX0hBU19MT0NLIHNldCAoaW4KYWRkaXRpb24gdG8gQXRtZWws
U1NUIGFuZCBJbnRlbCkuCkkgdGhpbmsgd2Ugc2hvdWxkIGp1c3QgcmV2ZXJ0IHRvIHRoZSBiZWhh
dmlvciBiZWZvcmUgM2UwOTMwZjEwOWU3IHNvIGFzCm5vdCB0byBicmVhayB1c2Vyc3BhY2UgZXhw
ZWN0YXRpb24gb2YgcHJlc2VydmluZyBub24gdm9sYXRpbGUgQlAgc2V0dGluZwphY3Jvc3MgYm9v
dHMKCkFyZSB3ZSBzdXJlIHRoZXJlIGFyZSBubyBBdG1lbCBhbmQgU1NUIGZsYXNoZXMgdGhhdCBo
YXZlIG5vbi12b2xhdGlsZSBCUApiaXRzPyBJZiBzbywgdGhlbiBJIGhhdmUgbm8gb2JqZWN0aW9u
IGZvciB0aGlzIHBhdGNoIGFzIHRoaXMgZWZmZWN0aXZlbHkKcmV2ZXJ0cyBiYWNrIHRvIGJlaGF2
aW9yIGJlZm9yZSAzZTA5MzBmMTA5ZTcuCgpSZWdhcmRzClZpZ25lc2gKCj4+IEFkZGluZyBhIEtj
b25maWcgZG9lcyBub3Qgc2NhbGUgd2VsbCBmb3IgbXVsdGktcGxhdGZvcm0gYnVpbGRzLiBUaGVy
ZQo+PiB3b3VsZCBub3QgYmUgYSB3YXkgdG8gaGF2ZSBwcm90ZWN0aW9uIGVuYWJsZWQgb24gb25l
IHBsYXRmb3JtIGJ1dAo+PiBkaXNhYmxlZCBvbiBvdGhlci4gRG9lcyBub3Qgc2NhbGUgZm9yIG11
bHRpcGxlIGZsYXNoZXMgZWl0aGVyCj4+Cj4+IE9wdGlvbiAzIHNvdW5kcyBsZWFzdCBiYWQgYW1v
bmcgYWxsLiBJZiBtb2R1bGUgcGFyYW0gY2FuIGJlIGRlc2lnbmVkIHRvCj4+IGJlIGEgc3RyaW5n
IHRoZW4sIHdlIGNvdWxkIGNvbnRyb2wgbG9ja2luZyBiZWhhdmlvciB0byBiZSBwZXIgZmxhc2gK
Pj4gdXNpbmcgZmxhc2ggbmFtZS4KPiAKPiBXaGF0IGFib3V0IGJvdGg/IEEga2NvbmZpZyBvcHRp
b24gd2hpY2ggZGVmaW5lcyB0aGUgZGVmYXVsdCBmb3IgdGhlCj4ga2VybmVsIHBhcmFtZXRlcj8g
TXkgZmVhciBpcyB0aGF0IG9uY2UgaXQgaXMgYSBrZXJuZWwgcGFyYW1ldGVyIGl0IGlzCj4gZWFz
eSB0byBmb3JnZXQgKHRodXMgaGF2aW5nIHRoZSBub24tdm9sYXRpbGUgYml0cywgdGhlIGZsYXNo
IGlzCj4gY29tcGxldGVseSB1bmxvY2tlZCBhZ2FpbikgYW5kIGl0IGlzIG5vdCB2ZXJ5IGhhbmR5
OyBmb3IgcHJvcGVyIHdyaXRlCj4gcHJvdGVjdGlvbiB5b3UnZCBhbHdheXMgaGF2ZSB0byBoYXZl
IHRoaXMgcGFyYW1ldGVyLgo+IAo+IGJ0dy4gSSBkb24ndCBzZWUgYSBuZWVkIHRvIGhhdmUgdGhp
cyBvcHRpb24gcGVyIGZsYXNoLCBiZWNhdXNlIG9uY2UKPiB0aGUgdXNlciBhY3R1YWxseSBlbmFi
bGVzIGl0LCBoZSBpcyBhd2FyZSB0aGF0IGl0cyBmb3IgYWxsIG9mIGhpcwo+IGZsYXNoZXMuIEkg
aGF2ZW4ndCBzZWVuIGZsYXNoZXMgd2hpY2ggaGFzIG5vbi12b2xhdGlsZSBwcm90ZWN0aW9uIGJp
dHMKPiBfYW5kXyBhcmUgcHJvdGVjdGVkIGJ5IGRlZmF1bHQuIFRoZXJlIHNob3VsZG4ndCBiZSBh
IG5vdGljYWJsZQo+IGRpZmZlcmVuY2UgZm9yIHRoZSB1c2VyIGlmIHRoZSBvcHRpb24gd2hlbiBl
bmFibGVkLgo+IAo+IC1taWNoYWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
