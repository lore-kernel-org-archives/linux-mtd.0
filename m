Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293ABEB5976
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Feb 2026 08:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JDcUZ/zn7KDZjz2lp6QdtgnvVFyG+fABjsgUfMT+1rA=; b=rokcsxYuN1b3MmyVp5hFUEYNYt
	eYxdJuoMlfkuItTlzPrjxV3lDsMgUdb6T8FucDSa1M2IOm1IybgqBhq25HOMw4ZriMpMYjIiIoZWX
	ZOJENS1yNzERYePgAaLspeEaSBn7W+xFfHHcBgeN0Tz34r6xZRr4/u+XiF2NMUHESyMvmnNekvYxK
	48RAMeS6IL5VcJgSFrvyPrYRCK3Nq9ApEYLpKYqWZCezk0TLZMo7jVVsCA9yCXq37n8zPE6/qBf1O
	KLkNP7dYAv/PY/i7uZlcRgKvPis2fTPqnVxlNXu3eNf6XvlNa0mbi78mJU7ecCXIIc1YQLlhtkzHs
	ukZmZdpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq5rb-00000000OwX-0jcf;
	Wed, 11 Feb 2026 08:46:23 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq5rX-00000000Ow5-2OGP
	for linux-mtd@lists.infradead.org;
	Wed, 11 Feb 2026 08:46:21 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=qdcNhSHrowEuEYMYv+Z16qnzSkVK1+NEopaQdKqnxDM=;
	b=j8WrBdP/xe+yMdEgvaZ53beC+xEcFfXFOdoCpGa4QsLJjJg/jjFqb4ND53vskp8qHVpy9gxCi
	a/Li2K/ndYTAoTUwNAHDmmIAOUDE5klHVS0v8QDk8/Pi7W+KDUb1V2avGsvQ0aNBhxL4IpmE4IZ
	NselEtgkDUWSOlWWzSFr6Vc=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4f9sNT1DkQz1prRB;
	Wed, 11 Feb 2026 16:41:29 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id F2D4D40561;
	Wed, 11 Feb 2026 16:46:09 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 11 Feb 2026 16:46:08 +0800
Subject: Re: [PATCH] ubifs: prevent corrupted data write via
 error_remove_folio
To: <fan.yu9@zte.com.cn>, <richard@nod.at>
CC: <cui.jinpeng2@zte.com.cn>, <zhang.yue5@zte.com.cn>, <xu.xin16@zte.com.cn>,
	<yang.tao172@zte.com.cn>, <yang.yang29@zte.com.cn>,
	<hu.shengming@zte.com.cn>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260211154043158VVS6WEc8yD82HcqScmYUn@zte.com.cn>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <f800d3d3-4d57-f28c-bece-d95af0d22159@huawei.com>
Date: Wed, 11 Feb 2026 16:46:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20260211154043158VVS6WEc8yD82HcqScmYUn@zte.com.cn>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_004620_103874_2C194C11 
X-CRM114-Status: GOOD (  14.24  )
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

5ZyoIDIwMjYvMi8xMSAxNTo0MCwgZmFuLnl1OUB6dGUuY29tLmNuIOWGmemBkzoKPiBGcm9tOiBK
aW5wZW5nIEN1aSA8Y3VpLmppbnBlbmcyQHp0ZS5jb20uY24+Cj4gCj4gV2hlbiBhIG1lbW9yeSBj
b3JydXB0aW9uIGV2ZW50IHRyaWdnZXJzIG1lbW9yeV9mYWlsdXJlLCBleHQ0IHJlbGVhc2VzIHJl
ZmVyZW5jZXMgdG8gdGhlIGFmZmVjdGVkIGRpcnR5IHBhZ2VzLAo+IGVuc3VyaW5nIHRoYXQgbm8g
Y29ycnVwdGVkIGRhdGEgaXMgd3JpdHRlbiB0byBkaXNrLiBIb3dldmVyLCB1YmlmcyBjdXJyZW50
bHkgbGFja3MgdGhlIGVycm9yX3JlbW92ZV9mb2xpbyBjYXBhYmlsaXR5Cj4gYW5kIHRoZXJlZm9y
ZSBjYW5ub3QgcmVsZWFzZSByZWZlcmVuY2VzIHRvIGZhdWx0eSBwcml2YXRlIG1lbW9yeS4gQXMg
YSByZXN1bHQsIGNvcnJ1cHRlZCBkYXRhIG1heSBldmVudHVhbGx5IGJlCj4gd3JpdHRlbiB0byBm
bGFzaCBzdG9yYWdlLgo+IAo+IEFkZCBnZW5lcmljX2Vycm9yX3JlbW92ZV9mb2xpbyBzdXBwb3J0
IHRvIHViaWZzLCBwcmV2ZW50aW5nIGNvcnJ1cHRlZCBtZW1vcnkgZGF0YSBmcm9tIGJlaW5nIHBl
cnNpc3RlZCB0byBmbGFzaC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKaW5wZW5nIEN1aSA8Y3VpLmpp
bnBlbmcyQHp0ZS5jb20uY24+Cj4gU2lnbmVkLW9mZi1ieTogRmFuIFl1IDxmYW4ueXU5QHp0ZS5j
b20uY24+Cj4gQ2M6IFNoZW5nbWluZyBIdSA8aHUuc2hlbmdtaW5nQHp0ZS5jb20uY24+Cj4gLS0t
Cj4gICBmcy91Ymlmcy9maWxlLmMgfCAxICsKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQo+IAoKVGhlICdlcnJvcl9yZW1vdmVfZm9saW8nIHdhcyBpbnRyb2R1Y2VkIGluIGNvbW1p
dCAKMjU3MTg3MzYyMTIzZjE1ZDlkMSgiSFdQT0lTT046IERlZmluZSBhIG5ldyBlcnJvcl9yZW1v
dmVfcGFnZSBhZGRyZXNzIApzcGFjZSBvcCBmb3IgYXN5bmMgdHJ1bmNhdGlvbiIpIHRvIGRpc3Rp
bmd1aXNoIHRoZSBlcnJvciBoYW5kbGluZyAKYmVoYXZpb3IgYmV0ZXdlZW4gbWV0YWRhdGEgcGFn
ZSBhbmQgZGF0YSBwYWdlLiBGaWxlcycgZGF0YXBhZ2Ugd2lsbCBiZSAKdHJ1bmNhdGVkIGlmIG1l
bW9yeSBlcnJvciBoYXBwZW5zIGR1cmluZyBwYWdlIGNvcHkoZWcuIG1pZ3JhdGlvbiwgCm1tYXBf
Y293KS4gVGhlbiBzZXZlcmFsIGZpbGVzeXN0ZW1zKHdpdGggJy5taWdyYXRlX3BhZ2UnIGltcGxl
bXRlbnRlZCkgCnN1cHBvcnR0ZWQgaXQuIFNvLCBJJ20gZmluZSB3aXRoIHRoaXMgcGF0Y2guCgpS
ZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiBkaWZm
IC0tZ2l0IGEvZnMvdWJpZnMvZmlsZS5jIGIvZnMvdWJpZnMvZmlsZS5jCj4gaW5kZXggM2RjM2Nh
MS4uMzQ0NDViNyAxMDA2NDQKPiAtLS0gYS9mcy91Ymlmcy9maWxlLmMKPiArKysgYi9mcy91Ymlm
cy9maWxlLmMKPiBAQCAtMTYzMSw2ICsxNjMxLDcgQEAgc3RhdGljIGludCB1Ymlmc19zeW1saW5r
X2dldGF0dHIoc3RydWN0IG1udF9pZG1hcCAqaWRtYXAsCj4gICAgICAuZGlydHlfZm9saW8gICAg
PSB1Ymlmc19kaXJ0eV9mb2xpbywKPiAgICAgIC5taWdyYXRlX2ZvbGlvICA9IGZpbGVtYXBfbWln
cmF0ZV9mb2xpbywKPiAgICAgIC5yZWxlYXNlX2ZvbGlvICA9IHViaWZzX3JlbGVhc2VfZm9saW8s
Cj4gKyAgIC5lcnJvcl9yZW1vdmVfZm9saW8gPSBnZW5lcmljX2Vycm9yX3JlbW92ZV9mb2xpbywK
PiAgIH07Cj4gCj4gICBjb25zdCBzdHJ1Y3QgaW5vZGVfb3BlcmF0aW9ucyB1Ymlmc19maWxlX2lu
b2RlX29wZXJhdGlvbnMgPSB7Cj4gLS0KPiAxLjguMy4xCj4gLgo+IAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
