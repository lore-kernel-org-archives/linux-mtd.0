Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32FE2C433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 04:11:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E588B60F58
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 04:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E588B60F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=Nutricia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:From:To
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FS92iJVTgzSENH1/EJ829qXsAI7b+rB0GtgNzxpHJEU=; b=g7bSWFB5QkKynQ
	t6j+AFqTLL3lJikqGBJGUWI04083tGahXasb52Yf77sKJlGOTRp6+rjfLxvaLJYXz2sYVCXtD/IJ7
	+2F+LqDa/fx2U3IzFij1lT1gMUznt+zlX9mFb7BqbrK6KcO0kpxUGodj58NSQpk5+HdIlsOlPqys4
	Dfl3e0D53Aj307DuuYbAcb+sAFs/EaJEP0XY+T8LCBaWaOpOcLrTbhuhpxEVmV1Nbjms2rTDBxlg+
	j7pNvT3tYqy5HWyyT45A4hGd1sTsQl1YfHlje998TcnvujFKLcj9TjFbOsyqOVJ3qjBVvs9Ahuly0
	AsR4WUOvaP3LSKX8gAcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlNtr-009Kme-FJ; Fri, 12 Nov 2021 04:10:51 +0000
Received: from a27-29.smtp-out.us-west-2.amazonses.com ([54.240.27.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlNtf-009Klp-Cb
 for linux-mtd@lists.infradead.org; Fri, 12 Nov 2021 04:10:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1636690237;
 h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID;
 bh=ceFAmHBwf0VLu+PPayYXR38uBqLXqlKsllE8zBsRaV4=;
 b=WoxI+ipbk84bCWiAmodbKhBkbw7Ds/Hh3EFYSozM6lspN15LIJM53nWXskXZOz4P
 7M3zQqwQW9BEnU9Sdli1c8fw3uSg0whpf8REwbuPMVGuHd/2/r3HTt+08K4shhCupWZ
 gzDUmuCazc/nvWhPHVR7P6A8CLCWKSEN3T3GXfyk=
Date: Fri, 12 Nov 2021 04:10:37 +0000
To: linux-mtd@lists.infradead.org
From: Neocate WebSite <CustomerService@Nutricia.com>
Subject: Feedback: jla9p9
Message-ID: <0101017d125717b1-70b58c95-dce6-49de-b700-d3ef6657b0e4-000000@us-west-2.amazonses.com>
X-Mailer: PHPMailer 5.2.27 (https://github.com/PHPMailer/PHPMailer)
MIME-Version: 1.0
X-OriginalArrivalTime: 12 Nov 2021 04:10:37.0157 (UTC)
 FILETIME=[3F2CD150:01D7D77B]
Feedback-ID: 1.us-west-2.1bQBLq95eoJ95e7AoFYAtfy7MGNEuuwPNthqtDHz6Bo=:AmazonSES
X-SES-Outgoing: 2021.11.12-54.240.27.29
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_201039_481545_530D1F45 
X-CRM114-Status: UNSURE (   1.09  )
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

RnJvbTog4p2k77iPIEFsaWNlIHNlbnQgeW91IGEgSE9UIHZpZGVvISBDbGljayBIZXJlOiBodHRw
Oi8vYmV0b253ZXJrZW5kZWpvbmdlLm5sL3dwLWNvbnRlbnQvcGx1Z2lucy9mb3JtY3JhZnQvZmls
ZS11cGxvYWQvc2VydmVyL2NvbnRlbnQvZmlsZXMvMTYxOGI5Mjk3MjI4MjAtLS1jb25maXJtLnBk
Zj9rOHp2IOKdpO+4jyAzbzIwanUxIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4KU3Vi
amVjdDogamxhOXA5ClBob25lOiA5NDE3NjgzMDM1OTIKTWVzc2FnZTogZjVmYnpxCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
