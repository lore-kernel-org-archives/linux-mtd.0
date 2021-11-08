Return-Path: <SRS0=0QAq=P3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E47C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 15:44:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DAB461163
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 15:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1DAB461163
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DwJsaoPRVXnhHwGOpJvFlIJIZLbxx9EM1nyVc/llqmE=; b=tPZJd8CHBiZSyHGj/Yo3rcovXd
	C0hZFZhvbvl1C536fjn8TOz/o6F0Rs4xQIRQAYiGk/Y2yYD7h2/iKDlaKH4gXhhi57hBZmuI1f+4P
	hnPDKo+oNI27Pie/94/Zm4llTnaTNFHSk/UEmdWdgJZq6UwHnKWyMol4NyhdIAGxEB2towKJzmYZ6
	uWX3XAfC4WtoYKDjM3H9mcFvWM2/aEperfhvCwKO1UsQPJEe1Nyr95gk6VYsRByMIgDtyfnZISS3T
	a6k9GC0xmLbGI9IOrTch0RjQa4rlW8vjrRzU1ALwJoM5FfuhKHJXENemMDhra3ZnfefT19lkxypNX
	BaZ0jtYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk6nq-00GrkA-N5; Mon, 08 Nov 2021 15:43:22 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk6nn-00GrjS-G0
 for linux-mtd@lists.infradead.org; Mon, 08 Nov 2021 15:43:21 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 349B222205;
 Mon,  8 Nov 2021 16:43:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1636386195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VdzImpsfe23Fb4V1nNW/QvmmMLEtkLMoeL/e6kYeyek=;
 b=H7YRReVNPBSpcw1sbgLJ3R36siXN+BrCZTzDEEqc9/XIbpVoMQICQ3zSNZ2cTpL7TNpN38
 s7uVV4fd20C83ZVp1HRLPsK0hgt6JT3VK6djZKJCMdDg86jUthThcGKCI6xGEaCb1LEUzp
 aXJBCFANUqtvmEwq+v/n1Pf543Xl9sM=
MIME-Version: 1.0
Date: Mon, 08 Nov 2021 16:43:15 +0100
From: Michael Walle <michael@walle.cc>
To: shiva.linuxworks@gmail.com
Cc: tudor.ambarus@microchip.com, p.yadav@ti.com, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Shivamurthy Shastri <sshivamurthy@micron.com>
Subject: Re: [PATCH 1/4] mtd: spi-nor: micron-st: add advanced protection and
 security features
In-Reply-To: <20211027103352.8879-2-sshivamurthy@micron.com>
References: <20211027103352.8879-1-sshivamurthy@micron.com>
 <20211027103352.8879-2-sshivamurthy@micron.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <24469d5c42e62959390c3f0aa75fc57a@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_074319_745353_78DB577C 
X-CRM114-Status: GOOD (  11.68  )
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

Hi,

Am 2021-10-27 12:33, schrieb shiva.linuxworks@gmail.com:
> From: Shivamurthy Shastri <sshivamurthy@micron.com>
> 
> Micron SPI NOR flashes are enabled with advanced sector protection
> features, using volatile lock bits, non-volatile lock bits, global
> freeze bits and password.
> 
> Advanced sector protection and security features offers additional
> levels of protection against accidentally corrupting code and data
> stored, and it also prevents malicious attacks that could intentionally
> modify or corrupt the code or data stored.
> 
> Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
> ---
..

> +static const struct spi_nor_sec_ops authenta_ops = {
> +	.secure_read = authenta_secure_read,
> +	.secure_write = authenta_secure_write,
> +	.read_vlock_bits = authenta_read_vlock_bits,
> +	.write_vlock_bits = authenta_write_vlock_bits,
> +	.read_nvlock_bits = authenta_read_nvlock_bits,
> +	.write_nvlock_bits = authenta_write_nvlock_bits,
> +	.erase_nvlock_bits = authenta_erase_nvlock_bits,
> +	.read_global_freeze_bits = authenta_read_global_freeze_bits,
> +	.write_global_freeze_bits = authenta_write_global_freeze_bits,
> +	.read_password = authenta_read_password,

Could you please explain what secure read and write and all the
other ops actually are? Why is there no write password?

They all seem to be used together with advanced sector protection.
But you're just exporting all these ops to userspace. We already
have lock and unlock ioctls in place. I'd expect that this
sector protection will make use of these. Just exporting all the
commands to userspace is not the way to go.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
