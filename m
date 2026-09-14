Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D402FC88E50
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 08:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uocfkkE+Dprfv2I1RPChteEj49+RopvYqoR0RikqxKk=; b=a9q2sgfg/rrDdt
	ErpxRNdlA9JfJNQhergOKDHo+Z+AQbfmO/LTGd+YF9KZGHf8VAbOuCvRpfPERTh7G4PtxO3mTabui
	s/o+5Z5SOiE170KhTaM3fIox3+Ps6AZOPHSgcI7P+o4R31pjUcY3psn2UA533TvOleqJft8csCSMA
	auLL+pn3HPhzib2lGoq+EG5QCCmD+CRvvRAU+u2YiS6sH1zX5Ip+JKC0xigRNhaWrpHUkBJowGO3f
	fclOyBKTOLV307Rs/WbZHOU1gXCn4QAIqS91dQ+UhzkkE/UWlni2/jLeHe7GYfjALY6wOXh86kBOE
	izk40bLrUKXA28o0YCPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61mo-00000002g9E-3nGS;
	Mon, 14 Sep 2026 08:11:34 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61mm-00000002g87-0Jdq
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 08:11:33 +0000
Received: by mail-yx2-x10.google.com with SMTP id 956f58d0204a3-66d20e86cfeso171545d50.2
        for <linux-mtd@lists.infradead.org>; Mon, 14 Sep 2026 01:11:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789373491; cv=none;
        d=google.com; s=arc-20260327;
        b=Zoxsky9oiTO5BvAQC+u1gEMmTLX3lnLNaJLDaUfI3xFY3ZCBnkBt9KK2AAMlJguag+
         I1IUm9pIfh1B6eqBwrzyCDVdLIWyTAN7CwEUSQTrneBXLwG4fr6uGP7QHmJM4mWR9ZQX
         WbV+FzRjlbWYetk9DZh9GxdqvQRCYF+HLba+dEU55zap8d98Pji7ClikdUszARiX9obp
         rv8PnibMJnNDk4j32v3S9SMmc4Hv73wPohE027aOwdhd3T+WaUUlKW1VVjH/RRLxbr45
         wq138mK/9AC0ZXazY37tcMN69JpplGlywRaHjt8smRGXVKG2fWTo99i5cKg9d6Trd9Pt
         lNPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=53mBNqBKIPdVYuVN3sfvg8nCabbUTtVLQ2DnxwMY9cM=;
        fh=yAR/Y/nFoSNvAoH+EkkvHSzC80yVqFiStPcOZvJLgCQ=;
        b=EuOedj1De9q04wetbrnQ0V+TqWJi47IPLilzoeQPkToM8Y7ojkpLTZgo0gcDOW3oRX
         3WcbnRtrycNhCRZx5PLR2sv7tnLL7xkZjexJyPilHqEi95xaknjwu1CimCw/Xu+y2wji
         OcRj0W6WNZFCKZqrT6Ef2tOeFYdVBYdOPrhrFh8XJ/P1wCD53l03bcqlhP0v9hXRsMjS
         4ABigkcRwV7fAnJgjGLFMRDJf94t+ORssuttwFjMhQruUUPQaPxgTeR9idonGyAR/8ou
         MQHli4Dyt4DaGb8AN+/ris0QNCNUwhgg9/rliwCOJFV0uBmQu8SxxT3m+n9zS9OtmNwB
         JyBw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789373491; x=1789978291; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=53mBNqBKIPdVYuVN3sfvg8nCabbUTtVLQ2DnxwMY9cM=;
        b=i1bGewHGvy0TCqQbdZcLDWmVmjmHRD7TU69p8MQm2B7dMtK7GWal4VBcqzGVNaWJiR
         0Sz1ny7h01I0yzSJw9kSVWRrg4yFcdJCCjlCb8851B9pDriuvsoFO48hM/iOPquQCrX5
         80YHbnadIhY9uJEO69gEYYu24vh2aRQy6l64ytZ/23OO+kf01o1n2HRJE6RS8Q5Op2Ee
         sPh5Jf6YM3rVqbUtyhD3wfrSRB0Gjka6MZiT+SiCIJsfX+uS0Vau1zC5GSuilYotujw1
         mIz1jHMHUZ7EFuYfMtus3RtG8S7tl/vdGIpfjS6cBSXkrVCDuqtcENBqSNAvVf0ZYmTY
         V1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373491; x=1789978291;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=53mBNqBKIPdVYuVN3sfvg8nCabbUTtVLQ2DnxwMY9cM=;
        b=fnXcT/92QNGFuRC20tY8DdCHr7pGX4FhskLC/xXoQUu9og+NneB2XPL7a842ucXYId
         MpnmtXELR5+yO8t4btJsSoQuLLi2+mbFqjbXQR1h2WUZwpwJYWtQ+yjcfoRjVA6pj1y8
         nYBK/JEIykyTekSrSEWQNpfxuHaU4I9IlSr4LFxGwzHnD7D/jwD22szaHc/3nIy6DdN6
         3ohEPVKGT1bmMKoCNMdiLzM6Mmu0Jqs1xixvNpTuXQxRHHNEIL8n4qIlF3eaSbIYX7Ve
         VQ5CyS8kBbVb7jEcYtzX0pXo2jd2lI83O9TMorUYWOjq/9Kxf/sZl28k8K4yD3uahD2c
         8qfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVbbTV5G0oLnqZoeRsJ+bN0nF7npUWT2NJ785Dt03wesexIhdiweNnK6iVeBO5FycS+Orlb5j0nlg=@lists.infradead.org
X-Gm-Message-State: AFuF++kvVB9imluIYBpq0z1jPpRdE0XuiYAs4HOKi4zgmDTfZE3TpIQe
	DwcFhUyhouhr2qJMOGmj/puCNZ+DIanKYn7UDj/+Z3pzSBOJcF3jwhSwSj+FlwL6lDcn//T+7YM
	MglQi/+KHPB4j2dNiJ1ECym5+JXesPCM=
X-Gm-Gg: AYBFou1xx9n1SjUaP+a5WEZQ8NH/tYgB38tQ9R0s/qPrIVsMT4AMrBHy7Oe2ae264qe
	V2UsgD4AZbGxikIeAAhJ8rwZeNoLf4xTzbpNb7C45XlGMLA4OZ+i2TXmw129MkS74mHsMaq41Dn
	1WbCgVk3z5huSUXhnR2guFHeyzs/vPqeW0eqhvPkNwI/WM9hlIx06IHiNKTNVnXLXcRaI9PZa2A
	pD+H79EiAKXVD1e05RLTqQEabq2WfjNJf/p809v085KJAJeroB9hBvEqG5FHzTvZO/iPjLhqboL
	2oRE2rATIHa74vCk4xFYwSJDEsZa40X3ZCp7y5+XrvijDPyC2Gy5KEFT7m5U4xH1ZdU=
X-Received: by 2002:a05:690e:2023:b0:671:2f8d:eaf3 with SMTP id
 956f58d0204a3-6714e30e48fmr310610d50.4.1789373490617; Mon, 14 Sep 2026
 01:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260910184452.895485-1-itai.handler@gmail.com>
 <20260910184452.895485-3-itai.handler@gmail.com> <20260910190205.D0A311F000FF@smtp.kernel.org>
In-Reply-To: <20260910190205.D0A311F000FF@smtp.kernel.org>
From: Itai Handler <itai.handler@gmail.com>
Date: Mon, 14 Sep 2026 11:11:19 +0300
X-Gm-Features: AcwNN1W3TsRmnijrk6GVHlCGzsYDkz9GLd8Q3xiW9vI-5rWBg_Mn-fVrRALFw3Q
Message-ID: <CAFpOueTWdO8JiU9Wyw+Om-dPhXgsZ5Z4n9iGxL9Y_a9JuSFtKg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: take the flash lock in spi_nor_remove()
To: sashiko-reviews@lists.linux.dev
Cc: pratyush@kernel.org, mwalle@kernel.org, richard@nod.at, 
	miquel.raynal@bootlin.com, takahiro.kuwano@infineon.com, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_011132_128490_098F2F3E 
X-CRM114-Status: GOOD (  31.71  )
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

Thanks for the review. All three points are marked pre-existing, and
that is the right call for all three: none of them is introduced by this
patch, and the last one is a genuine problem that this patch cannot
reach.

> [Severity: High]
> This is a pre-existing issue, but does spi_nor_prep_and_lock() leak resources
> if interrupted by a signal?
[...]
> The function returns this error immediately without calling spi_nor_unprep(),
> permanently leaking the acquired controller resources (such as clocks or
> power management runtime) and deadlocking the mutex.

Same answer as on 1/2, where this was raised as well: the asymmetry is
real but unreachable, because the two halves are mutually exclusive.

spi_nor_prep() does nothing unless nor->controller_ops->prepare exists,
and the wait_event_killable() is reached only when SNOR_F_RWW is set.
SNOR_F_RWW is set only when there are no controller_ops at all
(core.c:2981):

        if (flags & SPI_NOR_RWW && nor->params->n_banks > 1 &&
            !nor->controller_ops)
                nor->flags |= SNOR_F_RWW;

So a flash that can be interrupted in that wait never acquired anything
in spi_nor_prep(), and there are no clocks or runtime-PM references to
leak. The mutex is not taken on that branch either, so the error return
cannot deadlock it.

While checking this I did find a real bug next to it:
spi_nor_rww_start_exclusive() returns with nor->lock held on both paths,
because 03e7bb864d9a ("mtd: spi-nor: use scope-based mutex cleanup
helpers") removed its mutex_unlock() without adding the
guard(mutex)(&nor->lock) that the other nine helpers got. No caller
reaches it today, which is how it survived since v6.15, but this patch
is one of the two that would. It leads v2 as patch 1/3. Details are in
my reply to the review of 1/2.

> [Severity: Critical]
> This is a pre-existing issue, but does dropping the lock before unregistering
> the MTD device leave a race window where pending operations can wake up and
> execute?

Yes. This is the same residual that patch 1/2 documents in its commit
message for ->shutdown, and it has the same cause: the restore runs
while MTD is still accepting operations, so an operation that starts
after the lock is dropped will send four address bytes to a chip that is
now in 3-byte mode.

Serialising against the operations already in flight is what this patch
is for - it stops the restore itself being issued into a busy flash,
which is the case where the flash silently discards it and stays in
4-byte mode. Closing the remaining window needs MTD to stop accepting
operations before the driver is torn down, which is a layer above this
one and a separate discussion.

> [Severity: Critical]
> This is a pre-existing issue, but does unregistering the MTD device without
> waiting for existing users to close their file descriptors lead to a
> Use-After-Free of struct spi_nor?
[...]
> When spi_nor_remove() returns, devres will immediately free the struct spi_nor
> memory (which was allocated via devm_kzalloc), but the userspace process may
> still issue operations or close the file descriptor, dereferencing the freed
> memory.

This one has substance and I do not want to wave it away, but it is
independent of this patch: it is identical with the patch and without
it, since the patch only adds a lock around the restore and does not
touch the teardown order or any lifetime.

For what it is worth, the analysis looks right to me as far as it goes.
nor is devm_kzalloc()'d in spi_nor_probe() and nor->mtd is embedded in
it, so the allocation is owned by devres and is freed when the device is
unbound. The kref added by 19bfa9ebebb5 ("mtd: use refcount to prevent
corruption") governs when mtd_device_release() runs, not when that
backing memory goes away. __get_mtd_device() does try_module_get(), so
an open user pins the module, but a sysfs unbind is not a module unload
and is not blocked by it.

So the question is a real one, but it is an MTD-core and devres lifetime
question rather than a spi-nor locking one, and the answer cannot live
in spi_nor_remove(). Folding it into this series would mix two unrelated
changes. If it holds up under a closer look I will report it separately
with a reproducer rather than attach it here.

Thanks,
Itai

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
