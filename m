Return-Path: <SRS0=1qct=UB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D546C282DC
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Jun 2019 14:08:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5931D27939
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Jun 2019 14:08:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rqciL1fD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAzfnk53"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5931D27939
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=2J+LqtCfjQ5vq/QOT0gzO/6eAi1dOZ5EWeRB4WWT4Lc=; b=rqc
	iL1fDjKp/Tf5FmEpWradEh6I44ilq0lX8eaP36inMCglnOSqMmRHa1nSReo9kXav1BlM0nQidF96d
	Qz1CuDs1ZK8CW840ft1UY6KTx7JS5NWlEXxJLB2anvroz3nyVnOHK1dTyJYzN0BimX+IJlCLsSk+4
	w+bIA3ZuRSzO32LhuLCxgoqvjLxqnwaP2we4D8VfwQ3Vj7VgZwAWl9XI0e0Im273O6b6DOEgsdHIQ
	aFHS+gJyDQytwfkzhUj2YGAkIPJA8ZREAsZ3x4UBPIAIel1S4m0aQrKrHWMpqE+lP19q04+lkCBcJ
	py51QWyeCQkcU9Z4QfVqoh8SggKcDPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXRAG-0000Gi-6w; Sun, 02 Jun 2019 14:08:48 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXRAB-0000GO-4Z
 for linux-mtd@lists.infradead.org; Sun, 02 Jun 2019 14:08:44 +0000
Received: by mail-qt1-x830.google.com with SMTP id 14so6690886qtf.0
 for <linux-mtd@lists.infradead.org>; Sun, 02 Jun 2019 07:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=CzUYy3jMQ2+ymX8WvTUNDkccr8mUOpThC3IXIJSm4mQ=;
 b=MAzfnk53AvcgaE74S85FF/YNOH6X+PgZD/wYFnipzEWuc47uSvtqfqmzNMAg/uZS64
 V0dYix3KQ25SzWkF10UIdSNti0dXvuZg0WC+2NyJIWieub0ZMhC42Q0x7WBFIttmIB8Y
 TAvzeppyt4nHcF1wrLGPjEgI+LQEKujnyrJ+OmeHAeVZBfw5oTg84TNFWqvKHnGhBPW0
 mYyOhykhKi/idBrr5wOF7eAWXff6BGEKegwGV8yZf5MtMbRNB10YS60v8MpmkGCgeLp2
 13YOiV7cTToA/KBQqSH3e7y+A64Pzw+MgkN3hDwq4+j13yNh9vKCzVNle8B7DE8M/mf4
 lOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=CzUYy3jMQ2+ymX8WvTUNDkccr8mUOpThC3IXIJSm4mQ=;
 b=GovZX23fGg8B8Q0A5rBiFRBRaE73Vh0ZfgkTqxpomRr71wqdZFzazGgz2lchJG9uUK
 Bdxym3zTOGnGDSYIcLfAiDxuLmbD60j4MspAeMRY3QXj3Teaw+vRm+GclFFonTy6TqDP
 0IkxWBRIoGON1SoFdfDZ8lT0uTYxg5hp8xQK9xnKTentQ9bUY7H3EugzzDKUjjkL//nT
 Ga+zr+cMpy3O1MefR+PasofFaSNskPrp6WudwwIhlWJfPOSIz4Dd652XEJIdgCf2KFJx
 gpuDy+uzlbMd2qKdWjybUoD561AX5vLt5uKGp5gWAz8t/frFAwGy8/gAhnPzUZJ+e+lU
 QVow==
X-Gm-Message-State: APjAAAWcOXQx4fTMC/YhOxMgcQvXLWOF64+66ddgRoXO7vUaiJJsMaYB
 y0enXj9vVxPrf13LVa7SAyp2DdZGu/E5X8jFcaZdTt8jx2s=
X-Google-Smtp-Source: APXvYqx5eMLAW78CcKQizxIoZJe7Cz/h/Fem8fOYFI9Qz8suAZgv/0sMGMDUiS2mbtMG761H8MT0MXEElXtW2aCumIc=
X-Received: by 2002:ac8:7052:: with SMTP id y18mr18421281qtm.274.1559484521841; 
 Sun, 02 Jun 2019 07:08:41 -0700 (PDT)
MIME-Version: 1.0
From: Leon Pollak <leon.pollak@gmail.com>
Date: Sun, 2 Jun 2019 17:08:31 +0300
Message-ID: <CAM===sSAP-qRv7jxBs9KZDFyuL+Dx3wSkQfSOiSQtp8Z8FQcMw@mail.gmail.com>
Subject: UBIFS on write-protected NAND
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190602_070843_214377_56807784 
X-CRM114-Status: GOOD (  10.27  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

I am sorry to disturb the list with the problem most probably already
solved ion later versions...

I am running Linux 2.6.32 from TI and my root FS is on NAND UBIFS.
Linux boots with command line:
root=ubi0:ubi_rootfs ro noinitrd ubi.mtd=4,2048 rootfstype=ubifs
Please, note the "ro" in the command line.
Also the HW write-protect line is always set to "protected" state.
UBIFS stays most of the time in write protected HW state (system
requirement) and RO mounted, except the very rare cases when some
update is required.

For this update purpose:
- HW write-protect is removed in SW;
- root FS is remounted to RW (mount -o remount,rw /);
- the change is performed;
- sync, sleep 3;
- mount -o,remount,ro / ;
- sleep 2, return HW write-protection;
- reboot.

For some unknown reason (may be you know?), sometimes something still
remains in journal and on the next boot we receive a bundle of error
messages with error codes -5 and -30. This happens despite the RO
state of the FS and effectively blocks all the system:
- after these errors detection, UBIFS switches to read-only state,
blocking any possible corrections/repairs.
- we can't remove HW protection to allow it to finish desired work as
it happens in the Linux boot, when initd is just starting.

Now, I suppose that this issue (that everything is RO and shouldn't be
tried to recover) is treated already in the new versions. My problem
is that I can't move to newer Linux because of TI HW.

So, my questions are:
1. Where in the code of UBI (UBIFS?) can I insert the HW write-protect
removal in order to allow the UBI/UBIFS to do its desired work?
2. When can I put write-protection back?

We already tested that when in this locked state, booting with NAND HW
unprotected repairs the problem. The issue is only where to do NAND
unlock/lock.

Many Thanks for any help.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
