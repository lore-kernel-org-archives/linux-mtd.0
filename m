Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4137C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 21:57:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ED8B64E2E
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 21:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2ED8B64E2E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3WyZY9X5LJ1fb55rPLwcLNwHCSVWIp4ngd0xdS0Gcb8=; b=RGln25s96qGwxcY5EJQXw9iYQ
	27rY1kwyOEPFIayCBtswpGvjOT0o4fEydThqPWtfL5+ZDBNcWgY/mSo0MHguhEu1puhOGgyy1zI98
	PC+81PS9I6f0HSmDTuEfRY57GiYOGznAnmRISWx6/NfFAfIrUEl1WxSKHZDIpiAF8RSC4WxyVSsjX
	SJ3qRKdg0vFjOTnJqAZvx3xuuqgRK8+D/zE8uZfPGRx6VsHV9TkxJ8FtLxPk0oKMI2ZMMfhI6D3ix
	YodkKxbzjQiFkyKEhTjXvM4q1yQLcx6fQXV7qNfRNtosUZlABRUHdEFM1p7XqqTlwVcvyQSy12ddL
	iA+aIMFjA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHZSy-006fLB-Rm; Wed, 03 Mar 2021 21:55:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHTAE-005KTq-8T
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:11:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=vSOy8dFeOWs2dUYht0tqtF69xzoKC+eQy2xuFHyua5I=; b=quC/V6qe8qikY7kbrKJRHckt9U
 FHcpupU6o1mWVSHpSadQg+JYNlmUE25ljMNmP73ScOcVmUYeLc/W3371T94sx60jiTMHGrJCpDqDm
 cIJ3MqlZYKcvNm0GXeEl+ca6rlekHuNN8ykFpGo8UVtAz1/zIj4uHnT9wgO9Mdp2MilozoewtlDaz
 iDPgdsWvD8C01qZ8pKILxsWTxmlzYr70y43VdGLr8VyhvTOZgHw9hm+P2QwB6kS3uiGWNJw8gOvmG
 FTbH2aROWaEMG4Ocbi7M2jJVHtx+/OnHNx0vpeWvj0IbQnefF7QwpBV5JvTB3JN+RCYtsFinBVaoi
 0zSilfyw==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH2Wx-00GxjJ-Gs
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 10:45:33 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1614681928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vSOy8dFeOWs2dUYht0tqtF69xzoKC+eQy2xuFHyua5I=;
 b=Y6pmBHMmwv8wUtkfhespjgY/x6QS9e35XcglBRIUOp2I+XS9TXMGCMMMB0p5GB+v7X3qCC
 mbAzXSdYQyT2ucsI03h/edoxdZppVl4N8+/hfbCUPuzqumqBq/F3Ek5exG/O5TIeaBtLcl
 cCfunqwhLVa4VYPyQJv/XqDOsSuC+jJ8236Ef5i1WX6D3PCa6MNmLYZkPzLQPkd3C96rxU
 e4wWxawSMHaj5IJv7iNZUwhN2sgYyCPhlJzTJuWAkhpDqsp7U1sCL1oeh30PMwCjEqvCXX
 7zQtRQI1vwab/ahWbsm6EBF2tsBt1/crPwz4ynYy3efJZrODPTdX3cX+5M8IxQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1614681928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vSOy8dFeOWs2dUYht0tqtF69xzoKC+eQy2xuFHyua5I=;
 b=GXOfiVqk2mYR6O83D5argptmP1sp4qvmGQZHwJ/9nP5x+tH7n5o31BZ9g2mQ0Kqfp//m3W
 zjM5bqhiwrRtomCQ==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH next v3 02/15] mtd: mtdoops: synchronize kmsg_dumper
In-Reply-To: <YDzaYqrk3Dv37uDa@alley>
References: <20210225202438.28985-1-john.ogness@linutronix.de>
 <20210225202438.28985-3-john.ogness@linutronix.de> <YDzaYqrk3Dv37uDa@alley>
Date: Tue, 02 Mar 2021 11:45:27 +0100
Message-ID: <87tuptq1fc.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_104533_021145_02609929 
X-CRM114-Status: UNSURE (   7.69  )
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

On 2021-03-01, Petr Mladek <pmladek@suse.com> wrote:
>> The kmsg_dumper can be called from any context and CPU, possibly
>> from multiple CPUs simultaneously. Since the writing of the buffer
>> can occur from a later scheduled work queue, the oops buffer must
>> be protected against simultaneous dumping.
>> 
>> Use an atomic bit to mark when the buffer is protected. Release the
>> protection in between setting the buffer and the actual writing in
>> order for a possible panic (immediate write) to be written during
>> the scheduling of a previous oops (delayed write).
>
> Just to be sure. You did not use spin lock to prevent problems
> with eventual double unlock in panic(). Do I get it correctly,
> please?

I do not understand what possible double unlock you are referring to.

I chose not to use spinlocks because I wanted something that does not
cause any scheduling or preemption side-effects for mtd. The mtd dumper
sometimes dumps directly, sometimes delayed (via scheduled work), and
they use different mtd callbacks in different contexts.

mtd_write() expects to be called in a non-atomic context. The callbacks
can take a mutex.

John Ogness

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
