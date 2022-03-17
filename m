Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7064FC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Mar 2022 22:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=t1OFnHunmxQJ7huSF5TNEcQm/q88gslGftfnqYRxXek=; b=iI3vRWN6eTcxGLAqGcgJPVIPOl
	oyg5LrikX3SO82jHJjMJOmsJ0G0GgskoNzRVp3QL/9JQjiVqsGgJlqLwD3PNl2PdHHW6CsI44n+hh
	6BcJQKNi2kUfPVR5JFA6QPeRQCAiAhHg0o4/rsLJ9x2pV7+DHlMus3WojpsyN4eegIlD8ZTD7YF6h
	dhXXWhhIp0I+EGu5tpRBceMZeBxamI2LdaR6MVd/vHti8LdZcL7xR28qkZIcMlEuKgT+kQr7UGS/t
	d63ikwGirJTQKSvmSYUEttfBRKNw8/2aU/gGbdSNQ+w9jTOWr/bHZiav6XKyyVBTX/xrS+wTy2oC7
	XF+tftVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUyiB-00HX81-3H; Thu, 17 Mar 2022 22:35:15 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUyi8-00HX6m-CV
 for linux-mtd@lists.infradead.org; Thu, 17 Mar 2022 22:35:13 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 9F3756081112;
 Thu, 17 Mar 2022 23:35:01 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id nVRRisT8TJYL; Thu, 17 Mar 2022 23:35:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 3C6A56081110;
 Thu, 17 Mar 2022 23:35:01 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id r1KNl6A7pLtB; Thu, 17 Mar 2022 23:35:01 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 180AA6089354;
 Thu, 17 Mar 2022 23:35:01 +0100 (CET)
Date: Thu, 17 Mar 2022 23:35:00 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: libaokun <libaokun1@huawei.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 yukuai3 <yukuai3@huawei.com>, chengzhihao1 <chengzhihao1@huawei.com>
Message-ID: <2008739324.156347.1647556500875.JavaMail.zimbra@nod.at>
In-Reply-To: <a4f8bfff-26ee-95f8-db3c-91ca860a32bd@huawei.com>
References: <20220215040736.2839939-1-libaokun1@huawei.com>
 <dc55e8b3-7d22-6024-374d-4ed126e18c42@huawei.com>
 <157336576.152785.1647468012272.JavaMail.zimbra@nod.at>
 <a4f8bfff-26ee-95f8-db3c-91ca860a32bd@huawei.com>
Subject: Re: [PATCH -next] ubifs: rename_whiteout: correct old_dir size
 computing
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: rename_whiteout: correct old_dir size computing
Thread-Index: CY5uA77SPI4VOph1RsZDxVqHFhcrLg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_153512_602909_8B7F896F 
X-CRM114-Status: UNSURE (   1.33  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImxpYmFva3VuIiA8bGliYW9r
dW4xQGh1YXdlaS5jb20+Cj4+Pj4gKwo+Pj4+ICsJCS8qIEFkZCB0aGUgb2xkX2RlbnRyeSBzaXpl
IHRvIHRoZSBvbGRfZGlyIHNpemUuICovCj4+Pj4gKwkJb2xkX3N6IC09IENBTENfREVOVF9TSVpF
KGZuYW1lX2xlbigmb2xkX25tKSk7Cj4+IFNvIHlvdSBiYXNpY2FsbHkgcmVzZXQgb2xkX3N6IGJh
Y2sgdG8gMD8KPiBZZXMsIHJlc2V0IG9sZF9zeiB0byAwIGhlcmUuCgpPa2F5LCBtYWtlcyBzZW5z
ZS4gUGF0Y2ggYXBwbGllZC4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
