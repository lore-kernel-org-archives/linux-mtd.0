Return-Path: <SRS0=VtTp=AO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F43C433E0
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2020 09:14:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 220B220836
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2020 09:14:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KwEHwHKo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hg+/HofI";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="w9+tnVsM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 220B220836
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZqnqWBaRVbjz+P+5nZ4dS7cJKTsMUVzXkP35hcDvbaU=; b=KwEHwHKoPOPOMCpqLGbgwP2B6
	Y2YIkVwNUJ/eaQ/Fdzy19PepdeZa44MsunhdZafDatyuFiChwKnGs/b6Up62qr/Jk/gBiid5/V8QT
	IfUfbbJ7gYGMp/9udLmQK9BM/eL7mNSMsZnR5MRJ0WPb+3EyTP4kFqifUk/7UUp9bkew7+qf+exTU
	wDLucLvkvO3TeVR6InLOKw6FD0Zz9TiudI6SvPe8g8ACgNkw1YwAcEkeNuB4ccHkN8+OghjYpfkOw
	mNA7jVFJhc4GFdATbEbuvSNsoOE9Xwm3bMIT1cloEnXPfDrzb3JBRblt95eQ5Qq5pNTRAyEfzCOWp
	KD2BXAsWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrHk3-00050u-8G; Fri, 03 Jul 2020 09:12:19 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrHk1-000509-4T
 for linux-mtd@lists.infradead.org; Fri, 03 Jul 2020 09:12:17 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1593767534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AiDHTYzAA1I+YtF0XSTLkujGYv/Lzw4QYgNMdP1Obyo=;
 b=hg+/HofIwVouSZRrK8Bqkpw6nstMhNlcoGG31SnbQD+gj+KXxetZar/kkCOrhiYPnbl9/F
 zyV0mXDWQ03XkQB7T95w3adNHlwVJKtIOzVJkXbIKZQGfuZkgEpcAX14POSTX1Ko0j9sDz
 qBC9DtdZqNV5aT+9t+BWjPJ1F3SGfZ98X/a4lf68eMs8ZfJlDSZmC7fVSHJN1BtPQge04L
 2ER4q+K/4bo5pHzvuiWzXI641Yv9PbjgC0L0lrr2qzFz9Lv8Km63i+gWD0PoOHOA3y1Dks
 QgmOw4TWyYTw2VUj2IU/A84kO2Cjyu9svC8IdDtUXLrwSWsMPOWuT9buUSc74w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1593767534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AiDHTYzAA1I+YtF0XSTLkujGYv/Lzw4QYgNMdP1Obyo=;
 b=w9+tnVsMvJjZnuymF0DxL/s+gNHbgrBOeVjRch/mcCG7Rpmft6vbWbQYXorAzo0NSNcCs8
 OVUCHeEYcwVYb7Cg==
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v2 0/4] ubifs: support authentication without hmac
In-Reply-To: <1162063436.84431.1593716634407.JavaMail.zimbra@nod.at>
References: <20200625155927.28430-1-torben.hohn@linutronix.de>
 <20200626112907.13201-1-torben.hohn@linutronix.de>
 <1644538308.62483.1593181011127.JavaMail.zimbra@nod.at>
 <20200629090734.GB17241@linutronix.de>
 <1031805083.71374.1593427612787.JavaMail.zimbra@nod.at>
 <875zb6t1yf.fsf@nanos.tec.linutronix.de>
 <1142766008.83787.1593702042460.JavaMail.zimbra@nod.at>
 <87wo3lsqg6.fsf@nanos.tec.linutronix.de>
 <1162063436.84431.1593716634407.JavaMail.zimbra@nod.at>
Date: Fri, 03 Jul 2020 11:12:13 +0200
Message-ID: <87sge9rmhe.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_051217_313543_A03296CF 
X-CRM114-Status: GOOD (  10.54  )
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
Cc: bigeasy <bigeasy@linutronix.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, david <david@sigma-star.at>,
 Torben Hohn <torben.hohn@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Richard Weinberger <richard@nod.at> writes:
>> And that's what Torben implemented unless I'm missing something.
>
> Torben implemented it the other way around, he allows mounting without
> the HMAC if UBIFS mount is read-only.
> This covers also the proposed use-case but as I stated it has issues with
> remounting and makes the implementation more complicated than it should be.
>
> That's why I proposed adding a new mount option like "keep_offline_signature" or
> what name fits better. That gives us the following pros:
>
> 1. Makes the implementation super simple.
>    If keep_offline_signature is set and rw mount requested, reject.
>    RW remount can rejected very easily, store keep_offline_signature in the ubifs context.
>
> 2. If the super block got already re-written, reject.
>    You can check sub->hmac[] for being non-zero.
>    That way we can give the user a decent error message in case they do stupid things.
>
> 3. Userspace can verify whether the UBIFS fs is pristine by checking
>    for the keep_offline_signature mount flag in /proc/self/mountinfo.

Works for me.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
