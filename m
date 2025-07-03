Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBF1C77B7C
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jul 2025 17:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=02m3iC1EcmYNVVTpmMzdCVswb2fhVQ6HNIuPstEW/gM=; b=lscaWSAZHlDWb3
	Kga6LKHbeIkYnOU7QjhAaKU+J+ePB1I3iLUcgKWCmC23zAAUAZS2uQcpS6If8/2TRVhyVFa/zeD+p
	vsx9/v+YVj0qmeeIHZOicgDe+HzMNQ0n5L6zWaAVU6uDaHOd+4sZJcHXygi+FJgRdAzrFU5kBLcGk
	89MJh1DpDB8JfIVSP9rLzSykRPQ/LWx0oUFnE85Jw/lRCcfPin2WfkOe8Hf/JAWNkaMBYjEhmT7qG
	hoqUclo2MGmKxn+HrPFxMjwt95JRSZWhJENeX7mO1ozVXuhIiUEe5i0Ep0VFf5JCgj3/+FkcONEo+
	QqppRNP/vOXt9vVPgI4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXNhT-0000000C8QY-1HMD;
	Thu, 03 Jul 2025 17:26:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLOE-0000000BkNH-0BGR
	for linux-mtd@lists.infradead.org;
	Thu, 03 Jul 2025 14:58:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4B5B9A53890;
	Thu,  3 Jul 2025 14:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58703C4CEF1;
	Thu,  3 Jul 2025 14:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751554697;
	bh=872+7tXOem1OrbfSNY5lnOE/vEVSwPzQKMYLZWB69fQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EdCSCguC0Yp15sN2d+GJmd5XG8EI607MdgHRpu6p9JFuYQzEmwRgQvWjy3AAKXMZ8
	 rPewmLlnAOGy6PO2Juucxq9h/CRcOYWptIQlGyeLAfyxz/Uury3Xc0mNelzZ031i4Y
	 scbeKLMBqTZX0XIaYM76gZvH3eC3KoPrGo3TNa8kt2HDKbGQAupb9tPTC039lm3AvR
	 biTMpw50WPjIlY15aL14USlnbz/8uA05l+u8+q9j6sPG6dAudc578HFbP/6LWeaRxU
	 1yeYT8vF0I3yHjW2UBbaAcVDTiKBAqtkyVt0NkePUArNqlRZEvxvLI3Xp5HlwCgnRg
	 mBNhqFiXteWeg==
From: Pratyush Yadav <pratyush@kernel.org>
To: tkuw584924@gmail.com
Cc: linux-mtd@lists.infradead.org,  tudor.ambarus@linaro.org,
  pratyush@kernel.org,  mwalle@kernel.org,  miquel.raynal@bootlin.com,
  richard@nod.at,  vigneshr@ti.com,  Bacem.Daassi@infineon.com,  Takahiro
 Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v2] mtd: spi-nor: spansion: Fixup
 params->set_4byte_addr_mode for SEMPER
In-Reply-To: <20250612074427.22263-1-Takahiro.Kuwano@infineon.com>
References: <20250612074427.22263-1-Takahiro.Kuwano@infineon.com>
Date: Thu, 03 Jul 2025 16:58:14 +0200
Message-ID: <mafs0jz4p1fuh.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_075818_143138_8267D9EE 
X-CRM114-Status: UNSURE (   7.06  )
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

On Thu, Jun 12 2025, tkuw584924@gmail.com wrote:

> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>
> Infineon SEMPER flash family does not support E9h opcode as Exit 4-byte
> mode (EX4B). Therefore, params->set_4byte_addr_mode is not determined by
> BFPT parse. Fixup it up by introducing vendor specific EX4B opcode (B8h)
> and function.
>
> Fixes: c87c9b11c53ce ("mtd: spi-nor: spansion: Determine current address mode")
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Applied to spi-nor/next. Thanks!

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
