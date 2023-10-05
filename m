Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DECFE7C4F4
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Oct 2023 08:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0Zql1XA18zaMm/q7/Py1bqewrlpo5nwDCYYX/0GBiK8=; b=XCU+4ZBnjO5OAL7ILZG9cG0Laz
	IMdu4dZhoVjSXn1YPKdNEpggH1xqYLbEXB2qtZdNpliuB1fqKsQseVbFiryIIF2SVGVRR9EWBY9ch
	DZdaARHZWOz8WxET67Jcamvxz/EswF1df3Y14iebnMm3qRt4QV49X4at0o7iP8lqZVd1tz5BpM1Ib
	GpVdrvJqNECNPKwo6b1jXrdq/leCM5v7t698jNVF8aJ+YZDajl6Xtexxt1i7E5aA+jQu6JNLTSfPn
	DREJ2fUKk7XfZp6P3Q4JWI8k18rZLexrhV0GH8qCUxF6TtRUchMvs9a8hkYVRyRn7N+bk00CtEW6d
	usMYHSHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoJbd-001fPb-0s;
	Thu, 05 Oct 2023 08:21:13 +0000
Received: from mail.kernel-space.org ([195.201.34.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoJba-001fP8-0e
	for linux-mtd@lists.infradead.org;
	Thu, 05 Oct 2023 08:21:11 +0000
Received: from kernel-space.org (localhost [127.0.0.1])
	by kernel-space.org (OpenSMTPD) with ESMTP id 7222f78c;
	Thu, 5 Oct 2023 08:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=kernel-space.org; h=
	message-id:date:mime-version:from:to:cc:subject:content-type
	:content-transfer-encoding; s=s1; bh=XYKERQHuEkhhl7FbOhqoehzDIro
	=; b=XiO7E5JKswwggxhKqcE23dPcz0daNPPOGc9You6Yjx7JtGpr6OWrHprLCwi
	ON636K5ASaxW5fqgnlysZidjxmRRI6sz/t+z3lxgRb2l6Qb4LLwW5QWnFMSqtJVK
	wLqnFGA8JX79ieAwZvq61/YZxNO22aj1izrk1qvwepoIr/ZI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=kernel-space.org; h=
	message-id:date:mime-version:from:to:cc:subject:content-type
	:content-transfer-encoding; q=dns; s=s1; b=O74sMljAvMgbY58pJ21sq
	3p8wq7ki+KaIpz/1JjHAukt59QDSFaxV/t6hCB/e66rxNFVsC3lVyi5FLDH6LQxl
	5pMjPpOR3gnrglDpFs78Di2iAQgHFHhdzuz6ban9Q1l40y48Zk3BvD+MDNnQLRj7
	Pk9Wuxf/HRD13VfIYqLGlI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel-space.org;
	s=s1; t=1696494069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PmdXZryEZFvT+bNtAXsz/pIy2LJ8NemACNJZEE9ndqM=;
	b=anSZBtLZ8v02x67PGs671ixu67DrfR+2QCtxjDsGKbYaSdvTNWMgPRc4dD78Aj2lMwFK55
	1Svu/jEnE+I4vllSdUlqEuAtkpZpCXJvzubpY1U1ErgghyUiW6dl2EYF18GnsdQTjRjaky
	ctQRkS2WgV/KqpCo9qWTMVxTE8L6jEQ=
Received: from [192.168.0.2] (host-80-116-143-4.pool80116.interbusiness.it [80.116.143.4])
	by kernel-space.org (OpenSMTPD) with ESMTPSA id 18ac127e (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 5 Oct 2023 08:21:09 +0000 (UTC)
Message-ID: <6e5e4221-9abf-e572-304d-1150ebd15ab9@kernel-space.org>
Date: Thu, 5 Oct 2023 10:20:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Betterbird/102.11.0
Content-Language: en-US
From: Angelo Dureghello <angelo@kernel-space.org>
To: linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, tudor.ambarus@linaro.org, michael@walle.cc
Subject: EM016LXQAB313CS1T
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_012110_543590_26A47649 
X-CRM114-Status: UNSURE (   4.71  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi all,

as far as you know,
is there some development ongoing for the EM016LXQAB313CS1T
mram ?

On mainline i only see

         /* Everspin MRAMs (non-JEDEC) */
         { "mr25h128" }, /* 128 Kib, 40 MHz */
         { "mr25h256" }, /* 256 Kib, 40 MHz */
         { "mr25h10" },  /*   1 Mib, 40 MHz */
         { "mr25h40" },


Regards,

Angelo Dureghello
w: www.kernel-space.org
e: angelo@kernel-space.org

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
