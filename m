Return-Path: <SRS0=+wMu=RY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9364DC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 17:06:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62AE7218B0
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 17:06:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ojLt93ya"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62AE7218B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K5/OPpMvkcFZe2l4pT1GS/L1aIma8Nr2A2FBlKqBp38=; b=ojLt93yaWiywsN
	Zt9VpARBa2oeqIlKL+RSSUVI1eTZn2+vsBp/r0sIQ+XUC0odpiRq59kmtpwbinLkdHqB9/8FBT1FQ
	ce1+UOZBRSmFcjOHvX8LeKsM9ADkkDfduY10YQRJsSQLWw4zc4m6+PT16mE2ulJOTgWUlfXkd7YHa
	tdNb1fK6vy8OKloh6dIoZD0wWJZNwl3uPiqwZW4L7oFmcOyuBw4MqrWcNFj1XRjtCZXSJpYu04J79
	EaR15OINz7Dsu8O5SmZKoZsdHUeCucnTo7DpTmh551//aOyaB7EYYCYxOQe67Q1cBRyfUBNt1tJvW
	hhSa/s8um471pqLU7X8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h719E-0008Rk-Om; Thu, 21 Mar 2019 17:06:32 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h719C-0008RC-9d
 for linux-mtd@lists.infradead.org; Thu, 21 Mar 2019 17:06:31 +0000
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C66A83086258;
 Thu, 21 Mar 2019 17:06:29 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-121-98.rdu2.redhat.com
 [10.10.121.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D63A85D71C;
 Thu, 21 Mar 2019 17:06:25 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <11178040.rrurhZOAV8@blindfold>
References: <11178040.rrurhZOAV8@blindfold> <20992998.5BCRIlqCZf@blindfold>
 <6007.1553181386@warthog.procyon.org.uk>
 <19628.1553183102@warthog.procyon.org.uk>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [RFC PATCH 0/6] Convert mount_single-using filesystems to
 fs_context
MIME-Version: 1.0
Content-ID: <26883.1553187985.1@warthog.procyon.org.uk>
Date: Thu, 21 Mar 2019 17:06:25 +0000
Message-ID: <26884.1553187985@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Thu, 21 Mar 2019 17:06:29 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_100630_359075_B99EA3E6 
X-CRM114-Status: GOOD (  15.34  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-block@vger.kernel.org, squashfs-devel@lists.sourceforge.net,
 Nicolas Pitre <nico@linaro.org>, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, Phillip Lougher <phillip@squashfs.org.uk>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Richard Weinberger <richard@nod.at> wrote:

> Just gave it a try, jffs2 does not mount anymore. The problem is that you
> define an Opt_source in super.c, but never evaluate it ->
> jffs2_parse_param() returns -EINVAL.

Will fix.

> What I really don't get is the new logging stuff in
> include/linux/fs_context.h.  printk() is already an overloaded beat, why
> another layer?

Because there are some patches that aren't upstream yet that allow you to read
these out through the file descriptor you control the mount process through
rather than them going into dmesg.

> The log output seems very odd to me:
> [   13.117593] e MTD: Couldn't look up '/dev/mtd0': -15
> 
> Please notice the "e" before MTD, first I though this is a memory
> corruption, but is your log level?!

Thanks - I'll fix that.

David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
