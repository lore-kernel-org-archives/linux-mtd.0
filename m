Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039E8CAC59A
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Sep 2025 08:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pC7uGzyAi91/uMa6N9srz/KlNYY5zsFAFV8DG6S0xIE=; b=jRhB53InqrB8C5
	FpcAMRIiG42DQeyMA+JwG7H9Olps26/9qsTI4ZKcG4d53YuQtV8KPscMqu/uzIloNDDcPo4qZeDpe
	5cmckPzGnRmmTyq3smoCPxxdkAf6nRRgdYofQhgTphL27VTWYGT0yh5sHxF3wE/69VaTOvHS2jI8m
	p7CVmU1DVTCgeGVv5FYQ7/XuJszprYm7Ibu1w2Y8d9upH16Ce+G06+Aq8H4jjVFWenGArZa4x+BGy
	Dn2a3ssN8GYHzT3abAgNKgJrtJtwPDbmdXHjkwEdmjEYfqN5L0Pv8rWs0x2iW6fqvPs/0JgU+Osnw
	Xb5Aehx+VN+y9Q31mEFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzWAf-00000002CJ8-1cOr;
	Fri, 19 Sep 2025 08:08:45 +0000
Received: from mail.biznator.pl ([162.19.205.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzWAc-00000002CIS-1o5r
	for linux-mtd@lists.infradead.org;
	Fri, 19 Sep 2025 08:08:43 +0000
Received: by mail.biznator.pl (Postfix, from userid 1002)
	id B60AF2B41B; Fri, 19 Sep 2025 10:00:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=biznator.pl; s=mail;
	t=1758268871; bh=h3k5zkAZf6tEpPtEQC0QHe2u0TTQ7ZFRjUanCKLrdLo=;
	h=Date:From:To:Subject:From;
	b=Rw/TeBCPvMHZcAK/EQnTfz5E3jQ+YrYgDK8L0Na0mS8QySgeeuu4/v0Uu05rTAfat
	 FP7wiKMviwx9pn7dwHeyV5z12Wzk6Uxln82p1ApmuI3MCIqkgppIDXFzdaRG9BdVG/
	 BpH7sV+MU6UIchqOo+tWK52Zqq3/4HcVDWqW6293upDlAFkFpGTdmizhMZ4V8EtwNz
	 gwH+V9Vr/t36ZiEkO9yeNfIs7vH7GCN4Ar6dGtEMic+tol0EcT17AxBP16rVfRqJdJ
	 ByFeICSdY/fY4a9udidRuNXruLdctQ2RIoIX64zMq8CUj2B1XcqcTJlZtWZJxRxTPf
	 VGIR3ss3C2XJg==
Received: by mail.biznator.pl for <linux-mtd@lists.infradead.org>; Fri, 19 Sep 2025 08:00:34 GMT
Message-ID: <20250919084500-0.1.js.1xyjj.0.zdo0fto6fm@biznator.pl>
Date: Fri, 19 Sep 2025 08:00:34 GMT
From: "Wojciech Mroczka" <wojciech.mroczka@biznator.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Fotowoltaika dla firm
X-Mailer: mail.biznator.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_010842_612629_DE4B127B 
X-CRM114-Status: UNSURE (   1.45  )
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
