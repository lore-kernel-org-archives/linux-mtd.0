Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4859C4345F
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Apr 2024 15:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ReONUDQmpYQXduk6GozdzVFkUNsDsQl/0vEguW2Kac=; b=ByKGmrP1+xanYo
	s8poYhuW/D794GJ0It76rrSy9sqWeDFnijiEIlp1DWOSY6crZzJjQ7av83tgf/4qNy58ARRVriC64
	KpmWBHmrippNas84+c0ffdfFd4jaQBLz3GmOq3Ni6pibHLSGtUtzlmzg10YFVfWD/LeZIL1TrmEkm
	o23weSAmq5vJYjftKXowMPL3LyQYXDMzKn1CH3YmxyLmKwaVRed9uV6W4uJx7wPf1Uj6oOvmEOsex
	z+nGgE558UD/N1Ax34A0Hlnfez1Ff8qK6IKPqV2tDbWREBNuvY2lDq2wtu4qiOeH/WN5PXvTcg0Ww
	NS3cS+c4Bs1HVdTazSRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1pfw-000000076Ff-0Vm2;
	Tue, 30 Apr 2024 15:45:48 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1pfr-000000076Eu-2dlL
	for linux-mtd@lists.infradead.org;
	Tue, 30 Apr 2024 15:45:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 34B33CE0F6B;
	Tue, 30 Apr 2024 15:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF31C2BBFC;
	Tue, 30 Apr 2024 15:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714491940;
	bh=oZb/aw2XkBtHn/oFyQgCSsXV0ubKMtqH5UegEn065zs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=u6k1uonDHc4Fw+PsIS/HeIekAfg5iF936HnVWcEyh+4aD9MQG6WpGxmqx0TtvaiLc
	 Bwpq8vOpax2dK2hJw3WqjEAMgxU0Z+I2aHaqGca1/m/5VtJ5dKZDqJcmUaCo1MIlnB
	 Yev5QeRUgdvkj7EHm+z1fhLC3yxyCJg63HlletFNqbDmk4K0VvYmKalyLdcrT6sylH
	 qqW0oujeptdUACruJ/8B0jkC5XvADkePG7b0Y+z0UFaSADlOxZdbnFjtBuz8worgFF
	 Avmxkdc4o6eiFoTtp8736OULZde2uAYlk3ssIMHB2+j4xxDyLUbtXuZLwtsvve8hGp
	 vos6e+FbUGIEQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Dan Carpenter <dan.carpenter@linaro.org>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: replace unnecessary div64_u64() with
 div_u64()
In-Reply-To: <20240429121113.803703-1-mwalle@kernel.org> (Michael Walle's
	message of "Mon, 29 Apr 2024 14:11:13 +0200")
References: <20240429121113.803703-1-mwalle@kernel.org>
Date: Tue, 30 Apr 2024 17:45:37 +0200
Message-ID: <mafs0ttjiam72.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_084543_871829_10001D63 
X-CRM114-Status: UNSURE (   7.73  )
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

On Mon, Apr 29 2024, Michael Walle wrote:

> Both occurences of div64_u64() just have a u8 or u32 divisor. Use
> div_u64() instead.

Applied, thanks! I fixed up the commit message a little by adding the bit
about performance on 32 bit arch, and fixed some typos.

[1/1] mtd: spi-nor: replace unnecessary div64_u64() with div_u64()
      commit: https://git.kernel.org/mtd/c/c84b3925c7d6c

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
