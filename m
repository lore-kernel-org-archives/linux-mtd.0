Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA3DC6FD1C
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Mar 2023 16:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nXdW3Zs7FEIGI/8XzCfgyF/BSYo6mYAeM+/2yp+J9Xs=; b=V1Dlj7Djz3hT6U
	GZoxe9n5J+/L6ZHfotQSLqGM022xLDlFizsHhWqerk5OJ8tcZTQrdDWPFIfeDQrcJu4hcmzY7w0fS
	pCXM5WL2/Ljmdz26Racix5yjfVhm1MfvxhwEu3olMRU4YMEtQ3hlP5FHBz72Yk8C2xCKNkdVor9PV
	6pmbx0n+PVAFsvCV/o6tdElHOYgERVWPQVbGrKeFBXE2fw2YTC6oBjeERexKd3ROnZYDpSIvl+V8E
	1h3VcNOzIFdSEvtoIs0QyTdQ4ATB+eUcNMo53vDhqseIg8T8UuOpBToAVy3kkj42ntxmbX8J0Rn/y
	cJT5pVvFqpq3l6r+snnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfkMy-004zqf-32;
	Fri, 24 Mar 2023 16:34:24 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfkMs-004zpa-0O
	for linux-mtd@lists.infradead.org;
	Fri, 24 Mar 2023 16:34:19 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32ODBKRW011039;
	Fri, 24 Mar 2023 17:34:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=SboRCbcyRuV05Ygpi/rKpxPTf5aTWPczlwFRg2CMDRo=;
 b=T1+qXB3/c6jdtvoAkUgyEpBxAGzqwuBFCsWuiyKbxIETREUwr3A76lTJOo0vBuZAkNTy
 VO0l4l7EVVtHUdnZZ3eEBAxShGVOxviBwXQq3yHB7Ov0nom1tKaaNk+rvVNH4PSDsOwH
 Xhn3tCgGE7FhwD6BTqIbLU2FYxUu7XEBw07cKlsqF3r+W2i6u0FrfqkbGr9x/NL2ctgi
 3r1uqqtHemjlgCwEJ9cPCAFQEuz79w6yBOgSiZs7eAT6/qYvoaiOx51qKFUexd2mQj1O
 HdgCQXQqejL4okcP6ITmGvn+/pK3Hghd6XeTjJV5SljswAZOxNp5Ob+UdTIPDvbOg3AX hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pgxjwe1x7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Mar 2023 17:34:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 713F210002A;
	Fri, 24 Mar 2023 17:34:15 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C90921ADAE;
	Fri, 24 Mar 2023 17:34:15 +0100 (CET)
Received: from [10.48.0.175] (10.48.0.175) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Fri, 24 Mar
 2023 17:34:15 +0100
Message-ID: <f4c32aa5-e5b1-6465-7708-ef0281baf0af@foss.st.com>
Date: Fri, 24 Mar 2023 17:34:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] mtd: rawnand: stm32_fmc2: do not support EDO mode
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20230324160918.826452-1-christophe.kerello@foss.st.com>
 <20230324172528.4d3ccd4b@xps-13>
From: Christophe Kerello <christophe.kerello@foss.st.com>
In-Reply-To: <20230324172528.4d3ccd4b@xps-13>
X-Originating-IP: [10.48.0.175]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_10,2023-03-24_01,2023-02-09_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_093418_455732_A9AA923C 
X-CRM114-Status: GOOD (  16.83  )
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

SGVsbG8gTWlxdWVsLAoKT24gMy8yNC8yMyAxNzoyNSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBI
aSBDaHJpc3RvcGhlLAo+IAo+IGNocmlzdG9waGUua2VyZWxsb0Bmb3NzLnN0LmNvbSB3cm90ZSBv
biBGcmksIDI0IE1hciAyMDIzIDE3OjA5OjE4ICswMTAwOgo+IAo+PiBGTUMyIGNvbnRyb2xsZXIg
ZG9lcyBub3Qgc3VwcG9ydCBFRE8gbW9kZSAodGltaW5ncyBtb2RlIDQgYW5kIDUpLgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlzdG9waGUua2VyZWxsb0Bmb3Nz
LnN0LmNvbT4KPj4gRml4ZXM6IDJjZDQ1N2YzMjhjMSAoIm10ZDogcmF3bmFuZDogc3RtMzJfZm1j
MjogYWRkIFNUTTMyIEZNQzIgTkFORCBmbGFzaCBjb250cm9sbGVyIGRyaXZlciIpCj4+IC0tLQo+
PiAgIGRyaXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jIHwgMyArKysKPj4gICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N0
bTMyX2ZtYzJfbmFuZC5jCj4+IGluZGV4IDVkNjI3MDQ4YzQyMC4uM2FiYjYzZDAwYTBiIDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+PiArKysg
Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+PiBAQCAtMTUzMSw2ICsx
NTMxLDkgQEAgc3RhdGljIGludCBzdG0zMl9mbWMyX25mY19zZXR1cF9pbnRlcmZhY2Uoc3RydWN0
IG5hbmRfY2hpcCAqY2hpcCwgaW50IGNoaXBuciwKPj4gICAJaWYgKElTX0VSUihzZHJ0KSkKPj4g
ICAJCXJldHVybiBQVFJfRVJSKHNkcnQpOwo+PiAgIAo+PiArCWlmIChzZHJ0LT50UkNfbWluIDwg
MzAwMDApCj4gCj4gV2hlbiBpbnRyb2R1Y2luZyBOVi1ERFIgc3VwcG9ydCB3ZSBhcyB3ZWxsIGFk
ZGVkIGEgdGltaW5ncy5tb2RlIGZpZWxkLAo+IHBlcmhhcHMgeW91IGNvdWxkIHVzZSBpdD8KClll
cywgSSBjYW4gdXNlIGl0LiBJdCB3aWxsIGJlIGRvbmUgaW4gVjIuCgpSZWdhcmRzLApDaHJpc3Rv
cGhlIEtlcmVsbG8uCgo+IAo+PiArCQlyZXR1cm4gLUVPUE5PVFNVUFA7Cj4+ICsKPj4gICAJaWYg
KGNoaXBuciA9PSBOQU5EX0RBVEFfSUZBQ0VfQ0hFQ0tfT05MWSkKPj4gICAJCXJldHVybiAwOwo+
PiAgIAo+IAo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
