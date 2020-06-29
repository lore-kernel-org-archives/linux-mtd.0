Return-Path: <SRS0=cYNo=AK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E552FC433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 06:49:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EDD323134
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 06:49:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vQYo11M4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JAjIpkG1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EDD323134
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=thorsis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGH3OVXUODDSCw9a2T3Nw666aru3lTDdOUIouMQpE8c=; b=vQYo11M4G0KuGpiV7jjIq7rHMS
	6YHL9gcLFgnqPoPexyWd8jwPMWH8QpwmiTrzV4yykAcXRVUT3gWMIKqYnh8VmJ+F9mol5qqMowNUE
	BSFuSyrb/1uQuhWTOxeMihvaZdQKVCkRr3p/kIEf4/+60YXBqdxQ9WaHygDoyN3mrfp8mNexcszQp
	SMzWQEwmm2GA+HpBPHEiQdW8K33+Pd7zZ4ekCGtdVD+ogQJSJkcHeD8CvZtR80e37fZRt0EJJJtVQ
	TKjhTaU6z3oxOh/O+8/grQWwD7JAYgVr1MdBqapgMwaySP+20nF1qLrpF3KJnzl+f2linAnhAtWnw
	7kQ4QB9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpnYu-0004hf-S0; Mon, 29 Jun 2020 06:46:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpnYt-0004hV-Gz
 for linux-mtd@merlin.infradead.org; Mon, 29 Jun 2020 06:46:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-ID:Content-Description;
 bh=2VxUkTuMy46VGBgdzXVJXrBwy0Xps7g/LO8DVdbTqoc=; b=JAjIpkG12BnE1x8NktU5ax+Kz8
 VzNa2f+CGFEnAityEmgBnMWIdqc0T7cvvnXq5kjF/VSWPQ7v03YuowKxA5hulHwdIzWoQnl7xQ4Zr
 rCFbqcybVoHPBZB1Bo5QmGARQ2RyIaHimHzhS1n4herRqMpstDaCQl+8Oo1pf5S5GNuLo+RGOIPwO
 /8b/yohQMwwIu4GDKq0ocTaHD20sL5yDPR0/IUVm+40lZdZxlPYbFIByvhBCJSIkUqXncjLY7aPcb
 wCMht1/A/+4RIPmYf10QBeaR5xT7orpzypUd+I5l5rDYFHSIe5wWf/UlOF7GE+fd8hIxLoAfsckOP
 BpgaEt/A==;
Received: from mail.thorsis.com ([92.198.35.195])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpnYp-0003o3-PS
 for linux-mtd@lists.infradead.org; Mon, 29 Jun 2020 06:46:38 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.thorsis.com (Postfix) with ESMTP id 2AEC22A3D
 for <linux-mtd@lists.infradead.org>; Mon, 29 Jun 2020 08:46:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
 by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dIqOXnG1lGDU for <linux-mtd@lists.infradead.org>;
 Mon, 29 Jun 2020 08:46:20 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
 id 456151A35; Mon, 29 Jun 2020 08:46:20 +0200 (CEST)
From: Alexander Dahl <ada@thorsis.com>
To: linux-mtd@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 0/1] ubifs: support authentication without hmac
Date: Mon, 29 Jun 2020 08:46:10 +0200
Message-ID: <2117676.Cu8v49ySxQ@ada>
In-Reply-To: <1764637498.61502.1593158954662.JavaMail.zimbra@nod.at>
References: <20200625155927.28430-1-torben.hohn@linutronix.de>
 <1764637498.61502.1593158954662.JavaMail.zimbra@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200629_074636_156612_1FC46DD3 
X-CRM114-Status: GOOD (  10.49  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>,
 Torben Hohn <torben.hohn@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Richard,

Am Freitag, 26. Juni 2020, 10:09:14 CEST schrieb Richard Weinberger:
> That said, I'm not really a fan of reading files from UBIFS in u-boot.
> We have UBI static volumes for that...
> Maybe you can give this a try and void some complexity in the bootloader.

Surprised to hear that. I saw some boards lately doing exactly that. Things 
like kernel image are copied in Linux to e.g. /boot and U-Boot just picks it 
up from there.

I tried to find out more about using UBI static volumes in general and for 
that usecase, but neither http://linux-mtd.infradead.org/doc/ubi.html nor 
http://linux-mtd.infradead.org/faq/ubi.html point me in a direction where to 
find real world examples to look at. Are there any boards in the wild using 
this? Maybe with defconfigs in U-Boot already?

Greets
Alex




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
