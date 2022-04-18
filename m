Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D67C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Apr 2022 05:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=++FrVh8q9GR6Dc3YjCyRZrfj0XWzgps1xFNOdnADO3w=; b=2gywlDR2+b3TAb
	/0PhhPDp/ULc1P9mIlUgudQEA+qk8iWxyU+K0oGdtu3ImcldGwTO9wr08InjV/j9bbT4XoI2gGnge
	0HCUZOykMcKTh/X28V4mNGO6bMEinq4FK1ui6IIFEqtrAq/v//EnD2UdN58jQyc8lgrsRvfYx1NyX
	f8aACe0+h/y0wWDRpZJarMVYIR15cNKlVGP9BdOKsF2xbbVyQLfilN6kwT4+Of5/OhETYQltsrtJI
	hebVEKGcnlx3DJEpaNwUYzjd0i1ekhuQIrY/ydQ8fqgXmbclFuBnnCZbYEYR88at1lSUDLPtdSEig
	MqNackyQqWoB+axsHOEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngJnn-00FeHv-Bp; Mon, 18 Apr 2022 05:19:55 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngJnk-00FeGK-EZ
 for linux-mtd@lists.infradead.org; Mon, 18 Apr 2022 05:19:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650259192; x=1681795192;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PhylthLBQ2glQtoRReWB3UsVRn+3t3bqEnBQKi8vT3U=;
 b=CYEJRUQ+O4OiwD0fLaUp6iDz005WumdXdcz1gVp44Tf8u6txmJY71lCb
 ftoqVTcWSEgQpMOnJ8bb2M8bZs3J06y0PMwhmxbVRrKvxSCp6JUyB++Av
 o3XeoBYTlwH5MCdy0Dy1/FA4FdTRxSdbBrP6Iph+WKCX7I0eyFd4uatVT A=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 17 Apr 2022 22:19:49 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2022 22:19:49 -0700
Received: from [10.201.2.159] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Sun, 17 Apr
 2022 22:19:46 -0700
Message-ID: <8140244d-81d8-6837-7fb9-728b042c115f@quicinc.com>
Date: Mon, 18 Apr 2022 10:49:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH V2] mtd: rawnand: qcom: fix memory corruption that causes
 panic
Content-Language: en-US
To: Manivannan Sadhasivam <mani@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>
CC: <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <konrad.dybcio@somainline.org>, <quic_srichara@quicinc.com>
References: <1649950217-32272-1-git-send-email-quic_mdalam@quicinc.com>
 <20220414173642.56baedf5@xps13> <20220414155319.GB20493@thinkpad>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20220414155319.GB20493@thinkpad>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220417_221952_548885_EBC4FEB9 
X-CRM114-Status: GOOD (  12.91  )
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

Ck9uIDQvMTQvMjAyMiA5OjIzIFBNLCBNYW5pdmFubmFuIFNhZGhhc2l2YW0gd3JvdGU6Cj4gV0FS
TklORzogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiBRdWFsY29tbS4gUGxl
YXNlIGJlIHdhcnkgb2YgYW55IGxpbmtzIG9yIGF0dGFjaG1lbnRzLCBhbmQgZG8gbm90IGVuYWJs
ZSBtYWNyb3MuCj4KPiBPbiBUaHUsIEFwciAxNCwgMjAyMiBhdCAwNTozNjo0MlBNICswMjAwLCBN
aXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiBIaSBNZCwKPj4KPj4gcXVpY19tZGFsYW1AcXVpY2luYy5j
b20gd3JvdGUgb24gVGh1LCAxNCBBcHIgMjAyMiAyMTowMDoxNyArMDUzMDoKPj4KPj4+IFRoaXMg
cGF0Y2ggZml4ZXMgYSBtZW1vcnkgY29ycnVwdGlvbiB0aGF0IG9jY3VycmVkIGluIHRoZQo+Pj4g
bmFuZF9zY2FuKCkgcGF0aCBmb3IgSHluaXggbmFuZCBkZXZpY2UuCj4+Pgo+Pj4gT24gYm9vdCwg
Zm9yIEh5bml4IG5hbmQgZGV2aWNlIHdpbGwgcGFuaWMgYXQgYSB3ZWlyZCBwbGFjZToKPj4+IHwg
VW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGF0IHZpcnR1
YWwKPj4+ICAgIGFkZHJlc3MgMDAwMDAwNzAKPj4+IHwgWzAwMDAwMDcwXSAqcGdkPTAwMDAwMDAw
Cj4+PiB8IEludGVybmFsIGVycm9yOiBPb3BzOiA1IFsjMV0gUFJFRU1QVCBTTVAgQVJNCj4+PiB8
IE1vZHVsZXMgbGlua2VkIGluOgo+Pj4gfCBDUFU6IDAgUElEOiAxIENvbW06IHN3YXBwZXIvMCBO
b3QgdGFpbnRlZCA1LjE3LjAtMDE0NzMtZzEzYWUxNzY5Y2ZiMAo+Pj4gICAgIzM4Cj4+PiB8IEhh
cmR3YXJlIG5hbWU6IEdlbmVyaWMgRFQgYmFzZWQgc3lzdGVtCj4+PiB8IFBDIGlzIGF0IG5hbmRj
X3NldF9yZWcrMHg4LzB4MWMKPj4+IHwgTFIgaXMgYXQgcWNvbV9uYW5kY19jb21tYW5kKzB4MjBj
LzB4NWQwCj4+PiB8IHBjIDogWzxjMDg4Yjc0Yz5dICAgIGxyIDogWzxjMDg4ZDljOD5dICAgIHBz
cjogMDAwMDAxMTMKPj4+IHwgc3AgOiBjMTRhZGM1MCAgaXAgOiBjMTRlZTIwOCAgZnAgOiBjMGNj
OTcwYwo+Pj4gfCByMTA6IDAwMDAwMGEzICByOSA6IDAwMDAwMDAwICByOCA6IDAwMDAwMDQwCj4+
PiB8IHI3IDogYzE2ZjZhMDAgIHI2IDogMDAwMDAwOTAgIHI1IDogMDAwMDAwMDQgIHI0IDpjMTRl
ZTA0MAo+Pj4gfCByMyA6IDAwMDAwMDAwICByMiA6IDAwMDAwMDBiICByMSA6IDAwMDAwMDAwICBy
MCA6YzE0ZWUwNDAKPj4+IHwgRmxhZ3M6IG56Y3YgIElSUXMgb24gIEZJUXMgb24gIE1vZGUgU1ZD
XzMyICBJU0EgQVJNIFNlZ21lbnQgbm9uZQo+Pj4gfCBDb250cm9sOiAxMGM1Mzg3ZCAgVGFibGU6
IDgwMjA0MDZhICBEQUM6IDAwMDAwMDUxCj4+PiB8IFJlZ2lzdGVyIHIwIGluZm9ybWF0aW9uOiBz
bGFiIGttYWxsb2MtMmsgc3RhcnQgYzE0ZWUwMDAgcG9pbnRlciBvZmZzZXQKPj4+ICAgIDY0IHNp
emUgMjA0OAo+Pj4gfCBQcm9jZXNzIHN3YXBwZXIvMCAocGlkOiAxLCBzdGFjayBsaW1pdCA9IDB4
KHB0cnZhbCkpCj4+PiB8IG5hbmRjX3NldF9yZWcgZnJvbSBxY29tX25hbmRjX2NvbW1hbmQrMHgy
MGMvMHg1ZDAKPj4+IHwgcWNvbV9uYW5kY19jb21tYW5kIGZyb20gbmFuZF9yZWFkaWRfb3ArMHgx
OTgvMHgxZTgKPj4+IHwgbmFuZF9yZWFkaWRfb3AgZnJvbSBoeW5peF9uYW5kX2hhc192YWxpZF9q
ZWRlY2lkKzB4MzAvMHg3OAo+Pj4gfCBoeW5peF9uYW5kX2hhc192YWxpZF9qZWRlY2lkIGZyb20g
aHluaXhfbmFuZF9pbml0KzB4YjgvMHg0NTQKPj4+IHwgaHluaXhfbmFuZF9pbml0IGZyb20gbmFu
ZF9zY2FuX3dpdGhfaWRzKzB4YTMwLzB4MTRhOAo+Pj4gfCBuYW5kX3NjYW5fd2l0aF9pZHMgZnJv
bSBxY29tX25hbmRjX3Byb2JlKzB4NjQ4LzB4N2IwCj4+PiB8IHFjb21fbmFuZGNfcHJvYmUgZnJv
bSBwbGF0Zm9ybV9wcm9iZSsweDU4LzB4YWMKPj4+Cj4+PiBUaGUgcHJvYmxlbSBpcyB0aGF0IHRo
ZSBuYW5kX3NjYW4oKSdzIHFjb21fbmFuZF9hdHRhY2hfY2hpcCBjYWxsYmFjawo+Pj4gaXMgdXBk
YXRpbmcgdGhlIG5hbmRjLT5tYXhfY3dwZXJwYWdlIGZyb20gMSB0byA0LlRoaXMgY2F1c2VzIHRo
ZQo+Pj4gc2dfaW5pdF90YWJsZSBvZiBjbGVhcl9iYW1fdHJhbnNhY3Rpb24oKSBpbiB0aGUgZHJp
dmVyJ3MKPj4+IHFjb21fbmFuZGNfY29tbWFuZCgpIHRvIG1lbXNldCBtdWNoIG1vcmUgdGhhbiB3
aGF0IHdhcyBpbml0aWFsbHkKPj4+IGFsbG9jYXRlZCBieSBhbGxvY19iYW1fdHJhbnNhY3Rpb24o
KS4KPj4+Cj4+PiBUaGlzIHBhdGNoIHdpbGwgdXBkYXRlIG5hbmRjLT5tYXhfY3dwZXJwYWdlIDEg
dG8gNCBhZnRlciBuYW5kX3NjYW4oKQo+Pj4gcmV0dXJucywgYW5kIHJlbW92ZSB1cGRhdGluZyBu
YW5kYy0+bWF4X2N3cGVycGFnZSBmcm9tCj4+PiBxY29tX25hbmRfYXR0YWNoX2NoaXAgY2FsbCBi
YWNrLgo+PiBQbGVhc2UgdXBkYXRlIGFsc28gdGhlIGNvbW1pdCBsb2cuCj4+Cj4+IEZpeGVzOiA/
Cj4+IENjOiBzdGFibGUgPwo+IEFsc28gcGxlYXNlIGFkZCBSZXBvcnRlZC1ieSB0byBjcmVkaXQg
S29ucmFkLgogwqDCoCBVcGRhdGVkIGluIFYzIHBhdGNoLgo+Cj4gVGhhbmtzLAo+IE1hbmkKPgo+
Pj4gU2lnbmVkLW9mZi1ieTogTWQgU2FkcmUgQWxhbSA8cXVpY19tZGFsYW1AcXVpY2luYy5jb20+
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBTcmljaGFyYW4gUiA8cXVpY19zcmljaGFyYUBxdWljaW5jLmNv
bT4KPj4+IC0tLQo+Pj4gW1YyXQo+PiBUaGFua3MsCj4+IE1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
