Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DCF8C54E4A
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 12:47:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A3B220722
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 12:47:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qq1UVLKG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="RV1hQdYS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A3B220722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hWkN9EQFKuyOhbZVGOUlPpMDbLwmATB33dlO6nzw+bg=; b=qq1UVLKGGWL5XiHXIniniz4zz
	d6Sr5280okxy0+B6cr2lOX7eB0QcjwqmskLEZj7kaHr0Rvw/O8Q+e7AtolVdGSqqAl3lLPy0inp16
	EmChxRO8vqhBrzTMm9lmZXuLnJDv3gXjcqsxoIhPPzPgoK+P+tg2XpAPx4/j1+UCNErh8duQf5y6E
	wjtW22tT1eXRjl9N0b0j9xYhswfC2D1/HBrGDPy/4WLeV2uiCL699L4rr7HtneXFwLXp1XlpfNWuN
	p7/eFZpnx9kNgO8XiDZQISZNz14zXAhNKxO2KiCIDhL+un6Yad2OL6QnOjCVKawF2dlFA2LlRFSNZ
	LQDIHx6Mw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jY7qB-0001ww-JE; Mon, 11 May 2020 12:47:27 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY7q7-0001wZ-S8
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 12:47:25 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04BCgaSN000396; Mon, 11 May 2020 14:47:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=q1p+Flxy4LUjmNbbMr/xBwFdwk21NI1E4pInfOilbgA=;
 b=RV1hQdYSrj2zbLFttnfrnSqexDNAj/rQjhPSvvQ95lXBkVuQg1ZD9RKlV+1lJtWwMrTZ
 J0S+OO7GEvSjx4SncBS6TWYvGPLgLBti2qCVz+e8apP95MukPQN2EKHCXI/wU92Gh6uU
 AT2E8FvmXviqWufcpbA3V9MYEpPivjiD3kbDEQ+Eq4BHfs4STtRE4RtT1ad733W+qWh/
 iH0CPNiBYIZUc9AzdK+hrwqi5bSa0KiFozXMx93oMgCXbQt2MaB5FSe2w2Gt848oez1X
 /22NZiT3pHq/81ktr36J1z8ydvItor0+xGEqJbeDxgVi6JIVvminPNjq0DQtok42gngV Wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30wkdgt30u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 14:47:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CBBCF10002A;
 Mon, 11 May 2020 14:47:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ADEBB2B5E8D;
 Mon, 11 May 2020 14:47:11 +0200 (CEST)
Received: from [10.211.5.64] (10.75.127.49) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 11 May
 2020 14:47:10 +0200
Subject: Re: [PATCH v4 10/10] mtd: rawnand: stm32_fmc2: get resources from
 parent node
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <1588756279-17289-1-git-send-email-christophe.kerello@st.com>
 <1588756279-17289-11-git-send-email-christophe.kerello@st.com>
 <20200511111855.48216940@xps13> <3377adc6-3e5e-b9b7-12be-c7aa44bfac82@st.com>
 <20200511135926.3e5c622d@xps13>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <0c704fea-f2a6-2cec-8741-d322acf6afd5@st.com>
Date: Mon, 11 May 2020 14:47:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200511135926.3e5c622d@xps13>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-11_05:2020-05-11,
 2020-05-11 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_054724_271598_02175CA9 
X-CRM114-Status: GOOD (  21.08  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marex@denx.de,
 vigneshr@ti.com, gregkh@linuxfoundation.org, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, boris.brezillon@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLAoKT24gNS8xMS8yMCAxOjU5IFBNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhp
IENocmlzdG9waGUsCj4gCj4gQ2hyaXN0b3BoZSBLZXJlbGxvIDxjaHJpc3RvcGhlLmtlcmVsbG9A
c3QuY29tPiB3cm90ZSBvbiBNb24sIDExIE1heQo+IDIwMjAgMTI6MjE6MDMgKzAyMDA6Cj4gCj4+
IEhpIE1pcXVlbCwKPj4KPj4gT24gNS8xMS8yMCAxMToxOCBBTSwgTWlxdWVsIFJheW5hbCB3cm90
ZToKPj4+IEhpIENocmlzdG9waGUsCj4+Pgo+Pj4gQ2hyaXN0b3BoZSBLZXJlbGxvIDxjaHJpc3Rv
cGhlLmtlcmVsbG9Ac3QuY29tPiB3cm90ZSBvbiBXZWQsIDYgTWF5IDIwMjAKPj4+IDExOjExOjE5
ICswMjAwOgo+Pj4gICAgCj4+Pj4gRk1DMiBFQkkgc3VwcG9ydCBoYXMgYmVlbiBhZGRlZC4gQ29t
bW9uIHJlc291cmNlcyAocmVnaXN0ZXJzIGJhc2UKPj4+PiBhbmQgY2xvY2spIGFyZSBub3cgc2hh
cmVkIGJldHdlZW4gdGhlIDIgZHJpdmVycy4gSXQgbWVhbnMgdGhhdCB0aGUKPj4+PiBjb21tb24g
cmVzb3VyY2VzIHNob3VsZCBub3cgYmUgZm91bmQgaW4gdGhlIHBhcmVudCBkZXZpY2Ugd2hlbiBF
QkkKPj4+PiBub2RlIGlzIGF2YWlsYWJsZS4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IENocmlz
dG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0LmNvbT4KPj4+PiAtLS0KPj4+Cj4+
PiBbLi4uXQo+Pj4gICAgCj4+Pj4gKwo+Pj4+ICtzdGF0aWMgYm9vbCBzdG0zMl9mbWMyX25mY19j
aGVja19mb3JfcGFyZW50KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+Pj4gK3sKPj4+
PiArCXUzMiBpOwo+Pj4+ICsJaW50IG5iX3Jlc291cmNlcyA9IDA7Cj4+Pj4gKwo+Pj4+ICsJLyog
Q291bnQgdGhlIG51bWJlciBvZiByZXNvdXJjZXMgaW4gcmVnIHByb3BlcnR5ICovCj4+Pj4gKwlm
b3IgKGkgPSAwOyBpIDwgcGRldi0+bnVtX3Jlc291cmNlczsgaSsrKSB7Cj4+Pj4gKwkJc3RydWN0
IHJlc291cmNlICpyZXMgPSAmcGRldi0+cmVzb3VyY2VbaV07Cj4+Pj4gKwo+Pj4+ICsJCWlmIChy
ZXNvdXJjZV90eXBlKHJlcykgPT0gSU9SRVNPVVJDRV9NRU0pCj4+Pj4gKwkJCW5iX3Jlc291cmNl
cysrOwo+Pj4+ICsJfQo+Pj4+ICsKPj4+PiArCS8qIEVhY2ggQ1MgbmVlZHMgMyByZXNvdXJjZXMg
ZGVmaW5lZCAoZGF0YSwgY21kIGFuZCBhZGRyKSAqLwo+Pj4+ICsJaWYgKG5iX3Jlc291cmNlcyAl
IDMpCj4+Pj4gKwkJcmV0dXJuIGZhbHNlOwo+Pj4+ICsKPj4+PiArCXJldHVybiB0cnVlOwo+Pj4+
ICt9Cj4+Pgo+Pj4gVGhpcyBmdW5jdGlvbiBsb29rcyBmcmFnaWxlLiBXaHkgbm90IGp1c3QgY2hl
Y2tpbmcgdGhlIGNvbXBhdGlibGUKPj4+IHN0cmluZyBvZiB0aGUgcGFyZW50IG5vZGU/Cj4+PiAg
ICAKPj4KPj4gWWVzLCBpdCBpcyBhbm90aGVyIHdheSB0byBjaGVjayB0aGF0IHdlIGhhdmUgYW4g
RUJJIHBhcmVudCBub2RlLgo+Pgo+PiBJbiB0aGlzIGltcGxlbWVudGF0aW9uLCBJIHdhcyBjaGVj
a2luZyB0aGUgbnVtYmVyIG9mIHJlZyB0dXBsZXMuCj4+IEluIGNhc2Ugd2UgaGF2ZSA2LCBpdCBt
ZWFucyB0aGF0IHRoZSByZWdpc3RlciBiYXNlIGFkZHJlc3MgaXMgZGVmaW5lZCBpbiB0aGUgcGFy
ZW50IG5vZGUgKEVCSSBub2RlKS4KPj4gSW4gY2FzZSB3ZSBoYXZlIDcsIGl0IG1lYW5zIHRoYXQg
dGhlIHJlZ2lzdGVyIGJhc2UgYWRkcmVzcyBpcyBkZWZpbmVkIGluIHRoZSBjdXJyZW50IG5vZGUg
KE5GQyBub2RlKS4KPiAKPiBZZXMsIEkgdW5kZXJzdGFuZCB3aGF0IHlvdSBhcmUgZG9pbmcsIGJ1
dCBJIGtpbmQgb2YgZGlzbGlrZSB0aGUgbG9naWMuCj4gUmVseWluZyBvbiB0aGUgbnVtYmVyIG9m
IHJlZyB0dXBsZXMgaXMgc29tZXRoaW5nIHRoYXQgY2FuIGJlIGRvbmUgKEkKPiB1c2VkIGl0IG15
c2VsZiBvbmUgdGltZSksIGJ1dCBJIHRoaW5rIHRoaXMgaXMgbW9yZSBhIGhhY2sgdGhhdCB5b3Ug
ZG8KPiB3aGVuIHlvdSBoYXZlIG5vIG90aGVyIHdheSB0byBkaWZmZXJlbnRpYXRlLiBJIGd1ZXNz
IHRoZSBwcm9wZXIgd2F5Cj4gd291bGQgYmUgdG8gbG9vayBhdCB0aGUgcGFyZW50J3MgY29tcGF0
aWJsZS4gSWYgaXQgbWF0Y2hlcyB3aGF0IHlvdQo+IGV4cGVjdCwgdGhlbiB5b3UgY2FuIHN0b3Jl
IHRoZSBkZXYtPm9mX25vZGUtPnBhcmVudC0+ZGV2IHNvbWV3aGVyZSBpbgo+IHlvdXIgY29udHJv
bGxlcidzIHN0cnVjdHVyZSBhbmQgdGhlbiB1c2UgaXQgdG8gaW5pdGlhbGl6ZSB0aGUgY2xvY2sg
YW5kCj4gcmVnbWFwLiBUaGlzIHdheSB5b3UgZG9uJ3QgaGF2ZSB0byBtb3ZlIGFueXRoaW5nIGVs
c2UgaW4gdGhlIHByb2JlIHBhdGguCj4gCgpPSywgSSB3aWxsIGNoZWNrIHRoZSBjb21wYXRpYmxl
IHN0cmluZyBvZiB0aGUgcGFyZW50IGRldmljZSB1c2luZyAKb2ZfZGV2aWNlX2lzX2NvbXBhdGli
bGUgQVBJIGluIHY1LgpJbiBjYXNlIG9mIHRoZSBwYXJlbnQgaXMgZm91bmQsIEkgd2lsbCBhZGQg
aXQgaW4gdGhlIHN0cnVjdHVyZSBvZiB0aGUgCmNvbnRyb2xsZXIgKGRldl9wYXJlbnQpLgpJIHdp
bGwgcmVseSBvbiB0aGlzIGZpZWxkIG9ubHkgdG8gZ2V0IHRoZSBjb21tb24gcmVzb3VyY2VzICh0
aGUgcmVnaXN0ZXIgCmJhc2UgYWRkcmVzcyBhbmQgdGhlIGNsb2NrKSBpbiB0aGUgTkZDIG5vZGUg
b3IgaW4gdGhlIEVCSSBub2RlLgoKUmVnYXJkcywKQ2hyaXN0b3BoZSBLZXJlbGxvLgoKPiAKPiBU
aGFua3MsCj4gTWlxdcOobAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
