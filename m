Return-Path: <SRS0=LGak=CY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFABDC433E2
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2020 09:38:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E0E021974
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2020 09:38:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TIKGTsDS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="EKN7O9TA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E0E021974
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D22Cus7njautTSV3gjbgcIMBJ7tOiPF/MEikIX7elLc=; b=TIKGTsDSnS3NZ7ca38JZjU/7h
	0Kvizxie7CKH8gbabWUEFFwnh4Xk29zIkb/gT2lGMlWWF53e10DSba3DoR4ijgtJ2IxhVe/M0wQmf
	LM6odzJZgfG9o1dr0NdHfls/gvK7s3+5bus1mny9XMZMIVobt00Znj/20xS+0wqmaIXU8n7NdELgh
	5ULNNAOiGXpEMaUxncsog807Oe/M+15VDUytr8/V9wWVO4+ICxBPgDHsjhuhLQUxKPVYgintPC0vh
	tltexzbC1S5GaRcv6UomJ0F5OxFvNrX9WrIhiaWPMXXGdgWPeS58rYvDCzqJRKwdZFcAfM97uY+td
	74mRHiVBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI7PF-0000q2-Gb; Tue, 15 Sep 2020 09:37:45 +0000
Received: from de-out1.bosch-org.com ([139.15.230.186])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI7PB-0000p3-MP
 for linux-mtd@lists.infradead.org; Tue, 15 Sep 2020 09:37:43 +0000
Received: from fe0vm1650.rbesz01.com
 (lb41g3-ha-dmz-psi-sl1-mailout.fe.ssn.bosch.com [139.15.230.188])
 by si0vms0217.rbdmz01.com (Postfix) with ESMTPS id 4BrJ6q4BD4z4f3lwL;
 Tue, 15 Sep 2020 11:37:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
 s=key1-intmail; t=1600162659;
 bh=WULZ0capdV8PmgFaFjDnN41F4do1KsQhmRnkkTBpV90=; l=10;
 h=Subject:From:From:Reply-To:Sender;
 b=EKN7O9TAvXwgHSwX2Po7EPTKO8CxvDNHKCIMy6kofRMx2qbySmxBGnNusucQ4Nc5J
 j2GKCzF0sfOFX9mnQanvTswlq+k7nsglh2A+pfrPuNcBmunZ8mX+RzBhyxzLbSwbPo
 Qo1HhCqUGu2xuZtuyOdYaIfypSx/fKY+pBvBy+Fg=
Received: from fe0vm1740.rbesz01.com (unknown [10.58.172.176])
 by fe0vm1650.rbesz01.com (Postfix) with ESMTPS id 4BrJ6q3spKz3s2;
 Tue, 15 Sep 2020 11:37:39 +0200 (CEST)
X-AuditID: 0a3aad14-e0fff70000003b75-01-5f608b630ebd
Received: from si0vm1950.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by fe0vm1740.rbesz01.com (SMG Outbound) with SMTP id 61.5D.15221.36B806F5;
 Tue, 15 Sep 2020 11:37:39 +0200 (CEST)
Received: from SI-HUB2000.de.bosch.com (si-hub2000.de.bosch.com [10.4.103.108])
 by si0vm1950.rbesz01.com (Postfix) with ESMTPS id 4BrJ6q2qLGzW7P;
 Tue, 15 Sep 2020 11:37:39 +0200 (CEST)
Received: from [10.141.183.118] (10.141.183.118) by SI-HUB2000.de.bosch.com
 (10.4.103.108) with Microsoft SMTP Server id 15.1.1979.3; Tue, 15 Sep 2020
 11:37:38 +0200
Subject: Re: [PATCH v2] mtd: hyperbus: add Renesas RPC-IF driver
To: Vignesh Raghavendra <vigneshr@ti.com>, Sergei Shtylyov
 <sergei.shtylyov@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <3e4cf141-52a3-ef88-5e25-eb5c75b16186@cogentembedded.com>
 <c3cbbc7e-ded0-86dc-8582-af80ff641cfa@ti.com>
 <663f56cb-d38c-1e38-8459-4306a6da88db@de.bosch.com>
 <45a1542d-d053-a571-fe0d-79bd6c2499d7@ti.com>
From: "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>
Message-ID: <05f38c1c-e466-9cb2-e603-e215e7b2d563@de.bosch.com>
Date: Tue, 15 Sep 2020 11:37:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <45a1542d-d053-a571-fe0d-79bd6c2499d7@ti.com>
Content-Language: en-US
X-Originating-IP: [10.141.183.118]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBLMWRmVeSWpSXmKPExsXCZbVWVje5OyHe4MtaGYvdTcvYLQ6372O1
 mLzzDaPF90OrWSz+n/3A7sDqMW9NtcfOWXfZPTYvqfe4Oa/Q4/iN7UwBrFFcNimpOZllqUX6
 dglcGR/en2cv+CJSseKWSgPjLYEuRg4OCQETiYmv2boYuTiEBGYwSazePpUdwtnDKDHl3DbG
 LkZOIGclo8S0zhiQBmEBB4k9q+xBwiICpxkl9uyWhqi/zSixqv0WG0iCTcBM4vWSWWC9vAL2
 Emc+7mQCsVkEVCXWvvzBBjJHVCBZoudrBUSJoMTJmU9YQGxOASuJZ5M3soLYzAIWEjPnn2eE
 sMUlbj2ZzwRhy0s0b53NDGJLCChJnGucxziBUXAWklGzkLTPQtI+C0n7AkaWVYyiaakGZbmG
 5iYGekVJqcVVBoZ6yfm5mxghgS+yg/Fkzwe9Q4xMHIyHGCU4mJVEeA80xscL8aYkVlalFuXH
 F5XmpBYfYpTmYFES51Xh2RgnJJCeWJKanZpakFoEk2Xi4JRqYAo9dWx7WckdcW+lkuTD1SzZ
 USv7+rY94NDR86ybEn5tcv6Z863db+25Nk5JbpgkGDLd+/jdvSl7l7+YeOBD/POj/76KuIZv
 uLqo87SrR1CvxdH4tMMTPeW/3L22qjVYb/4E/s12k64986xk2i3i4DelxT55xdUdwaey/yyw
 s3SovVDxY91Wr4iDW1MMk41PJsx6KvVfyv7KweUMHBOt9jIf0nZ1EmZbY7dwv253VPN67+k/
 A0xuhnzX/LLa2vyw1YEIqfbdOxe3vtZ1eXpjklfYisDzZRN4VzUFT5zmN4XpbNGTNW/+T+Ta
 /fJ0RxlL4rR/fLfrXvCU7MtbE7N0QrCa1/3zNgon1uSVPbz+ZNp5JZbijERDLeai4kQA66rP
 uOsCAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_053742_278329_5BCE7D89 
X-CRM114-Status: GOOD (  23.57  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAxNS4wOS4yMDIwIDA3OjI3LCBWaWduZXNoIFJhZ2hhdmVuZHJhIHdyb3RlOgo+IAo+IAo+
IE9uIDkvMTUvMjAgOTozNyBBTSwgQmVobWUgRGlyayAoQ00vRVNPMikgd3JvdGU6Cj4+Cj4+Cj4+
IE9uIDE0LjA5LjIwMjAgMTU6MDksIFZpZ25lc2ggUmFnaGF2ZW5kcmEgd3JvdGU6Cj4+PiBIaSBT
ZXJnZWksCj4+Pgo+Pj4gT24gNS8xNC8yMCAyOjEzIEFNLCBTZXJnZWkgU2h0eWx5b3Ygd3JvdGU6
Cj4+Pj4gQWRkIHRoZSBIeXBlckZMYXNoIGRyaXZlciBmb3IgdGhlIFJlbmVzYXMgUlBDLUlGLsKg
IEl0J3MgdGhlICJmcm9udCBlbmQiCj4+Pj4gZHJpdmVyIHVzaW5nIHRoZSAiYmFjayBlbmQiIEFQ
SXMgaW4gdGhlIG1haW4gZHJpdmVyIHRvIHRhbGsgdG8gdGhlIHJlYWwKPj4+PiBoYXJkd2FyZS4K
Pj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFNlcmdlaSBTaHR5bHlvdiA8c2VyZ2VpLnNodHlseW92
QGNvZ2VudGVtYmVkZGVkLmNvbT4KPiBbLi4uXQo+Pj4+Cj4+Pj4KPj4+IFsuLi5dCj4+Pj4gLS0t
IC9kZXYvbnVsbAo+Pj4+ICsrKyBsaW51eC9kcml2ZXJzL210ZC9oeXBlcmJ1cy9ycGMtaWYuYwo+
Pj4+IEBAIC0wLDAgKzEsMTY1IEBACj4+Pj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wCj4+Pj4gKy8qCj4+Pj4gKyAqIExpbnV4IGRyaXZlciBmb3IgUlBDLUlGIEh5cGVyRmxh
c2gKPj4+PiArICoKPj4+PiArICogQ29weXJpZ2h0IChDKSAyMDE5LTIwMjAgQ29nZW50IEVtYmVk
ZGVkLCBJbmMuCj4+Pj4gKyAqLwo+Pj4+ICsKPj4+PiArI2luY2x1ZGUgPGxpbnV4L2Vyci5oPgo+
Pj4+ICsjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4+Pj4gKyNpbmNsdWRlIDxsaW51eC9tb2R1
bGUuaD4KPj4+PiArI2luY2x1ZGUgPGxpbnV4L210ZC9oeXBlcmJ1cy5oPgo+Pj4+ICsjaW5jbHVk
ZSA8bGludXgvbXRkL210ZC5oPgo+Pj4+ICsjaW5jbHVkZSA8bGludXgvbXV4L2NvbnN1bWVyLmg+
Cj4+Pj4gKyNpbmNsdWRlIDxsaW51eC9vZi5oPgo+Pj4+ICsjaW5jbHVkZSA8bGludXgvcGxhdGZv
cm1fZGV2aWNlLmg+Cj4+Pj4gKyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgo+Pj4+ICsKPj4+PiAr
I2luY2x1ZGUgPG1lbW9yeS9yZW5lc2FzLXJwYy1pZi5oPgo+Pj4+ICsKPj4+PiArLyogRklYTUU6
IEhvdyB0byBkcm9wIHRoaXM/ICovCj4+Pj4gKyNpZm5kZWYgQ09ORklHX01URF9DRklfQkVfQllU
RV9TV0FQCj4+Pj4gKyNlcnJvciBFbmFibGUgY29uZmlnICJGbGFzaCBjbWQvcXVlcnkgZGF0YSBz
d2FwcGluZyAoQklHX0VORElBTl9CWVRFKSIKPj4+PiArI2VuZGlmCj4+Pgo+Pj4gc2VsZWN0IE1U
RF9DRklfQkVfQllURV9TV0FQIGluIEtjb25maWcgZG9lcyBub3QgaGVscD8KPj4KPj4KPj4gSWYg
SSByZW1lbWJlciBjb3JyZWN0bHkgJ3NlbGVjdCBNVERfQ0ZJX0JFX0JZVEVfU1dBUCcgaW4gS2Nv
bmZpZyBkb2Vzbid0Cj4+IHNlZW0gdG8gd29yay4gVGhlcmVmb3JlIHRoZSBGSVhNRS4gSSBjYW4n
dCByZW1lbWJlciBleGFjdGx5IHRoZSByb290Cj4+IGNhdXNlIGZvciB0aGF0IGFueSBtb3JlLCBi
dXQgbWF5YmUgaXQgd2FzIHRoZSAnYm9vbCcgdHlwZSBvZgo+PiBNVERfQ0ZJX0JFX0JZVEVfU1dB
UD8KPj4KPiAKPiBBaCwgc29ycnkgTVREX0NGSV9CRV9CWVRFX1NXQVAgaXMgYSBjaG9pY2UgYW5k
IHNlbGVjdCBkb2VzIG5vdCB3b3JrIG9uCj4gY2hvaWNlIG1lbnVzLiBob3cgYWJvdXQ6Cj4gCj4+
IElmIGFueWJvZHkgaGFzIGEgbmljZSBzb2x1dGlvbiBmb3IgdGhhdCwgaXQgd291bGQgYmUgd2Vs
Y29tZSA6KQo+IAo+IERvZXMgdGhpcyB3b3JrOgo+IAo+ICAgY29uZmlnIFJQQ0lGX0hZUEVSQlVT
Cj4gICAgICAgICAgdHJpc3RhdGUgIlJlbmVzYXMgUlBDLUlGIEh5cGVyQnVzIGRyaXZlciIKPiAg
ICAgICAgICBkZXBlbmRzIG9uIFJFTkVTQVNfUlBDSUYKPiAtICAgICAgIHNlbGVjdCBNVERfQ0ZJ
X0FEVl9PUFRJT05TCj4gKyAgICAgICBkZXBlbmRzIG9uIE1URF9DRklfQkVfQllURV9TV0FQIHx8
IENPTVBJTEVfVEVTVAo+ICAgICAgICAgIGhlbHAKPiAgICAgICAgICAgIFRoaXMgb3B0aW9uIGlu
Y2x1ZGVzIFJlbmVzYXMgUlBDLUlGIEh5cGVyRmxhc2ggc3VwcG9ydC4KCgpXZWxsLCBpdCBhdCBs
ZWFzdCBtYWtlcyB0aGUgd2hvbGUgUlBDSUZfSFlQRVJCVVMgb3B0aW9uIHRvIHZhbmlzaCBpbiAK
Y2FzZSB0aGUgKHF1aXRlIHVuY29tbW9uPykgTVREX0NGSV9CRV9CWVRFX1NXQVAgaXMgbm90IHNl
dCwgbm8/IE9yIApyZXBocmFzZWQ6IEhvdyB0byBtYWtlIHRoZSBwb3RlbnRpYWwgdXNlciBhd2Fy
ZSB0aGF0IApNVERfQ0ZJX0JFX0JZVEVfU1dBUCBuZWVkcyB0byBiZSBlbmFibGVkIHRvIG1ha2Ug
dGhpcyBvcHRpb24gYXQgbGVhc3QgCnZpc2libGU/IEZyb20gdGhhdCBwb2ludCBvZiB2aWV3IEkg
ZmVlbCB0aGUgI2Vycm9yIGFzIGdpdmVuIGFib3ZlIG1vcmUgCnVzZXIgZnJpZW5kbHk6IFJQQ0lG
X0hZUEVSQlVTIGlzIHRoZXJlIGFuIGNhbiBiZSBlbmFibGVkLCBidXQgY29tcGlsaW5nIAppcyBm
YWlsaW5nIHdpdGggYSByZWFzb25hYmxlIG1lc3NhZ2UgaWYgdGhlIGRlcGVuZGVuY2llcyBhcmUg
bm90IG1ldC4KCkJlc3QgcmVnYXJkcwoKRGlyawoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
