Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B813D7237B
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Jan 2026 11:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=osOL4IQ+UGMDSoQAHljzNSRRz5PveGO5AR66xUTOONU=; b=LYCi5rMk3QjnQo
	aLwH3DxmftAdOqTzVFFaPPCgT7jKJmnlzev3mDIWP57XOjdUXJI/nM6KTzsjUxWCNnsDJHke7ivGY
	9eEu+ZS9yk4ZyV9+9yAJQgB9X6YQnpXHgx4Logz3hgSrZCMwx+sixmC3EGpOXS9VVU9niEMKW7/yL
	kaPFwLhgCue4sCPLZQNkizsts0TmxcHDz774ju7SaEUwAJDsQXYAkJkqPM9ZnsPcKuAZPcdGbMHrM
	Nv9xyzDfGQLPPevJYgbFley/OTUql2uXsu/4eidhCCMjsU08XLurWbzk5Jg3SK46ZJejLIBfMxPO9
	n14hULUB7gwI35RkHnIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjFhE-00000008sMv-1FEo;
	Fri, 23 Jan 2026 11:51:24 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjFhC-00000008sMb-10h7
	for linux-mtd@lists.infradead.org;
	Fri, 23 Jan 2026 11:51:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1769169060; x=1769773860; i=markus.elfring@web.de;
	bh=TzU9xD3oV/1LCdwLy1ry5QqFnVkP5HyKAcKNec9gyOg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hyho3ybJBUEJPC4hHRZY7KES6sXfSBq81PvQwHN5G2IyTZOl2F1/ki6WF8BLsKKM
	 BxeCLR2XBTVCVHKKxIg0jQaM/z/ZRNc9JrR5tgURb9+m3sGK1b/fJSvZtGgTTVi4l
	 eDw2eZgWRarwIOugeHVqjvhn7Vc4RgjWcTqwysl9/2/RLVJ+394DZt0fQ28Njx4Dx
	 qQQFBpJR/Ns43SzeZp0InpvCgpZ0lHX4dp0mLCEcliB2DDah2lh1VJoBo1bHQ1kEY
	 Y8/x8ldY2BhgK22GgSJ2+hQV9lDLBiDtCz5GnGvcd+FyPjrr+6+ll5+7nAtbICUU1
	 O15OMbL6WS+KWm33ZQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.224]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mft7t-1wG8fl1lzV-00lmUy; Fri, 23
 Jan 2026 12:51:00 +0100
Message-ID: <ab9b27c8-3353-465b-8469-b471aa058c00@web.de>
Date: Fri, 23 Jan 2026 12:50:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Weigang He <geoffreyhe2@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <20260123052608.668207-1-geoffreyhe2@gmail.com>
Subject: Re: [PATCH] mtd: parsers: ofpart: fix OF node refcount leak in
 parse_fixed_partitions()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260123052608.668207-1-geoffreyhe2@gmail.com>
X-Provags-ID: V03:K1:KtU17WPvihG0ib30DbDKTHXQFAH5Cpaz5bnZPUI04tMCeZ7XXT/
 XcEhlYvZILFchB05B39irnI8TbnvkBSQsO4TjVfsO3XNnAIIg4zQhysVZWrMk/pThS9ua3f
 BOBL+nswuSNg9oTSV4otI5zgs+Pb1cB+XW2pB589tt6eaB40P/HeHOcTpdN6jR+cFFaJKpR
 7MdhyTG5nGYf0TNnGaYtQ==
UI-OutboundReport: notjunk:1;M01:P0:m25zhlbOvDw=;zSTwwKkypV/GOmRkmdt9LI8uRP9 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 ppuqBnQc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_035122_558350_02EE7F64 
X-CRM114-Status: UNSURE (   4.48  )
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

4oCmCj4gQWRkIG9mX25vZGVfcHV0KG9mcGFydF9ub2RlKSBjYWxscyBvbiBhbGwgZXhpdCBwYXRo
cyB3aGVuIGRlZGljYXRlZCBpcwo+IHRydWUgdG8gZml4IHRoZSByZWZlcmVuY2UgY291bnQgbGVh
ay4KPiAKPiBUaGlzIGJ1ZyB3YXMgZGV0ZWN0ZWQgYnkgb3VyIHN0YXRpYyBhbmFseXNpcyB0b29s
LgoKV2lsbCBhbnkgYWRkaXRpb25hbCBiYWNrZ3JvdW5kIGluZm9ybWF0aW9uIGJlY29tZSBtb3Jl
IGhlbHBmdWwgaGVyZT8KClJlZ2FyZHMsCk1hcmt1cwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
