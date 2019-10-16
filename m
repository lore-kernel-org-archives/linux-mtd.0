Return-Path: <SRS0=UEO3=YJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06499C4360C
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2019 09:31:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C171E20872
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2019 09:31:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TDjMgSSd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="q7FdWqu1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C171E20872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZDAIn5777C1sGSCeSleb5JKou72ZtwVnc3fjxs5sMhM=; b=TDjMgSSdLJWOy03+aWra06IpF
	rjR+3d7jWbpuRvKMv6W2FwCqt3Hnth99haKmurHTuNinNQW3ZCaKIsXI36wrsPXvC+y5jKHGVVcqk
	YeVgqAaSm1M0g4S58Bq6mqOJqJcMkXE/Wve3NEZbUaHNQ0st4bxuBVyl0GJgBHCg0ibUFXazkUliu
	++vgHFu0mhUQerlcOszyi3Kz0u4lVSG4jtt2KgRLwPkVbMHHE8IfYgEO6oR7I36bI6p6QDGZGDZWO
	U/ZOkh4/xggz5KMdA7wlNqXNbZ+rWi1xQ0jIQ+r3ZNiam7jR7OHPWe5vkUI8aCtvQ/HzeFWVPYuPD
	bS6LrmXmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKfe5-0005om-1h; Wed, 16 Oct 2019 09:31:05 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKfe2-0005oG-Ol
 for linux-mtd@lists.infradead.org; Wed, 16 Oct 2019 09:31:04 +0000
Received: by mail-lf1-x144.google.com with SMTP id w67so16877325lff.4
 for <linux-mtd@lists.infradead.org>; Wed, 16 Oct 2019 02:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=sl+7BK2jp7A+cSVbVJKUXGCLSS9YC6yPbtSKUz2gSJc=;
 b=q7FdWqu1Qj3oRiCd7ImAo0SrZvhhT3LOsAXPR50sE8BuOGYucWG5TxZljpCl2dLHcs
 Ix38bLRbHWiBxV6ENyZJ58cEMp6SYi/OIT78RxCiXjUYlR36YlrRJ4kbEfJvXJb1nfCr
 N1G9PPtEznfFbwP7L+ujiVwTDTkdE5DEhZ1xqKdWeDeJ65rvxNpyAjbtUSyiYE6VCE7H
 9vn2ECdFMECRlPyQ9w7n6BMOiWI0yZFyPt5pzjhbVq45WIM4MthOH8MmTdsUeyNX5Wct
 nmpLe3daadjaA/n6Wy5vcYuUBdpfOWJfhnjVPl3K8Zr+P558hatB1dQ6f7lBwXJO51j3
 9c5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sl+7BK2jp7A+cSVbVJKUXGCLSS9YC6yPbtSKUz2gSJc=;
 b=sgUJpT1lO18YBC3hdUkD2jTrqXJUTadeT4uPxtKsMGkAXIQgZmx+/l+d3hakvqFXis
 auaiV/eQaVHDW+cnjidDD/D8Rh/DDGN3C8cM9wk+K1cNWG23TOKnKY2sfIckFQCqaTHn
 IgaNEx+VGP9rAOxjwh61BfpD+7kCc3ewRSmY8lrXNdApctIe2Yp1o8YXPA60dfE5QKBM
 P6lPpww8aM6SsmCWNg9uqD357mLi4QuGYZDhg1Vj17tA6xboA+VCwOPUywooc4NqsH7H
 Y++NqktqWAe5MXX5J3clZo405HUBolG30nyztFve2yRpZ0SG4iIjZUsUflN19L8HS7S4
 FTaQ==
X-Gm-Message-State: APjAAAVZHi+ZGA4J0XWaOz1+NH8YCJtUbGbVdarQOoxxvKlPQL2+8DEa
 kHh7fESKvox5VnfQf0DR/mvO0bZMpnSYlA==
X-Google-Smtp-Source: APXvYqw3f9cIbZw15BFSVhxvZxbs4V0npI8OC53qWAxABGrJjKhekcwfzlkNfLCdwaBEjiqmJ+lqBg==
X-Received: by 2002:ac2:4946:: with SMTP id o6mr22967140lfi.86.1571218257149; 
 Wed, 16 Oct 2019 02:30:57 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:8e0:2361:51d3:678b:85a3:b6ef?
 ([2a00:1fa0:8e0:2361:51d3:678b:85a3:b6ef])
 by smtp.gmail.com with ESMTPSA id q14sm5937073ljc.7.2019.10.16.02.30.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Oct 2019 02:30:56 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: fix silent truncation in spi_nor_read()
To: Vignesh Raghavendra <vigneshr@ti.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
References: <72e77a25-fe33-b88e-bfe2-654e10281fba@cogentembedded.com>
 <04bdd57e-5b5b-55ce-dc9c-e04097af8e27@ti.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <db02e68e-70ba-5ac2-e159-38d54bd9d34b@cogentembedded.com>
Date: Wed, 16 Oct 2019 12:30:47 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <04bdd57e-5b5b-55ce-dc9c-e04097af8e27@ti.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_023102_874112_6703BCB2 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

On 16.10.2019 8:18, Vignesh Raghavendra wrote:

>> spi_nor_read() assigns the result of 'ssize_t spi_nor_read_data()' to
>> an 'int ret' variable, where the silent truncation isn't really valid --
>> ssize_t is a 64-bit type and *int* is a 32-bit type on 64-bit machines.
>>
> 
> Good catch! Curious to know if you did observe any real issue because of
> this bug?

    No, found it just looking at the code.

> Regards
> Vignesh
> 
>> Fixes: 59451e1233bd ("mtd: spi-nor: change return value of read/write")
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

[...]

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
