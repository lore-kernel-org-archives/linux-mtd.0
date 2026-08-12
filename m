Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76875C5B572
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2026 15:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Piu1fEfSylXhsadAWzbKomfBbAww8B5izQGfYugcABs=; b=UzrKH5Q0Qn8GIg
	Fsq2PVQOeJFJKOcQW3uZfw+a1Nm6QJjj9zQGembAwE1ey/4E2YFjjZLvicqy0LGCnHmYqslZAj/Qb
	QdW7kvGDU54x2yuRfrG3gZhCuo3PALHCjPS8K9oh6JsigEj++pCFKi6F7ID7Oo43rmvSYEgVgkgIv
	1YuzgeQkp7ssCRDs+9tL56ON3DBmul85kotzSTcaymdEG9mNkpVbCvjQcNSDxJpPuZ0F7ABE3QYVm
	69AatmBGbpWy4J6CnXAjGwhelZNKl5op+UH2G8iLl+uM9EIZRab1+y6k/R/2Kc2XeBJYyQd/mKg+q
	qARxCFuX1JxBjRQ7L0yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuAyP-0000000GTMF-1Ash;
	Wed, 12 Aug 2026 15:34:33 +0000
Received: from p-east2-cluster5-host8-snip6-8.eps.apple.com ([2a01:b747:3001:202::51] helo=outbound.st.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuAxz-0000000GTIL-1wRS
	for linux-mtd@lists.infradead.org;
	Wed, 12 Aug 2026 15:34:31 +0000
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-1 (Postfix) with ESMTPS id 297BE18035EA;
	Wed, 12 Aug 2026 15:34:05 +0000 (UTC)
X-ICL-RepId: 019ff69b-fa5e-7ba0-8d4c-0069eb8ee41e
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhPC0MFWQteCE0dXAZZEhVdRVUCWQBbA1Q4Wg5bBEcUFxtcABcNVk1QG18CQg8cE1YVEx9UVgBQUR1fAgoERwRbF0YDU0VBBBcRUAFYHlZeWhdeTUcfQE1iSQFaGVscQBdKbk1TDw8ZWhRcGFNFUR9UWF4EU1YORwBABi8GLXRdDjpxLBpfCkAOVQpbBFkfQww7clgOKgtEDU5wLV4IXh9MHB0OWAYMUE0BQwgKAlEcVg1X
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1786548846; x=1789140846; bh=EHaTshTmZ+5qJSrZAbFoAjX8w8xVIEZ61ZSN/q7h5Mk=; h=Content-Type:Mime-Version:Subject:From:X-Icloud-Hme:Date:Message-Id:To:x-icloud-hme; b=QpI/7IsMrDOCLVZCp53EXUZliI5Q9ULPQDQtGxDXE2d89hXNUudtDUAPz00AY+OlcnTU2bLkMoJJ4zYqU+8+yaycyii/NAsxZOztcH5nwGfxr6n5evjoETgeyeItejT264GMin+NbjnhVqAHKmjXHiIKl5F5uGCLcfDWcQ/9sk3ruJpInURYn+Wznhf8ZgQcsa4IRuXdw9n7ITU//goAEajvqLYl9CYNlVFYtSBqtssJu5FJ9VsJiLDtPI/SS+cOcFd/0VzIMI87ItsWVzmSK7kmdHikbKbZdaoM5lGKYTh9S8w4NDbCT+TnZTXIgzih3La1MX+95FMRU0Tmjf26Lg==
Received: from smtpclient.apple (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-1 (Postfix) with ESMTPSA id 2E3551804174;
	Wed, 12 Aug 2026 15:18:49 +0000 (UTC)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH] mtd: spi-nor: xmc: add locking to XM25QH128A
From: fonkism@icloud.com
X-Icloud-Hme: p=stayer.opt1f@icloud.com; d=; f=fonkism@icloud.com;
 s=mwalle@kernel.org
In-Reply-To: <20260811064512.42520-1-mwalle@kernel.org>
Date: Wed, 12 Aug 2026 17:18:37 +0200
Cc: Hide My Email <stayer.opt1f@icloud.com>,
 linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <7985B1FF-7BBA-4807-9632-35CA59A9446C@icloud.com>
References: <20260811064512.42520-1-mwalle@kernel.org>
To: Michael Walle <mwalle_at_kernel_org_ygmm32c2ffrwda_ffnr3305@icloud.com>
X-Mailer: Apple Mail (2.3826.700.81.1.8)
X-Proofpoint-GUID: 9VsacqRrwxSFcO2LGJEjDclGdUFeTxAu
X-Proofpoint-ORIG-GUID: 9VsacqRrwxSFcO2LGJEjDclGdUFeTxAu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEyNyBTYWx0ZWRfX0BK7gm8tFmTQ
 VJCGeZzM7kKJcYeQMt0bH3ou+m12WE5W+uCQBgVc2Xp9zHPZoFHNPrQlNricBQVHdwFCbNh5YTD
 mUF2WYn3z5sGuAbZempqfNbIw0HHcG02d/seiVpHm6VMFDL2V+savQdGS8EpjUiCubofusQ/JQb
 I6vq/t3L7t4IGGs2hbJYvpPCFAROFoqr0hZUVpO8FUTa9tTW8mzc22k1o9AqbVk1cBfGioJnQWR
 3zAxs5Kn3g94drkKl8r1iWAVwvdRZNhhkirNK3FQDQBjhuT/QdjksuVwb3OWKIiYE8Y1QlZY8Ra
 15SZkSbEiinBk2ZtLIXagYPSFWMwO708gqJa3GeO2HAHPGhfGj8W7bsyax7tzI=
X-Authority-Info-Out: v=2.4 cv=f9xFxeyM c=1 sm=1 tr=0 ts=6a7c926d
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=x7bEGLp0ZPQA:10 a=p0_6MqLwIc0A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=v3ZZPjhaAAAA:8 a=CzSAnbtVbgJ7Mcn_LiUA:9 a=QEXdDO2ut3YA:10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_083407_966059_D69B0C22 
X-CRM114-Status: GOOD (  16.74  )
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

Cj4gT24gMTEgQXVnIDIwMjYsIGF0IDA4OjQ0LCBNaWNoYWVsIFdhbGxlIDxtd2FsbGVAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4gCj4gQWRkIHN1cHBvcnQgZm9yIGxvY2tpbmcgdG8gdGhlIFhNMjVRSDEy
OEEgcGFydC4KPiAKPiBSZXBvcnRlZC1ieTogVGFraW5vIDxzdGF5ZXIub3B0MWZAaWNsb3VkLmNv
bT4KPiBDbG9zZXM6IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9
MjIxODI1Cj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBXYWxsZSA8bXdhbGxlQGtlcm5lbC5vcmc+
CgpUZXN0ZWQtYnk6IFdlaSwgVGFraW5vIDxzdGF5ZXIub3B0MWZAaWNsb3VkLmNvbT4gIyBvbiBG
ZWRvcmEgNDQgLyA3LjEuNi0yMDEKClRlc3RlZCB0byB0aGUgbWF4IG9mIG15IGFiaWxpdGllcyBo
ZXJlOyB0aGUgZHJpdmVyIG5vIGxvbmdlciByZXR1cm5zIOKAnEVPUE5PVFNVUFDigJ0uCkl0IG5v
dyByZXR1cm5zIOKAnHVubG9ja2VkIiB3aGljaCBpcyB0ZWNobmljYWxseSBjb3JyZWN0IGFzIHRo
ZSBiaXRzIGFyZSBub3Qgc2V0LgpJbnRlbCBsb2NrcyBpdCB1c2luZyBhIGRpZmZlcmVudCBtZWNo
YW5pc20gYW5kIGNvdWxk4oCZdmUvc2hvdWxk4oCZdmUgYWxzbyBzZXQgdGhlIGJpdHMuClRoaXMg
bGlrZWx5IG5lZWRzIGEgQklPUyB1cGRhdGUgdG8gcHJvcGVybHkgZml4IGl0LiBXaGljaCBtYXkg
bmV2ZXIgaGFwcGVuLgoKUmVnYXJkcywKVGFraW5vLgoKPiAtLS0KPiBIaSBUYWtpbm8sCj4gCj4g
cGxlYXNlIHRlc3QgaXQgYW5kIHJlcGx5IHdpdGggYSAiVGVzdGVkLWJ5IiB0YWcuIFdpdGggeW91
ciBmdWxsIG5hbWUgaWYKPiB5b3UgbGlrZS4gSSBkaWRuJ3QgZ2V0IHRoYXQgZnJvbSB0aGUgYnVn
IHJlcG9ydC4KPiAtLS0KPiBkcml2ZXJzL210ZC9zcGktbm9yL3htYy5jIHwgMSArCj4gMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3Nw
aS1ub3IveG1jLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL3htYy5jCj4gaW5kZXggZDVhMDYwNTRi
MGRkLi5kM2I1MmViOTNlMmMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci94bWMu
Ywo+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IveG1jLmMKPiBAQCAtMTksNiArMTksNyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGZsYXNoX2luZm8geG1jX25vcl9wYXJ0c1tdID0gewo+IC5uYW1l
ID0gIlhNMjVRSDEyOEEiLAo+IC5zaXplID0gU1pfMTZNLAo+IC5ub19zZmRwX2ZsYWdzID0gU0VD
VF80SyB8IFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFEX1JFQUQsCj4gKyAuZmxhZ3Mg
PSBTUElfTk9SX0hBU19MT0NLIHwgU1BJX05PUl80QklUX0JQIHwgU1BJX05PUl9IQVNfVEIsCj4g
fSwKPiB9Owo+IAo+IC0tIAo+IDIuNDcuMwo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
