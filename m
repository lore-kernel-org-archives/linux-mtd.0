Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B00FEC83003
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 09:28:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 802EA20731
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 09:28:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uvCpSTr8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="Co9D5tuY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 802EA20731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZjaSK+02WkhnoGWFUGKZCXRZCzWZ6NTvNYjZ2imzUJ8=; b=uvCpSTr8sJmvqweb3xZk6/wBi
	F3KGrri8tNl9hgyIcluNVBotcpbpTCdXqZUBFCQPx102MFKqwuHoopDJ3UoKBca0T/HXUB0zNCiI1
	oesfUQK0hGxJxEv5S+TO9uItEA9rw6OcGiZwtsm/NgbqiV7Je7vOA/iZy7/oV7lpcfREo+VdSsi3J
	zUpJkoKqEf/tQ5Ik1c1M7SXU2DXeX+RdkiUyr79bl5gh5AuXh40FlBoYohxkoMmoTsVJgTDZ9C5MG
	jHd/2JKr1mZQy5H5jpDmQ0pVJLvnogA6ge9nYW3lGdEkIPZPG8K2y+01C7b8+BLQcKL0VmF/BBeXy
	7t/DnYGBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTj0f-0008Ls-Ac; Wed, 29 Apr 2020 09:28:05 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTj0b-0008KS-7x
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 09:28:03 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03T9CQf8021661; Wed, 29 Apr 2020 11:27:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=QHQmACS4JkGdXe2F2AdzPzvqSzi1Ni+9J4M+JTLtdlI=;
 b=Co9D5tuYwBeP3sLw4po3/lTa0MJYvSHte6qIVIDWbVmIW7gM5bhiWyYzm5iOaoEhmikg
 foOAy+hpnzUF7ucZG+q0gXvErcqRBinVnovqegS8iMz9Se2fnesBV0Dh0uIVH+4JIjMP
 VpgxJjuLan5zTEvBP/GH1wDAb/wOZ0D/1XiOo8KfB/LyveB5TvxZ+1mQJ5BrJ+WDnAmF
 rvCzuT3Ksrlc4mnUF1FIAgYACGpSahxaB6DVikZ94wkGTEBgglSreAnI/HnuPpNjigXw
 Wut5HQDizB668deaGthT/ASl/M1cee6F1zZ8kAfiXih961GTZIJQD0u2L2fo6PK7S/NF Ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhjwwe2h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 11:27:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BF5D4100034;
 Wed, 29 Apr 2020 11:27:46 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A0DB7207569;
 Wed, 29 Apr 2020 11:27:46 +0200 (CEST)
Received: from [10.211.9.35] (10.75.127.46) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 29 Apr
 2020 11:27:44 +0200
Subject: Re: [PATCH v2 06/12] mtd: rawnand: stm32_fmc2: use FMC2_TIMEOUT_MS
 for timeouts
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-7-git-send-email-christophe.kerello@st.com>
 <20200427202212.0235d987@xps13>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <0e2c9a6a-aa21-7814-9af8-629de6568fab@st.com>
Date: Wed, 29 Apr 2020 11:27:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200427202212.0235d987@xps13>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-29_03:2020-04-28,
 2020-04-29 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_022801_567002_AEF695C9 
X-CRM114-Status: GOOD (  23.50  )
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
 vigneshr@ti.com, tony@atomide.com, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdcOobCwKCk9uIDQvMjcvMjAgODoyMiBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBI
aSBDaHJpc3RvcGhlLAo+IAo+IENocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxv
QHN0LmNvbT4gd3JvdGUgb24gV2VkLCAxNSBBcHIKPiAyMDIwIDE3OjU3OjMwICswMjAwOgo+IAo+
PiBUaGlzIHBhdGNoIHJlbW92ZXMgdGhlIGNvbnN0YW50IEZNQzJfVElNRU9VVF9VUy4KPj4gRk1D
Ml9USU1FT1VUX01TIGlzIHNldCB0byA1IHNlY29uZHMgYW5kIHRoaXMgY29uc3RhbnQgaXMgdXNl
ZAo+PiBlYWNoIHRpbWUgdGhhdCB3ZSBuZWVkIHRvIHdhaXQgKGV4Y2VwdCB3aGVuIHRoZSB0aW1l
b3V0IHZhbHVlCj4+IGlzIHNldCBieSB0aGUgZnJhbWV3b3JrKQo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlzdG9waGUua2VyZWxsb0BzdC5jb20+Cj4+IC0tLQo+
PiAgIGRyaXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jIHwgMTEgKysrKystLS0t
LS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMg
Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+PiBpbmRleCBhYjUzMzE0
Li5mMTU5YzM5IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMy
X25hbmQuYwo+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+
PiBAQCAtMzcsOCArMzcsNyBAQAo+PiAgIC8qIE1heCBFQ0MgYnVmZmVyIGxlbmd0aCAqLwo+PiAg
ICNkZWZpbmUgRk1DMl9NQVhfRUNDX0JVRl9MRU4JCShGTUMyX0JDSERTUlNfTEVOICogRk1DMl9N
QVhfU0cpCj4+ICAgCj4+IC0jZGVmaW5lIEZNQzJfVElNRU9VVF9VUwkJCTEwMDAKPj4gLSNkZWZp
bmUgRk1DMl9USU1FT1VUX01TCQkJMTAwMAo+PiArI2RlZmluZSBGTUMyX1RJTUVPVVRfTVMJCQk1
MDAwCj4+ICAgCj4+ICAgLyogVGltaW5ncyAqLwo+PiAgICNkZWZpbmUgRk1DMl9USElaCQkJMQo+
PiBAQCAtNTI1LDkgKzUyNCw5IEBAIHN0YXRpYyBpbnQgc3RtMzJfZm1jMl9oYW1fY2FsY3VsYXRl
KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGNvbnN0IHU4ICpkYXRhLAo+PiAgIAl1MzIgc3IsIGhl
Y2NyOwo+PiAgIAlpbnQgcmV0Owo+PiAgIAo+PiAtCXJldCA9IHJlYWRsX3JlbGF4ZWRfcG9sbF90
aW1lb3V0KGZtYzItPmlvX2Jhc2UgKyBGTUMyX1NSLAo+PiAtCQkJCQkgc3IsIHNyICYgRk1DMl9T
Ul9OV1JGLCAxMCwKPj4gLQkJCQkJIEZNQzJfVElNRU9VVF9NUyk7Cj4+ICsJcmV0ID0gcmVhZGxf
cmVsYXhlZF9wb2xsX3RpbWVvdXRfYXRvbWljKGZtYzItPmlvX2Jhc2UgKyBGTUMyX1NSLAo+PiAr
CQkJCQkJc3IsIHNyICYgRk1DMl9TUl9OV1JGLCAxLAo+PiArCQkJCQkJMTAwMCAqIEZNQzJfVElN
RU9VVF9NUyk7Cj4gCj4gSXMgdGhlIF9hdG9taWMgc3VmZml4IG5lZWRlZCBoZXJlPyBJZiB5ZXMg
aXQgd291bGQgZGVzZXJ2ZSBhIHNlcGFyYXRlCj4gcGF0Y2ggd2l0aCBGaXhlcy9TdGFibGUgdGFn
cy4KPiAKCkkgaGF2ZSBjdXJyZW50bHkgbm90IHNlZW4gYW55IGlzc3Vlcy4gU28sIEkgd2lsbCBy
ZW1vdmUgdGhpcyAKbW9kaWZpY2F0aW9uIGFzIHdlIHdpbGwgbW92ZSB0byByZWdtYXBfcmVhZF9w
b2xsX3RpbWVvdXQgaW4gcGF0Y2ggMTAuCgo+PiAgIAlpZiAocmV0KSB7Cj4+ICAgCQlkZXZfZXJy
KGZtYzItPmRldiwgImhhbSB0aW1lb3V0XG4iKTsKPj4gICAJCXJldHVybiByZXQ7Cj4+IEBAIC0x
MzE1LDcgKzEzMTQsNyBAQCBzdGF0aWMgaW50IHN0bTMyX2ZtYzJfd2FpdHJkeShzdHJ1Y3QgbmFu
ZF9jaGlwICpjaGlwLCB1bnNpZ25lZCBsb25nIHRpbWVvdXRfbXMpCj4+ICAgCS8qIENoZWNrIGlm
IHRoZXJlIGlzIG5vIHBlbmRpbmcgcmVxdWVzdHMgdG8gdGhlIE5BTkQgZmxhc2ggKi8KPj4gICAJ
aWYgKHJlYWRsX3JlbGF4ZWRfcG9sbF90aW1lb3V0X2F0b21pYyhmbWMyLT5pb19iYXNlICsgRk1D
Ml9TUiwgc3IsCj4+ICAgCQkJCQkgICAgICBzciAmIEZNQzJfU1JfTldSRiwgMSwKPj4gLQkJCQkJ
ICAgICAgRk1DMl9USU1FT1VUX1VTKSkKPj4gKwkJCQkJICAgICAgMTAwMCAqIEZNQzJfVElNRU9V
VF9NUykpCj4+ICAgCQlkZXZfd2FybihmbWMyLT5kZXYsICJXYWl0cmR5IHRpbWVvdXRcbiIpOwo+
PiAgIAo+PiAgIAkvKiBXYWl0IHRXQiBiZWZvcmUgUi9CIyBzaWduYWwgaXMgbG93ICovCj4gCj4g
WW91IGNoYW5nZSB0aGUgdGltZW91dHMgZnJvbSAxbXMgdG8gNXMuCj4gCj4gTWF5YmUgNXMgaXMg
YSBsaXR0bGUgYml0IHRvbyBtdWNoIElNSE8gYnV0IHdlIGRvbid0IHJlYWxseSBjYXJlIGFzIHRo
aXMKPiBpcyBhIHRpbWVvdXQuIEhvd2V2ZXIgMW1zIGlzIHRpZ2h0LiBJZiB5b3UgYXJlIGNoYW5n
aW5nIHRoaXMgdmFsdWUKPiBiZWNhdXNlIGl0IHRyaWdnZXJzIGVycm9yIChlZy4gd2hlbiB0aGUg
bWFjaGluZSBpcyBsb2FkZWQpLCB0aGVuIGl0IGlzCj4gYSBmaXggYW5kIHNob3VsZCBhcHBlYXIg
bGlrZSBpdC4KPiAKPiBUaGFua3MsCj4gTWlxdcOobAo+IAoKTm8gZXJyb3JzIGN1cnJlbnRseSBo
YXBwZW5zLgpEdXJpbmcgb3VyIHN0cmVzcyB0ZXN0cywgaW4gYSBvdmVybG9hZGVkIHN5c3RlbSwg
d2UgaGF2ZSBzZWVuIHRoYXQgd2UgCmNvdWxkIGJlIGNsb3NlIHRvIDEgc2Vjb25kLCBldmVuIGlm
IHdlIG5ldmVyIG1ldCB0aGlzIHZhbHVlLgpTbywgdG8gYmUgc2FmZSwgSSBoYXZlIHNldCB0aGlz
IHRpbWVvdXQgdG8gNSBzZWNvbmRzLgpBcyBpdCBpcyBqdXN0IGEgdGltZW91dCB2YWx1ZSwgSSBo
YXZlIG5vdCBzZWVuIGFueSBzaWRlIGVmZmVjdC4KSSBhbSB1c2luZyB0aGUgc2FtZSB0aW1lb3V0
IGNvbnN0YW50IHRvIGF2b2lkIHRvIGhhdmUgb25lIHRpbWVvdXQgcGVyIApjYXNlcy4KClJlZ2Fy
ZHMsCkNocmlzdG9waGUgS2VyZWxsby4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
