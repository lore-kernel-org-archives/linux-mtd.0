Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C13CC0015E
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 10:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CearIkySRCGMbw+gojsTe5iZe0/0ALcfr3z6/hXB8kU=; b=EEvcgOkni3EZp2L3s0fTx+Iq2U
	71KpCzRat+8Zspt1SIk6r70Yr2OawqG5/K8zH8ya+/EECcUn4BJMk4pgZjfT8M8nU5N+1VrUytGLq
	JmSlIBfaFqWfIKsZqixqx1L4iWM4bfJu8iEPDEXso5kEf07kWHfKgLHeTKt6hofxb/K2MjLE99Ura
	I/v/Fgnz0DDPofqjp15FUhJHgbPNP8tCSfnxd7v9OvXvy7hFnkb3mYqMVTCxJuBF+nPSTzn+dOnWb
	p0XzeTiwHSdM0QVSLOvlIHw2bvsQUv2Dsy/AprBIqAX83ou1I78Cz8S84FgeVdfD1ZHps1Wcj/wtu
	L97LBB6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxxt-00Cwlb-2Q;
	Thu, 27 Jul 2023 10:11:25 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxxp-00CwiE-2y
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 10:11:23 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 811D8BC3;
	Thu, 27 Jul 2023 12:11:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1690452679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kwOyG90DYU7zzA8SBHn4mvu7YWOGma4OhR8M1vhLGec=;
	b=dfeXWAoaBSaEg77LLhoA956yIBtQGLrbjR89dUXFgyuAqFZqDBptpnmB0YEIcWBOZxJRBO
	OiD7UQABd9FvmleH+HYZQ2gRU9sCl9HyW/KUeFOWKRKhyyVaBqWaQA0XhSpImhpYqPD5fH
	tOqdwzF4GMqyZ5dEN0f0QTIfsZOJVpm6GwyviotXc7jghQC7zJrW/D8+ao/J3ND1lQvMxX
	oIL9h7w0/AVavEAkY9IUM45Y/rfekNFwwAVQlK0yN0c17D/J4qFfcZRbAdpjWkoNE0qym6
	GCZ1CEjVxoMGdZx1CGv3zHCZedeC7LqkqRNGyIXOVqHSKOonQNT4ON8I/0/7mQ==
MIME-Version: 1.0
Date: Thu, 27 Jul 2023 12:11:19 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, JaimeLiao
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: add Octal DTR support for Macronix
 flash
In-Reply-To: <ae53bde4-33d0-861d-b7f4-b86114cd6f58@linaro.org>
References: <20230727091610.234132-1-jaimeliao.tw@gmail.com>
 <20230727091610.234132-2-jaimeliao.tw@gmail.com>
 <ae53bde4-33d0-861d-b7f4-b86114cd6f58@linaro.org>
Message-ID: <4ffbc99f5174fe48182211d489efa115@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_031122_120501_BA856B64 
X-CRM114-Status: UNSURE (   7.09  )
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

Hi,

>> +	/* Macronix SPI-NOR flash 8D-8D-8D read ID would get 6 bytes data 
>> A-A-B-B-C-C */
>> +	for (i = 0; i < nor->info->id_len; i++)
>> +		if (buf[i * 2] != nor->info->id[i])
>> +			return -EINVAL;

We need some kind of per flash rdid override. I guess rdid won't work
in octal mode then. Are any other commands also affected?

I had something like a per flash .rdid op in mind where for this flash
you do like

rdid() {
    if (octal mode) {
        buf = spi_xfer(2 * SPI_NOR_MAX_ID_LEN);
        strip_every_other_byte(buf);
        return buf;
    } else {
       spi_nor_default_read_id();
    }
}

rename spi_nor_read_id() to spi_nor_default_read_id()

spi_nor_read_id() {
    if (nor->info->rdid)
       return nor->info->rdid();
    return spi_nor_default_read_id();
}

And also move the readid and compare code to a common helper, as
discussed.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
