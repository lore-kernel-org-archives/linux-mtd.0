Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BFBEB8FAD
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Sep 2023 07:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tuAX0aA/in2L0u02AwwF+/Gn57J9R+s3V5C1dU4iPkQ=; b=zRop+p3aX7vBYKPy5xrEmsLSWJ
	S6wIU5CcJs8LSt4DrdqVRVEya3yZDNnyVHJ41vdx5Q1eAUbNa7A9omXU7D8MzCMZiwB/chq/STIds
	AlVW1lBxDAPaUk6WT2gDOYNCwdTudaMp+jW/RtJb82gVhTmS41sdv6gQ3Nqd625zmmS/O4Y1nzXMh
	LVWIZz1shE5KVDTOqK2Rme2FBMK7aD8hkn6KOqs3UqIDs/OuB32Gwo5eAzPMYmYZP7nWnix8p/uz4
	fPXAoG1DOOvAOtE1I5owiH+mAgXak+CHUX4f45T/qZu6g38lKFZ/3sSoVdugWjc0xVm/GrKDm/eZt
	jNimdPcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmaB-007RDp-2f;
	Wed, 06 Sep 2023 07:04:11 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdma8-007RCj-20
	for linux-mtd@lists.infradead.org;
	Wed, 06 Sep 2023 07:04:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id C8B8FCE13AB;
	Wed,  6 Sep 2023 07:04:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86063C433C8;
	Wed,  6 Sep 2023 07:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693983845;
	bh=iaLhRtKyGtozPCEIVwdSztCExtfwyqEGcqw5FKdYv6Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oNhSpxqafGb4vd0yUbC3mBK4LGciSxdUG5gcuZJss0y5MjAgjGMmQ3RB7IH8w3nHh
	 A8AJpDjmIfu9ShvG5c82K7BuqJbyuT33I8RctABtg/NV9hrQf7Yqz88hVHFdfF6zJR
	 8yGgvgriBec4BVQEPaez4PcEIKYiOwT7er5szstNDCPnXvN+PUjeV09QqNbTjrIjR3
	 kTWzm/ZGilVF63Lc5lGi44yhxrqFstusSKzxACo1GPbmsw94gdpgEhl0biiCdq6FwM
	 Kpf47Mo2b8o4u9L0UncOafjLLnHznTdXc/SODWeUYd2Eu8ERXhLSETUZH+VEyXphP3
	 l506S3dEU5fNw==
MIME-Version: 1.0
Date: Wed, 06 Sep 2023 09:04:01 +0200
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 12/41] mtd: spi-nor: introduce (temporary) INFO0()
In-Reply-To: <aefff5dd-925a-41e7-ab56-9c3328b672b7@linaro.org>
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-12-291a0f39f8d8@kernel.org>
 <aefff5dd-925a-41e7-ab56-9c3328b672b7@linaro.org>
Message-ID: <55b60d1204d3550dc5ab17dbbec523b8@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_000408_849032_7045AC07 
X-CRM114-Status: UNSURE (   9.51  )
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

Am 2023-09-06 08:04, schrieb Tudor Ambarus:
> On 8/22/23 08:09, Michael Walle wrote:
>> The id will be converted to an own structure. To differentiate between
>> flashes with and without IDs, introduce a temporary macro INFO0() and
> 
> why do we need to differentiate between them?

The INFOn() macros will have a pointer to the SNOR_ID() whereas INFO0()
doesn't have a pointer. Before, it didn't really matter because we
tested for the id_len, but now we'll test the pointer (see next patch).

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
