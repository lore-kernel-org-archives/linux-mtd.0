Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FFBCA0FE6
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Sep 2023 06:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yVEzKdQwBN9p6BGLKCM6IUnBIaewbwakAaguIs1nAGw=; b=1LkZiIPR/aiR5OM9FXoeVz+Cl2
	jte9RMla/fGbixlku4hdIaxCb4qN8rVrYb2c7X1fzCRsWCXvvR4QWtCmpxN46+LTXdWE7hrGtmUOF
	hjJO3HLuPfVVnYaZYflvCEJw9zLW9xCbrikiUBc0tWbRdX6/OVrZBaA9ctnTyuMMxt+yA8iU1zsEL
	hb2lW1x3Ildiqi5Cddyuqo/V9Gu1YsedojE4+lvgarZXaB2G8hL8J2VITxq1HZzSbNYignM9y+AuF
	it5eY+k2BBNXZ88rz0JYeNambJSvPSvYXLv5rE+oCYBXyvqHVt50XXMmderx/z75rC43tGAIxuBpj
	RFLP2P1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbxTV-00GXAq-0G;
	Fri, 01 Sep 2023 06:17:45 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbxTQ-00GXAO-2H
	for linux-mtd@lists.infradead.org;
	Fri, 01 Sep 2023 06:17:42 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0B501644A8E0;
	Fri,  1 Sep 2023 08:17:33 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id HdVH8XP0BnSl; Fri,  1 Sep 2023 08:17:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 6391F644A91C;
	Fri,  1 Sep 2023 08:17:32 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id EXgscmeCuwfP; Fri,  1 Sep 2023 08:17:32 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4187B644A8E0;
	Fri,  1 Sep 2023 08:17:32 +0200 (CEST)
Date: Fri, 1 Sep 2023 08:17:32 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: Jan Kara <jack@suse.cz>, linux-mtd <linux-mtd@lists.infradead.org>, 
	Yu Hao <yhao016@ucr.edu>
Message-ID: <846006722.3371.1693549052133.JavaMail.zimbra@nod.at>
In-Reply-To: <742eaa4e-3b74-5dc5-cf0a-71940b945133@huawei.com>
References: <20230831111100.26862-1-jack@suse.cz> <742eaa4e-3b74-5dc5-cf0a-71940b945133@huawei.com>
Subject: Re: [PATCH] ubi: Reject device with erasesize 0
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: Reject device with erasesize 0
Thread-Index: VTclE86kmsb/2Uq+73l9Iv84NF6H2Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_231740_956660_178FA7D2 
X-CRM114-Status: UNSURE (   7.43  )
X-CRM114-Notice: Please train this message.
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvQ0Er
VUJjdERzSFJwa0xHNXBwZGl1VjhNc240RHgtWkoyeERyeGZhNDhWTWI3WkUreEJBQG1haWwuZ21h
aWwuY29tCj4+IFNpZ25lZC1vZmYtYnk6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+Cj4+IC0tLQo+
PiAgIGRyaXZlcnMvbXRkL3ViaS9idWlsZC5jIHwgMyArKysKPj4gICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspCj4+IAo+PiBJdCBkb2Vzbid0IHNlZW0gdGhlIGRpc2N1c3Npb24gbGlu
a2VkIGFib3ZlIGNvbmNsdWRlZCBpbiBhIHBhdGNoLiBTbyBpcwo+PiBhbnl0aGluZyB3cm9uZyB3
aXRoIHRoZSB0cml2aWFsIGFwcHJvYWNoIGhlcmUgc28gdGhhdCB3ZSBjYW4gY2xvc2UgdGhlIGlz
c3VlPwo+IAo+IFRoZXJlIHdhcyBhIHBhdGNoLCBzZWUKPiBodHRwczovL3BhdGNod29yay5vemxh
YnMub3JnL3Byb2plY3QvbGludXgtbXRkL3BhdGNoLzIwMjMwNDIzMTExMDQxLjY4NDI5Ny0xLWNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tLwoKSG1tLCBsZXQgbWUgY2hlY2sgdGhlIHBhdGNoIHN0YXR1
cyBvZiB0aGF0IG9uZS4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
