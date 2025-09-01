Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190ABCA0FF0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 08:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pC7uGzyAi91/uMa6N9srz/KlNYY5zsFAFV8DG6S0xIE=; b=O+ZHYmCmYeHTnZ
	Rlsyuk2w576kFLLlOtYTyMeQNvxqI72Dv2vWJqE1564j4BvS1ta1cbD9eUUxR2AhnNWh9sma/0Kse
	EG29LtIJTfSwntUDxSokIxG34XeQzxDstBgpG16EMiJvldbjpRNuDcwwI3cDeIcsvrPtlU3/Jvwyi
	LXZPZzq652U04OR7OkJRrF6UvQrugV6WT3rfsFf6p/LHlAzjSEeE+L8rJa67UEawMcgUZxxN9tJPj
	2YLQoTmNWDhDo5Ith+T76QHzrXvdpZrDvBuGulxF63nzL4g4YZir5eStZzZdMD9P5LWQJ5ZnH8R/5
	vV3syUiVJV/2aMQIP7cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uszc9-0000000BXYE-0nGd;
	Mon, 01 Sep 2025 08:10:09 +0000
Received: from mail.biznator.pl ([162.19.205.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uszRe-0000000BVTi-1u7m
	for linux-mtd@lists.infradead.org;
	Mon, 01 Sep 2025 07:59:19 +0000
Received: by mail.biznator.pl (Postfix, from userid 1002)
	id 5B47928B6D; Mon,  1 Sep 2025 09:56:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=biznator.pl; s=mail;
	t=1756713430; bh=h3k5zkAZf6tEpPtEQC0QHe2u0TTQ7ZFRjUanCKLrdLo=;
	h=Date:From:To:Subject:From;
	b=I0Vz+AoF+1sRsOYBfgJibM/YFZz5/RdBxannml5kYRGTNRJQLREA3G6yga2QsvMLN
	 aQuk9u1NQvekdNhvtGalADkx64kyBLsAqlcMMETIVBykWvfBAg0/eimrY30+czVxh7
	 v4/t/vWA0LUXoDB6YKi6znV4qpMwbbSfW/oJd/3JHgkC9IFlZz+3VwtgF93fjxsxFf
	 clDTq3o625dSE9gIHmCG9zu2JQKVvJz7IR4NH2rlxyLI21BCFpdVtDJYaoVyqKO0nk
	 64W5e8D3yjJpEDTxnzN5bm7GVojwX8+zcrB5SWjVXiue4G3A1eYUwWRolB0vfNCzHf
	 Wxfz6fWREW5aA==
Received: by mail.biznator.pl for <linux-mtd@lists.infradead.org>; Mon,  1 Sep 2025 07:55:57 GMT
Message-ID: <20250901084501-0.1.je.1pf2t.0.8v6vqkopmh@biznator.pl>
Date: Mon,  1 Sep 2025 07:55:57 GMT
From: "Wojciech Mroczka" <wojciech.mroczka@biznator.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Fotowoltaika dla firm
X-Mailer: mail.biznator.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_005918_636237_696857EB 
X-CRM114-Status: UNSURE (   1.90  )
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

RHppZcWEIGRvYnJ5LAoKcG9tYWdhbXkgbWlrcm8sIG1hxYJ5bSBpIMWbcmVkbmltIHByemVkc2nE
mWJpb3JzdHdvbSBvYm5pxbx5xIcga29zenR5IGVuZXJnaWkgZWxla3RyeWN6bmVqIGR6acSZa2kg
bW9udGHFvG93aSBpbnN0YWxhY2ppIGZvdG93b2x0YWljem5lai4gCgpBa3R1YWxuaWUgcHJvcG9u
dWplbXkgYmV6a29ua3VyZW5jeWpuZSB3YXJ1bmtpIHdzcMOzxYJwcmFjeSwgb2QgcGxhbnUgcG9w
cnpleiByZWFsaXphY2rEmSBhxbwgcG8gc2Vyd2lzLgoKUHJvc3rEmSBvIGluZm9ybWFjasSZIGN6
eSBtb8W8ZW15IHByemVkc3Rhd2nEhyBwcm9wb3p5Y2plIGRsYSBQYcWEc3R3YSBmaXJteT8KCgpQ
b3pkcmF3aWFtLApXb2pjaWVjaCBNcm9jemthCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
