Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B22C2BA18
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2024 16:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=57cxqs5lh7Ey3Adm1ong5NaeMVf43IJ4JbU/KIsWhOk=; b=UzAOu29pr8gkxn
	uS/C+kC42DEvReWgG0tqSlZ3Gl5+JzziJkzP+hXkvPqLa+az7f6ow0WWCqs81if+7mgE5i/GHSRgu
	MY10gfgr7RBWIo08iNEDWTVYlKBiOMdGCvSOM1fTk4Eac0ralE050roUZq80QcvWJBdykE/KQmgRF
	qx2F1q7AZ8pd2rVAxYWJPy9fZpxlzHkmBo/Wwp/9sQYOXVBY+rBhSFBxk+BnRgAKduAbj976LYI4S
	HJ0WdndWfo+iWymH7nhtu9to96NA+WRU2SfIHNKJX9k4ZxaGzDrbqqu6NdU9LoRO6nDdYTviH8B8w
	r2XlKEg2OiMiwzDDLvWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJErG-0000000BeT9-0z2k;
	Mon, 17 Jun 2024 16:05:26 +0000
Received: from qs51p00im-qukt01080501.me.com ([17.57.155.22])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJErD-0000000BeSN-1YTI
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jun 2024 16:05:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mac.com; s=1a1hai;
	t=1718640322; bh=ams6j7WKomm1oRicNJ1/r9gMg38ZDFI+xkZNs8TEMhU=;
	h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
	b=moyJRz09gh/fQP+v90FcVIfHpJirByHENxA081YTvOOLYbA11oxvR0WTUosty8AOT
	 NvU7uvj65AiHZG0QI1x6Q7YlxUl5NeoFJI7r8cXCNJf99gcQ8Pfem29LKpGN7kZrr7
	 twz1m3E1DlmKQz42PugunNL4enjg7KW49vZqrO2ECya2icCsQyQbe0sNayMmELANxS
	 HaANSg5minaQACXNUq/4pNXJph/e+9FeN670Nq2teEHKIIDfi8VuVw+5TKSFP3w9WO
	 OEuBHLSaszOJfU43oQe+7ttdQP/agxQdo/fyIPC6iXGEhZ9MLmgIFBd/cvsJyB18m1
	 5UCdxX031zW6g==
Received: from [172.20.144.3] (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])
	by qs51p00im-qukt01080501.me.com (Postfix) with ESMTPSA id B8B9E1980328;
	Mon, 17 Jun 2024 16:05:17 +0000 (UTC)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v2] ubi: gluebi: Fix NULL pointer dereference caused by
 ftl notifier
From: Gagan Sidhu <broly@mac.com>
In-Reply-To: <1641029267.251608.1718640023954.JavaMail.zimbra@nod.at>
Date: Mon, 17 Jun 2024 10:05:13 -0600
Cc: ZhaoLong Wang <wangzhaolong1@huawei.com>,
 chengzhihao1 <chengzhihao1@huawei.com>,
 dpervushin <dpervushin@embeddedalley.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 yangerkun <yangerkun@huawei.com>,
 yi zhang <yi.zhang@huawei.com>
Message-Id: <65E62DA3-EF16-44BD-8E51-E751BD2C496F@mac.com>
References: <CFAC276E-E652-40CD-B3D8-563B95E679A8@mac.com>
 <561660214.251562.1718638970757.JavaMail.zimbra@nod.at>
 <14779870-BA54-4ABF-8ABF-FF1D23D172A7@mac.com>
 <1641029267.251608.1718640023954.JavaMail.zimbra@nod.at>
To: Richard Weinberger <richard@nod.at>
X-Mailer: Apple Mail (2.3445.104.21)
X-Proofpoint-ORIG-GUID: buHqJC9Wi3ZoO48bM3PVXyOG_kezwdJU
X-Proofpoint-GUID: buHqJC9Wi3ZoO48bM3PVXyOG_kezwdJU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2406170125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_090523_493895_EABF3271 
X-CRM114-Status: GOOD (  14.43  )
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

aSBkb27igJl0IHRoaW5rIG15IGFydGljdWxhdGlvbiBpcyBjb3JyZWN0IGlmIHlvdSBpbnRlcnBy
ZXRlZCBpdCBhcyB0aGF0LgoKYXMgaSB1bmRlcnN0YW5kIGl0LCBnbHVlYmkgc2ltcGx5IG1ha2Vz
IGl0IGhhbmR5IHdoZW4geW91IGhhdmUgYSBmaWxlc3lzdGVtIHBhY2tlZCB3aXRoaW4gYSB1Ymkg
ZmlsZSwgYW5kIGl0IHdpbGwgdGFrZSB0aGF0IGZpbGUgYW5kIG1vdW50IGl0YXMgYSBibG9jayBk
ZXZpY2UuCgpzbyBpIHdvdWxkIHNheSBpdOKAmXMgbm90IE1URC0+VUJJLT5HTFVFQkktPk1URC0+
TVREQkxPQ0sKCml04oCZZCBzYXkgaXTigJlzIG1vcmUgTVRELT5HTFVFQkktPk1UREJMT0NLCgp0
aGF0IGlzLCB0aGUgc3F1YXNoZnMgKGFjdHVhbCBmaWxlc3lzdGVtKSBpcyBzaW1wbHkgd3JhcHBl
ZCBpbiBhIHViaSBmaWxlIGZvciBnbHVlYmksIHdoaWNoIHdpbGwgdGhlbiBtYWtlIGl0IGEgYmxv
Y2sgZGV2aWNlLgoKaeKAmW0gbm90IHVzaW5nIGFuIGFjdHVhbCBVQklGUyBhbnl3aGVyZSwgYXNp
ZGUgZnJvbSBzaXR0aW5nIHVuZGVybmVhdGggdGhlIHNxdWFzaGZzIHRvIGhhbmRsZSB0aGUgbWFw
cGluZyBmcm9tIHRoZSBzcXVhc2ggdG8gdGhlIG5hbmQgKHRvIGhhbmRsZSBiYWQgYmxvY2tzKS4K
CmUuZy4gaSBoYXZlIGEgcm9vdGZzIGluIGEgc3F1YXNoZnMgZmlsZQoJLWkgd3JhcCB0aGF0IHNx
dWFzaGZzIGZpbGUgaW50byBhIHNxdWFzaGZzLnViaQoJLWkgdXNlIGdsdWViaSB0byBkZXRlY3Qg
dGhpcyBzcXVhc2hmcy51YmkgZmlsZSBhcyBhIGJsb2NrIGRldmljZSBhbmQgbW91bnQgaXQKCnRo
YXTigJlzIGFib3V0IGl0LgoKClRoYW5rcywKR2FnYW4KCj4gT24gSnVuIDE3LCAyMDI0LCBhdCAx
MDowMCBBTSwgUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4gd3JvdGU6Cj4gCj4g
LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBWb246ICJHYWdhbiBTaWRodSIgPGJy
b2x5QG1hYy5jb20+Cj4+IHllcywgaSBoYXZlIGEgc3F1YXNoZnMgaW5zaWRlIGEgdWJpIHZvbHVt
ZSwgYW5kIGkgY3JlYXRlIHViaSBibG9jayBkZXZpY2UgZnJvbQo+PiBpdC4KPj4gCj4+IGkgZG8g
dXNlIGNvbmZpZ19tdGRfdWJpX2Jsb2NrIGJlY2F1c2UgdGhlIGZpbGVzeXN0ZW0gaXMgc3F1YXNo
ZnMuCj4+IAo+PiBzbyBpIHRoaW5rIGl04oCZcyBhZmZpcm1hdGl2ZSB0byBib3RoIHF1ZXN0aW9u
cy4gZ2x1ZWJpIGZvciB0aGUgYmxvY2sgZGV2aWNlIGZyb20KPj4gdGhlIHViaS5mcyBmaWxlLCB0
aGVuIGNvbmZpZ19tdGRfdWJpX2Jsb2NrIHRvIG1vdW50IHRoaXMgcmVhZC1vbmx5IGZpbGVzeXN0
ZW0KPj4gYXMgYSBibG9jayBkZXZpY2UuCj4+IAo+PiB0aGUgZW5kIHJlc3VsdCBvZiBib3RoIG9w
dGlvbnMgaXMgYSByZWFkLW9ubHkgYmxvY2sgZGV2aWNlIHRoYXQgY2FuIGhhbmRsZSBiYWQKPj4g
YmxvY2tzIG9uIG5hbmQgZGV2aWNlcy4KPj4gCj4+IGlmIGkgd2FzIHVzaW5nIGFuIE0yNVA4MCwg
aSB3b3VsZG7igJl0IGV2ZW4gYmUgdXNpbmcgdWJpLgo+PiAKPj4gc28gQ09ORklHX01URF9VQklf
e0dMVUVCSSxCTE9DS30gYXJlIGhhbmR5IGZvciBjYXNlcyB3aGVyZSB5b3UgbmVlZCBhbiBtdGQg
YmxvY2sKPj4gZGV2aWNlIHdpdGggYSByZWFkLW9ubHkgZmlsZSBzeXN0ZW0gd2hlcmUgdGhlIFVC
SSB0YWtlcyBjYXJlIG9mIHRoZQo+PiBpZGlvc3luY3Jhc2llcyB0aGF0IG1ha2UgTkFORCAoaW1v
LCBvZmMpIGluZmVyaW9yIHRvIFNQSQo+IAo+IElzbid0IE1URCAtPiBVQkkgLT4gR0xVQkkgLT4g
TVREIC0+IE1UREJMT0NLIHBlcmZvcm1hbmNlIHdpc2UgYSBuaWdodG1hcmU/Cj4gV2UgaGF2ZSBV
QklCbG9jayBmb3IgdGhpcyB1c2UgY2FzZS4KPiAKPiBUaGFua3MsCj4gLy9yaWNoYXJkCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
