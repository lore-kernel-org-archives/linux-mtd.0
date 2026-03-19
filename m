Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFDB108E1E6
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Mar 2026 11:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UBk9GzMthdaqnT49MRyBerBcGpWT9htqWNYcZx5U8I4=; b=Ds0+kYEtNDt65x
	KGqiSk+2s2NvdOCLJlgKqJYz9gZ0elGf8dCSHXC0/6qIT84E6lFimkw7olMCjsx5Wv9L1h1yg6YTN
	B0Qu1GLlsWld2byQT1Id44m/x1oJ3RYzTaakzsqERAyRBQ8fb4DiGAxCfcELjbtjTZVCRBINrszxm
	iz8Hbc5DuCW6zCOcbKg2iGZWaFEEuRjjv9c3viKfunbbDqA99iRdoTvygt6n+1dAAGnRi9Pa9cKRz
	18m0IERdMZuUnbGdPRosvFbdxgOjJsPFuMC56WPL5RZbsw6uKYs5DuMCLXbANWoBZvcwJZFjEqb0V
	Yt26wI8Pb6xFdsPZnl3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3BQ3-0000000AVsj-3Dtq;
	Thu, 19 Mar 2026 11:20:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3BQ3-0000000AVsa-0qMp
	for linux-mtd@lists.infradead.org;
	Thu, 19 Mar 2026 11:20:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4BF1D6011F;
	Thu, 19 Mar 2026 11:20:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45846C19424;
	Thu, 19 Mar 2026 11:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773919202;
	bh=rPGCScFkKKklOwGyPYozRiKe7JFfv9zlARAYV3PpNXE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CNojlXk/H1O2BzNEvxp3/c8NaAYCupGKEnEaoB/gqVzT/RmnKY20iQnNhOzMqLmgx
	 xD44/uQR2o3l2mmYY+s9ektOxCGdmHAgNxYmuXVzAoybBRNJESa/QuwzF4qqmyTSc4
	 RVr/d4U6qNCyqxalOjK7zhHugSzF8vB/AWSRjMDJJ8xomaeONDCGiH931aOFcnfflA
	 sm6VcYCu4lVbHL+pLThEzpIRMVJzUvsrw4LxD+FnPpNWvj1MXdWuPx0ENzXRZensTY
	 oW4U2rvcIpLnKeX8wKaZtxyiWklvH5mtWRAW3ZtN+dZVB5EcKiUcOTyGi3PNApagpj
	 qmi31fi4naztw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Bean Huo <beanhuo@iokpp.de>,  "Zailiang Zhang (zaizhang)"
 <zaizhang@cisco.com>,  "pratyush@kernel.org" <pratyush@kernel.org>,
  "mwalle@kernel.org" <mwalle@kernel.org>,  "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>,  "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>,  Bean Huo <beanhuo@micron.com>
Subject: Re: [PATCH] mtd: spi-nor: micron-st: fix FSR read fallback for
 controllers returning -ENOTSUPP
In-Reply-To: <36e65648-707c-4b45-a429-1ea7f9f65f07@linaro.org> (Tudor
	Ambarus's message of "Thu, 19 Mar 2026 11:10:56 +0200")
References: <20260318131857.2685004-1-beanhuo@iokpp.de>
	<639bd964-b499-4e9f-9035-0010fecfb17c@linaro.org>
	<3c94f0e1c5a8bf184d7a81f49b7beb999355dcd3.camel@iokpp.de>
	<DS0PR11MB8668FC8E62236D0893A8CEFFC84EA@DS0PR11MB8668.namprd11.prod.outlook.com>
	<4223576d9f55b2a3ae18cf148765a1a5487367df.camel@iokpp.de>
	<36e65648-707c-4b45-a429-1ea7f9f65f07@linaro.org>
Date: Thu, 19 Mar 2026 11:19:58 +0000
Message-ID: <2vxz7br8cbhd.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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

T24gVGh1LCBNYXIgMTkgMjAyNiwgVHVkb3IgQW1iYXJ1cyB3cm90ZToKCj4gT24gMy8xOC8yNiA3
OjE3IFBNLCBCZWFuIEh1byB3cm90ZToKPj4gT24gV2VkLCAyMDI2LTAzLTE4IGF0IDE3OjA0ICsw
MDAwLCBaYWlsaWFuZyBaaGFuZyAoemFpemhhbmcpIHdyb3RlOgo+Pj4gSGksCj4+Pgo+Pj4gT3Vy
IHBsYXRmb3JtIGlzIHVzaW5nIEludGVsIFJhcHRvcmxha2UgQ1BVLCBzbyBpdOKAmXMgbm90IG91
ciBvd24gc3BpIG1hc3Rlcgo+Pj4gZHJpdmVyLgo+Pj4gVGhlIGtlcm5lbCB2ZXJzaW9uIHdlIGFy
ZSB1c2luZyBpcyA2LjYuMjEuCj4+PiBJIHRoaW5rIHdoZW4gbWljcm9uIHJlYWQgZnNyIGZ1bmN0
aW9uIGNhbGxzIHNwaV9tZW1fZXhlY19vcCgpLCBpdCBoYXMKPj4+IGZvbGxvd2luZyByZXR1cm46
Cj4+Pj4gaWbCoCghc3BpX21lbV9pbnRlcm5hbF9zdXBwb3J0c19vcChtZW0swqBvcCkpCj4+Pj4g
wqAgwqAgcmV0dXJuwqAtRU5PVFNVUFA7Cj4+PiBQbGVhc2UgY29ycmVjdCBtZSBpZiBJIGFtIHdy
b25nIGhlcmUuIEFsc28gdGhlIGxhdGVzdCB1cHN0cmVhbSBrZXJuZWwgbWF5IG5vdAo+Pj4gdXNl
IHRoZSBzYW1lIGhhbmRsaW5nIGNvZGUuCj4+IAo+PiAKPj4gSGkgWmFpbGlhbmcsICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgCj4+IFlvdSBhcmUgY29ycmVjdC4gdGhlIGNvbW1pdCBjZmY0OWQ1OGY1N2UgKCJz
cGk6IFVuaWZ5IGVycm9yIGNvZGVzIGJ5IHJlcGxhY2luZyAtCj4+IEVOT1RTVVBQIHdpdGggLUVP
UE5PVFNVUFAiKSwgbWVyZ2VkIHVwc3RyZWFtIG9uIE5vdmVtYmVyIDI5LCAyMDIzLCB3aGljaCBj
aGFuZ2VkCj4+IHNwaV9tZW1fZXhlY19vcCgpIHRvIHJldHVybiAtRU9QTk9UU1VQUCBpbnN0ZWFk
IG9mIC1FTk9UU1VQUCB3aGVuIGFuIG9wZXJhdGlvbgo+PiBpcyBub3Qgc3VwcG9ydGVkLiBLZXJu
ZWwgNi42LjIxIHByZWRhdGVzIHRoaXMgZml4LCB3aGljaCBpcyB3aHkgeW91IHNlZSAtTk9UU1VQ
UAo+PiBvbiB5b3VyIHBsYXRmb3JtIHdpdGggSW50ZWwgUmFwdG9yIExha2UuICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+PiBUaGlzIGNoYW5nZXMg
dGhlIHBpY3R1cmUuIFRoZSAtRU5PVFNVUFAgWmFpbGlhbmcgb2JzZXJ2ZWQgaXMgY29taW5nIGRp
cmVjdGx5Cj4+IGZyb20gc3BpX21lbV9leGVjX29wKCkgaW4ga2VybmVsIDYuNi4yMSwgYmVmb3Jl
IGNvbW1pdCBjZmY0OWQ1OGY1N2Ugd2FzIGluCj4+IHBsYWNlLiBUaGF0IGNvbW1pdCBmaXhlZCB0
aGUgU1BJIG1lbSBmcmFtZXdvcmsgaXRzZWxmLCBidXQgaXQgbWF5IG5vdCBoYXZlIGJlZW4KPj4g
YmFja3BvcnRlZCB0byBhbGwgc3RhYmxlIHRyZWVzLiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIAo+PiAgICAgICAgICAgICAgICAgICAKPj4gSSB3b3VsZCB0
aGVyZWZvcmUgYXJndWUgdGhhdCBvdXIgbWljcm9uLXN0LmMgZml4IGlzIHN0aWxsIHdvcnRoIGtl
ZXBpbmcgZm9yIHRoZQo+PiB0aGUgcmVhc29uIHRoYXQgaXQgcHJvdmlkZXMgYSBzYWZldHkgbmV0
IGZvciBzdGFibGUga2VybmVscyB0aGF0IGRpZCBub3QgcmVjZWl2ZQo+PiBjZmY0OWQ1OGY1N2Ug
YXMgYSBiYWNrcG9ydC4gICAgICAgICAgICAgICAgICAgICAKPj4gCj4KPiBJIGFkdmlzZSBhZ2Fp
bnN0IHRoaXMsIG90aGVyd2lzZSB3ZSdsbCBjYXJyeSBkZWFkIHdlaWdodCBvbiBvdXIgc2hvdWxk
ZXJzLgoKKzEKClRoZXJlIGlzIGxpdHRsZSBzZW5zZSBpbiBjYXJyeWluZyBhIGZpeCBmb3IgYSBi
dWcgd2UgZG9uJ3QgaGF2ZS4KCj4KPj4gVGhhdCBzYWlkLCBJIGFtIGhhcHB5IHRvIGZvbGxvdyB5
b3VyIGd1aWRhbmNlIG9uIGhvdyB0byBwcm9jZWVkLsKgCj4KPiBJIHdvdWxkIGJhY2twb3J0IHRo
ZSBwYXRjaCB0byB0aGUgc3RhYmxlIGtlcm5lbCBpZiB0aGF0IGZpeGVzIHRoaW5ncyBmb3IgeW91
Lgo+IFRoZW4gSSB3b3VsZCBmb2xsb3cgdXAgd2l0aCBhIHBhdGNoIGFuZCByZXBsYWNlIC1FTk9U
U1VQUC8tRU9QTk9UU1VQUCBpbgo+IHNwaS1tZW0gYW5kIHNwaS4KCisxIGhlcmUgdG9vLgoKWW91
IHdvdWxkIG5lZWQgdG8gYmFja3BvcnQgYSBwYXRjaCB0byB5b3VyIGtlcm5lbCBhbnl3YXkuIEJl
dHRlciB0bwpiYWNrcG9ydCBvbmUgdGhhdCBpcyBhbHJlYWR5IHVwc3RyZWFtIGFuZCBpcyBhIG1v
cmUgZ2VuZXJhbCBmaXguCgotLSAKUmVnYXJkcywKUHJhdHl1c2ggWWFkYXYKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
