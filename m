Return-Path: <SRS0=6QP0=LQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16563C2B9F4
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jun 2021 07:26:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3D1F60FD8
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jun 2021 07:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3D1F60FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=f1OPvQWrTwaKkdPzY3SNdrOnN+7sd0gCjhEkzXXnAy4=; b=06+aPsypuWTB7BLtl3cehkOmbb
	LKIBPCuD/i/VjRn9sC/6TN0XpdpdVue7+lUgSztxR1tcURuVDeiIHEXdjTL7gtnpNuPH8tXWEfm3I
	OMH4aiEJohmO4I2hF5gANUL5FFQ8XhOBdmG1PXQ5tUhnxw6WGTTq6yI6YDwEYpSSqgRskOCqY3dQp
	OZkiIg9pzL8uTWUOT8nIgpvSleEf9pQ63cztSDftcIqbv4WZYYpI11ha6XSybqshXLC2+rehYk3cy
	GqfeK0Fa6VTThuExPApw39nG4MDM9Rbq8Pb6lt2amUsOMlizQCh8KzXuEK3IdYTCW/YVB0WTqQY4j
	m+/YGOTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvang-0060Ni-5V; Tue, 22 Jun 2021 07:26:24 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvand-0060MR-Cb
 for linux-mtd@lists.infradead.org; Tue, 22 Jun 2021 07:26:22 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 2553860A59CD;
 Tue, 22 Jun 2021 09:26:20 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id gnEp7wI087K7; Tue, 22 Jun 2021 09:26:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id D845E60A59DE;
 Tue, 22 Jun 2021 09:26:19 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id hJjPVIp0vUEK; Tue, 22 Jun 2021 09:26:19 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id B844D60A59CD;
 Tue, 22 Jun 2021 09:26:19 +0200 (CEST)
Date: Tue, 22 Jun 2021 09:26:19 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, 
 Colin Ian King <colin.king@canonical.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 kernel-janitors <kernel-janitors@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1855987833.142283.1624346779725.JavaMail.zimbra@nod.at>
In-Reply-To: <20210622064419.GJ1901@kadam>
References: <20210621152249.20901-1-colin.king@canonical.com>
 <f2ea606a-4a05-8d14-4380-d96ca0f981a1@huawei.com>
 <20210622064419.GJ1901@kadam>
Subject: Re: [PATCH] ubifs: Remove a redundant null check on pointer lp
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Remove a redundant null check on pointer lp
Thread-Index: LtxiwfRXOC2sFlJZKjZSpX+xuqDRmg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_002621_623205_39B120EA 
X-CRM114-Status: UNSURE (   4.46  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFVnaC4uLiAgSSdtIHNvIHNvcnJ5LiAg
TXkgcGF0Y2ggd2FzIGNsZWFybHkgd3JvbmcuICBJJ3ZlIHRyaWVkIGJlZm9yZSB0bwoKTm8gbmVl
ZCB0byB3b3JyeS4gOikKCj4gYWRkIGEgU21hdGNoIGNoZWNrIHdoaWNoIHdhcm5zIGFib3V0IGR1
cGxpY2F0aXZlIE5VTEwgY2hlY2tzLCBidXQgSQo+IHRoaW5rIHRoaXMgZ2l2ZXMgbWUgYSBuZXcg
aWRlYSB0byB0cnkuICBIb3BlZnVsbHksIGl0IHdpbGwgcHJldmVudCB0aGlzCj4gaW4gdGhlIGZ1
dHVyZS4KClNvdW5kcyBncmVhdCEKClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
