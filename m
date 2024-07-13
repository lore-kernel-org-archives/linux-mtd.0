Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4005FC3DA45
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Jul 2024 09:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S0Ax/mFxT2XFa9UnY8NVBwOVyKB9t1ywOBF7Ss39QLc=; b=Vv8Awk6zPDHdD1aNACTxJPnRBv
	KwgKhyoXCVNWIBohPi9msoXfBn/U1tUZwDZ/j7WYRpcJrnpmNUgyz3UWwx/l5aTk0bLF0YeyDNYm3
	1fe3dz6wiIZpQBJlMAHjj3Vo6oXPjiPLbI+uJR2DTmbjTAZ0v9wRCmqtTl4Vppiu2o/r97fwsPrYX
	OOY/KlNOFY26cFyXGbIgL0+uhmks7a34njjtQVhOdHphOsz+mjdeMUgGQ0sEgv8zHtJ6s69pEftPY
	HCsyl/JJgcSG4hc+UDfn/WAndlvB/Npy86FbVw1kMtAIq+hUOFaMAVggMHgpezUkcp73FWlsbiB/b
	cR39svqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSYf2-00000002EAC-2Y9T;
	Sat, 13 Jul 2024 09:03:20 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSYeo-00000002E4j-30Mc
	for linux-mtd@lists.infradead.org;
	Sat, 13 Jul 2024 09:03:18 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WLj7Q2TZ5zQlPP;
	Sat, 13 Jul 2024 16:58:58 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 605BA180088;
	Sat, 13 Jul 2024 17:02:57 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 13 Jul 2024 17:02:56 +0800
Subject: Re: [PATCH] ubi: Fix ubi_init() ubiblock_exit() section mismatch
To: Richard Weinberger <richard@nod.at>
CC: linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, Ben Hutchings <bwh@kernel.org>, kernel test
 robot <lkp@intel.com>
References: <20240713073519.25325-1-richard@nod.at>
 <3c624cf1-b5a3-f89c-ac6a-0875fcabaf25@huawei.com>
 <1422580650.65606.1720860390692.JavaMail.zimbra@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <9a210424-eac1-957e-dd6e-4290924216e3@huawei.com>
Date: Sat, 13 Jul 2024 17:02:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1422580650.65606.1720860390692.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240713_020307_105618_7BD4C0AF 
X-CRM114-Status: GOOD (  14.27  )
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

5ZyoIDIwMjQvNy8xMyAxNjo0NiwgUmljaGFyZCBXZWluYmVyZ2VyIOWGmemBkzoKPiAtLS0tLSBV
cnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4+IFZvbjogImNoZW5nemhpaGFvMSIgPGNoZW5nemhp
aGFvMUBodWF3ZWkuY29tPgo+PiBBbjogInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4sICJsaW51
eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4KPj4gQ0M6ICJsaW51eC1rZXJu
ZWwiIDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPiwgIkJlbiBIdXRjaGluZ3MiIDxid2hA
a2VybmVsLm9yZz4sICJrZXJuZWwgdGVzdCByb2JvdCIgPGxrcEBpbnRlbC5jb20+Cj4+IEdlc2Vu
ZGV0OiBTYW1zdGFnLCAxMy4gSnVsaSAyMDI0IDEwOjE2OjE1Cj4+IEJldHJlZmY6IFJlOiBbUEFU
Q0hdIHViaTogRml4IHViaV9pbml0KCkgdWJpYmxvY2tfZXhpdCgpIHNlY3Rpb24gbWlzbWF0Y2gK
PiAKPj4g5ZyoIDIwMjQvNy8xMyAxNTozNSwgUmljaGFyZCBXZWluYmVyZ2VyIOWGmemBkzoKPj4+
IFNpbmNlIHViaWJsb2NrX2V4aXQoKSBpcyBub3cgY2FsbGVkIGZyb20gYW4gaW5pdCBmdW5jdGlv
biwKPj4+IHRoZSBfX2V4aXQgc2VjdGlvbiBubyBsb25nZXIgbWFrZXMgc2Vuc2UuCj4+Pgo+Pj4g
Q2M6IEJlbiBIdXRjaGluZ3MgPGJ3aEBrZXJuZWwub3JnPgo+Pj4gUmVwb3J0ZWQtYnk6IGtlcm5l
bCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+Pj4gQ2xvc2VzOgo+Pj4gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDI0MDcxMzE0MDMud1pKcGQ4bjItbGtwQGludGVs
LmNvbS8KPj4+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2Qu
YXQ+Cj4+PiAtLS0KPj4+ICAgIGRyaXZlcnMvbXRkL3ViaS9ibG9jay5jIHwgMiArLQo+Pj4gICAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IExvb2tz
IGxpa2UgdGhhdCB5b3UgcHJlZmVyIGEgc2ltcGxlciBmaXguIEZlZWwgZmluZSB0byBhZGQKPiAK
PiBZZXMsIGFuZCBCZW4gc2VudCB0aGUgcGF0Y2ggZmlyc3QuIDopCj4gICAKPj4gUmV2aWV3ZWQt
Ynk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4gCj4gVGhhbmtzIGZv
ciB0aGUgcmV2aWV3IQo+IEFuZCBlc3BlY2lhbGx5IHRoYW5rcyBmb3IgcmV2aWV3aW5nIHNvIG1h
bnkgVUJJL1VCSUZTIHBhdGNoZXMsCj4gSSBhcHByZWNpYXRlIHlvdXIgaGVscC4KCllvdSdyZSB3
ZWxjb21lLgpCVFcsIEkgaGF2ZSB0d28gZmF2b3JzIHRvIG5lZWQgeW91ciBoZWxwLgoxLiBHaXZl
IG1lIHNvbWUgZmVlZGJhY2tzIGFib3V0IHRoZSBmc2NrLnViaWZzIHBhdGNoIHNlcmllcyAKW2h0
dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC1tdGQvbGlzdC8/c2VyaWVz
PTQwOTkzNV0sIAptYXliZSB5b3UgaGF2ZSBzdGFydGVkIGxvb2tpbmcgYXQgdGhlbS4gSSBrbm93
IGl0IGlzIGEgaHVnZSByZXZpZXdpbmcgCndvcmssIG1heWJlIHlvdSBjYW4gc3RhcnQgd2l0aCB1
c2luZywgdGVzdGluZyBvciByZWFkaW5nIHRoZSBkb2N1bWVudHMuCjIuIEkgcmVwb3J0ZWQgYSAK
QlVHW2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWV4dDQvMzQ2OTkzZjItODdmNi1lMjBm
LThmNWEtZDE5Zjg0YzE2MDRjQGh1YXdlaWNsb3VkLmNvbS9ULyNtMzY4MjU2NzFiMDE4ODgwY2Ex
N2U0YzA5M2E0ZGJmYzFiNjZkNWRiOF0gCnJlY2VudGx5LCBwbGVhc2UgbGV0IG1lIGtub3cgaWYg
eW91IGhhdmUgYSBnb29kIHNvbHV0aW9uLgoKPiAKPiBUaGFua3MsCj4gLy9yaWNoYXJkCj4gCj4g
Lgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
