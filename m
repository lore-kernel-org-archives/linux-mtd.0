Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513F5F433C7
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2026 05:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H4KOmUB9NzT3EmPwzAaGteN20jCf94WrKF32U8X5pw0=; b=Ct9qqKoHFOkXa8
	kGGyJEzXiJ3wM2tObhwV6z/N8QP85cVYIQYi5kGN1DVjg+3Fc8ayxDHfGhOsldkoh0qRViKjhPPY5
	RTGYKbCSe0P9L78ut4rAhn7Bbq9oSZQjay21Z7fKFyIEWhYOiu7qTPww7irX7PPjvPeGe2A8ObX9w
	fxDVx+O/sVsFdUj8ZF7vE7iaoFrHEISm5cpgTSqBOOTPQwjZPoL4hNLl9soqp7Pz0mq7xH50ehXWG
	XWeHEvumIBizVXAJ+i7vG8Zkxh0bywq75xZHfDtOqpwJERtuwINm9AAJHjFhuG3BhDGRPKF5pnu9G
	Usm/GGqZGyUU7EMK/VSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDEyl-00000001yX4-0so4;
	Thu, 16 Apr 2026 05:09:27 +0000
Received: from forward502d.mail.yandex.net ([2a02:6b8:c41:1300:1:45:d181:d502])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDEyh-00000001yWU-0Ol6
	for linux-mtd@lists.infradead.org;
	Thu, 16 Apr 2026 05:09:25 +0000
Received: from mail-nwsmtp-smtp-production-main-94.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-94.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:2646:0:640:add0:0])
	by forward502d.mail.yandex.net (Yandex) with ESMTPS id CC093C1A26;
	Thu, 16 Apr 2026 08:09:14 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-94.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id C9FRBhOSsmI0-c1GfcxIZ;
	Thu, 16 Apr 2026 08:09:14 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1776316154; bh=Tl+erE2uF1yR7VwzPTRIY/2Fja1UYKMSfEt+6vxNRaw=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=HvrEjysUuzw2t3jRDYqO95o2PYXFmvfUH6ZAaC8PHeUgWaZhm7lyJ0Xards87LHE6
	 zPHE0EtwPHKTMHUCmohw2Kp/pfrk/uhGFS4ZWg7/QosG207gzfFJpQ6fL0OSMQdBTH
	 vkH6crULGec3jlCa4r+MpoiuHXPJXN2SEIJMw51E=
Authentication-Results: mail-nwsmtp-smtp-production-main-94.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
Message-ID: <2f909ac5b916008033db7fd12804cf3e2a499e27.camel@yandex.ru>
Subject: Re: [PATCH v5 2/3] ubifs: use strscpy() and kmemdup_nul() where
 appropriate
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Zhihao Cheng <chengzhihao1@huawei.com>, Richard Weinberger
 <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
Date: Thu, 16 Apr 2026 08:09:12 +0300
In-Reply-To: <976f75c0-66a0-fc03-345e-3da0c1c5afea@huawei.com>
References: <20260415071812.1139054-1-dmantipov@yandex.ru>
	 <20260415071812.1139054-2-dmantipov@yandex.ru>
	 <976f75c0-66a0-fc03-345e-3da0c1c5afea@huawei.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_220923_686994_7347E227 
X-CRM114-Status: UNSURE (   8.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2026-04-16 at 11:37 +0800, Zhihao Cheng wrote:

> > -	memcpy(dent->name, fname_name(nm), fname_len(nm));
> > -	dent->name[fname_len(nm)] = '\0';
> > +	strscpy(dent->name, fname_name(nm), fname_len(nm) + 1);
> 
> Hi Dmitry,
> I notice that some architectures can accelerate the implementation of 
> memcpy(), and the length of dentry name could be 255, I suggest to keep 
> the orignal implementation.

What about

memcpy_and_pad(dent->name, fname_len(nm) + 1, fname_name(nm), fname_len(nm), 0)?

I have a strong suspicion that all of the '\0' things should be left to
library functions. So this is not a style but rather an overall design point -
if you're inserting '\0' at your own, most likely you're doing something
wrong, at least because you're duplicating something which is already
implemented in a library function.

Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
