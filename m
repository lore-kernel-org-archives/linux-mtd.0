Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9657DC00A89
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 09:17:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D93322226
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 09:17:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RQUzefgY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRJPV93W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D93322226
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pXetflcZNtHXfyQ+3SD4loetF3oKVbGSfu29mGbgbz8=; b=RQUzefgYLsPSoskUOesILl8cd
	Ht7+MQLF1VlW1H3wC2VZKpeFVl+mW7kfj4givAJm9Q7MPphT+PtpEnlIrQN47pPqCbkVy+0UnKPyQ
	ce1amAaMsdEPH7ACdGc8mabexz4USPwBbQ9XL+4MSPzDuJIMpGynVXLrL7s0UUQl7O+pttXAouHzJ
	godCmHKCW2ipozThE0gqXNPnNEZqytRGUXDGxPt3WDmLFXw65wPEmC66aDiJDUdp5p4gVXzZe8ct5
	6AGqKNFFqcdpAKvkp6l2UMhwIpIgVbQZcpSYTfDONxEuhmv1GJ9EvMTD9okdTmAm6ok7HUBgWIUlx
	GGpfSmKjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZVxX-0005m5-D9; Mon, 02 Nov 2020 09:17:03 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZVxV-0005lb-7x
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 09:17:02 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id i186so11128946ybc.11
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2020 01:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=X9zL1wGR+MgwyLTpaMDUzoIT1rjdYadNEMy6izhMtL8=;
 b=BRJPV93WryMji4ixHXlmPIdtiv8tThJx5kBMCEm2EZzYC1LK5urhqXUMujbejv++0j
 lVUVUUXi4FhWdqrb+sv3TPgNP6+D/8TRhAJZB0L70lt51MGMidUK2ERx0dmhQEvLlMCY
 t0icHsvnwR+gYI+JULN/boZ2gA2URcQUzMVyr4fOAK94Ryv2DzYMme357XgEWdMqCoeh
 4JcBTK81C0CA0XAvnWRlaVaXgRbIcCIz70WAj0WlNc2xVYjypAvf+QtsbwHuQbmzXWEy
 rD2W7tseV7z6C38Md3qJQuVdycuX+sIHuCLu2Z4AhJNH8WOVgMyPQeH9K3IVfivr5mHg
 HjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=X9zL1wGR+MgwyLTpaMDUzoIT1rjdYadNEMy6izhMtL8=;
 b=ad0rGEkm7tOKLRqASxS1DOTOUNbPgIFAJA/N3rjN8iKnzc+F77B/T4LkfPthilCY6a
 e9opHO9ew/0ybtrvCkBwCsRrwBWh2lRh/6yQl+zxVxS6AYkQkrV94VuNuH8iYcQBri42
 lOnPIH16GocA3aGtI6/5YjZfScXE7W+1ulrFwUjIpWn0YYy0AV/RwkzeLdhvuHiw3t+6
 UKdhNcp7BbqXFl78kZcQjLexbB1uJIK+98ZxW/ee5+WiXvS4lLOlBZK0b+BOgYyvzJTK
 m8UO2H94VxxCQpJ+bEeqYsjN7hNtua4gziMKM3b+IqGFUUjITyd8fb76M5AV/CwjWbng
 x2jw==
X-Gm-Message-State: AOAM533hc9b95cqaIpUmg4bXf8+VZc8aSnxQARGN+m82EaDuL5gk1sQm
 kF5VfrF8P+twT+ZbQ3AzNa+/DER+etJHDlnmWGQ=
X-Google-Smtp-Source: ABdhPJw4hj1NBlJRlAop7otOv/YQpQyridMh6qw7zHJvwMhFWEBa4mq3F5iWK2EnCqBrfulD3vLZsj1U//W/IJeFZD0=
X-Received: by 2002:a25:4cc7:: with SMTP id
 z190mr19805632yba.405.1604308619133; 
 Mon, 02 Nov 2020 01:16:59 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a25:a16a:0:0:0:0:0 with HTTP;
 Mon, 2 Nov 2020 01:16:58 -0800 (PST)
In-Reply-To: <2234110.ZDGxJVC3CD@ada>
References: <CAA=hcWQnJ1yRTwPF+9kubSt6FQPxwCRYFwXcYR8RnVLs4LMb7A@mail.gmail.com>
 <2234110.ZDGxJVC3CD@ada>
From: Jupiter <jupiter.hce@gmail.com>
Date: Mon, 2 Nov 2020 20:16:58 +1100
Message-ID: <CAA=hcWSAsKEcFaR1dCpCey_m2Z2zOxYT1N8NNjL6bNQxSrHj1A@mail.gmail.com>
Subject: Re: Install Yocto image and backup
To: Alexander Dahl <ada@thorsis.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_041701_416455_0BF3C10F 
X-CRM114-Status: GOOD (  11.25  )
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
Cc: Yocto discussion list <yocto@yoctoproject.org>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Alexander,

Thanks for your advice.

> In my opinion two things are common practice:
>
> 1) Using a layer on top of raw NAND, like UBI/UBIFS nowadays, so bad blocks
> can be handled properly in a layer below your rootfs.

Yes, the UBI/UBIFS is used in NAND partitions, I guess you alluded
there is no need use the backup, right?

> 2) Using an A/B scheme for updating and using a well tested framework for
> that  (instead of self written shell scripts).  You don't need another NAND chip
> for that, just multiple partitions.  You can still have your kernel/rootfs read-only at runtime.

If I do need to use a backup, it won't need another NAND chip, it will
be another UBI/UBIFS partition. But I would like as simple as possible
if no backup is a common practice.

Thank you very much.

Kind regards,

-  jupiter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
