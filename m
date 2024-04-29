Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8767FC4345F
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2024 13:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CjGqM/J8S0tVZ9TUIPawHzhdKBqjSJpDHv85GKqdpRU=; b=1GK3Qy1OhheQjD
	XaOF2P/p86/jIEDowcz0V+gN/QQQSDbq3/yFbhA4gExD3iI6oHbT8On/vHghuxUYWEXK9iVJyz2c6
	iIe3tYaUibIA8Hz2kuKeqTFwirpr8SugnRF4v4iyguUcvMQj56kvYCRPcoQn4u5ihcnJbozJykDlV
	MHaZMLWYV4WWe1MKiIXernpj4711OIVfL6Wr5r8B7OWhRSplRK284TzDges89d+g/dc8QaOSm5ix0
	PmM5mOSr0Gp2wWN36F7wgJaN6iBVA+ndG19FKEqmw+eWGDteAIwm0+W50e9IUHeVfy/b4cvUSektu
	hdY0g0RGq3+gl+GNMUyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1R2v-00000002vqM-1s61;
	Mon, 29 Apr 2024 13:27:53 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1R2s-00000002vpk-05KT
	for linux-mtd@lists.infradead.org;
	Mon, 29 Apr 2024 13:27:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DCDF4CE0B76;
	Mon, 29 Apr 2024 13:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B657FC113CD;
	Mon, 29 Apr 2024 13:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714397267;
	bh=WiGmI+j0Enf5O5AlJU8LIZQyCZ6bZpihfhCn3RhotIQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QyBy3DqwzwIbe4F03tqVf+oGEqmzEU4W+e6WfaZqVy/mt+O90331rfXABnFsQvCRv
	 iVZd1ZC0cyMoLGOdAQRLP4aF3hEIxA1PSMrhQwUYxKQ5LRlCsSu2xKfL+xAYtuP/Op
	 nf/IwspCNSmN8anjeS9+BaNGnDsKSBYGjipFQEXm53nTmoKNsBwZpaQqwue3QR93r4
	 dn5PY4RvxipgY81ge2k2I+4int4C5vZp2DGsCOECM3KRMZHhJeNgQzRwAHJgPjP/w9
	 5pkOr69XhejhroptfUODhKhQ7vgvb2qGdgURmCEZ20h1E0cGFovZK54+Q8JwV0fono
	 2fbxBALUz/GMw==
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
Date: Mon, 29 Apr 2024 15:27:44 +0200
Message-ID: <mafs05xw0cn8v.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_062750_257737_0F6DCEEF 
X-CRM114-Status: GOOD (  11.06  )
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

Hi,

On Mon, Apr 29 2024, Michael Walle wrote:

> Both occurences of div64_u64() just have a u8 or u32 divisor. Use
> div_u64() instead.

Does this improve performance or is this only for correctness?

Patch LGTM otherwise.

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

BTW, I also noticed that there is a do_div() call in spi_nor_write()
that also uses a u64 dividend and u32 divisor. I was wondering why it
uses do_div() and not div_u64() (I am not sure what the difference
between the two is) but I suppose it doesn't matter much since your
spring cleaning series will delete that code anyway.

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
