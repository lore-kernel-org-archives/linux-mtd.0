Return-Path: <SRS0=kN4B=AL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9167BC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2020 14:37:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E9EE206BE
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2020 14:37:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ReTyn4fv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UlRv2DK3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E9EE206BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=thorsis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJT3FTC3dMcqzcoCkEMJXkSNVb16Pe4sBTAiGBKqe5Y=; b=ReTyn4fvGDb3JuFRzgUZwYdbW5
	jHKm7Ap7/FD4agdaBTm/3CVEsE/7CrF4kNHNhKAotNfMvR5t0n0VXDmQzzUj9izdiR6SQDmgAjvmM
	bzBq6zJ9JzwnH0dqPBiN7krnyeJPrGbm6k2wpA1BwGSpr8aS0Swhz+h6GgHaaIWMeQRoIwJqGFOW+
	HbK6ITbknDa7zL5L9sS1sBhAMC4VSBcVuOy+DjyZJhIpLqCmITw9s/KbmoOmDkEdfC1JrLm6sFoGo
	r0qcuYoobfrXDOtc/c0aJpcXnKhaIxlU3CMH3iMofiHUKlny3nHiqBbPYoATDn505OMlUf4CCujXQ
	kBIt/MUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqHNN-0004t0-Tt; Tue, 30 Jun 2020 14:36:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqHNM-0004sr-GF
 for linux-mtd@merlin.infradead.org; Tue, 30 Jun 2020 14:36:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-ID:Content-Description;
 bh=rINwxy/Yl9R91dXTQUiS9yZtojHjy+9BuDmUOa+FUzw=; b=UlRv2DK3+hAR2OHpqTGZJbSSDW
 GtbkyR5L5jaP8TeOKm6EZGoO3ZfkefnsSt+VCYwqCBX6XEQIdihV1W0KEWioJLsGJR/vSXPsAZgDZ
 +PPLCb4MN5D/bvbopl9pkb8bDIaXxbnFYwSjvuqIj+Y2l4qFHOJLBd+HJT9oCjDhMttsyXzXdEKJf
 sIs7SBALa99k+nJ5+6bW4iAcHLvo7QTe5ehP0ky5Z+4rwOhAAWNLcTLQhc6KJ21loHOXZ9j3tCL0f
 7mYPH2aHTdm6rlCmTmXxMR0FWvXJLMQlho9HAG57jFNw76tOWdBSPkdeQDWnxInRJ37IOZViXDUJx
 YSK1DpsA==;
Received: from mail.thorsis.com ([92.198.35.195])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqHNI-0003Qg-Dk
 for linux-mtd@lists.infradead.org; Tue, 30 Jun 2020 14:36:43 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.thorsis.com (Postfix) with ESMTP id E90353C85
 for <linux-mtd@lists.infradead.org>; Tue, 30 Jun 2020 16:36:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
 by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2mvdpqvIaIjA for <linux-mtd@lists.infradead.org>;
 Tue, 30 Jun 2020 16:36:19 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
 id C84F62A42; Tue, 30 Jun 2020 16:36:19 +0200 (CEST)
From: Alexander Dahl <ada@thorsis.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH 0/1] ubifs: support authentication without hmac
Date: Tue, 30 Jun 2020 16:36:12 +0200
Message-ID: <2574588.zHiktFonDK@ada>
In-Reply-To: <CAFLxGvyqPB45hJ+_kejzs1-1m8XZ8QW-WyXyH+Jnvj9USZ+cEQ@mail.gmail.com>
References: <20200625155927.28430-1-torben.hohn@linutronix.de>
 <1067478399.71066.1593414287623.JavaMail.zimbra@nod.at>
 <CAFLxGvyqPB45hJ+_kejzs1-1m8XZ8QW-WyXyH+Jnvj9USZ+cEQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_153640_895519_A065316E 
X-CRM114-Status: GOOD (  19.09  )
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
Cc: Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Torben Hohn <torben.hohn@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Richard,

thanks for asking back.

Am Dienstag, 30. Juni 2020, 15:36:28 CEST schrieb Richard Weinberger:
> On Mon, Jun 29, 2020 at 9:11 AM Richard Weinberger <richard@nod.at> wrote:
> > U-Boot choose the UBIFS way AFAICT.
> > 
> > But if you have your own minimal loader you can read from an UBI static
> > volume with a few lines of C (~200 LoC). This is what I see/use most of
> > the time. Using static volumes in U-Boot is also possible, IIRC just use
> > "ubi read".
> > 
> > From http://www.linux-mtd.infradead.org/doc/ubi.html#L_overview:
> > """
> > There are 2 types of UBI volumes: dynamic volumes and static volumes.
> > Static volumes are read-only and their contents are protected by CRC-32
> > checksums, while dynamic volumes are read-write and the upper layers
> > (e.g., a file-system) are responsible for ensuring data integrity.
> > 
> > Static volumes are typically used for the kernel, initramfs, and dtb.
> > Larger static volumes may incur a significant penalty when opening, as
> > the CRC-32 needs to be calculated at this time. If you are looking to use
> > static volumes for anything besides the kernel, initramfs, or dtb you are
> > likely doing something wrong and would be better off using a dynamic
> > volume instead. """
> 
> Did this and Wolfgang's input help?

Yes, it did.  I see the benefits of static UBI volumes, and I wish we had 
known this for our projects like 10 years ago.  However I also appreciated 
Wolfgang's input, it's basically what we do with more recent projects.  The 
possibility to easily upgrade kernel image and/or dts speeds up development a 
lot and causes less headaches on system upgrade.

Greets
Alex




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
