Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13576D58D4C
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Nov 2024 13:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=giOJ+jR38MYg8+hIO6v3Y0fC1pcVbL5vjWbcfmIMDqQ=; b=4V/0SQvsr4ikIM
	ryfRHAu8pkTVU0x3Im45I7nHaxT/C/y8weJtCy4fWMA987P6zAUGPAnleeUR1g+d2bjA0+kgbFtY5
	hQ+Of1m+1ssbJa1x2LHjCWCZ4FXEF4FkCsmMNqWV5JH5fl6vjGHrAlhd0u9DY4gQf0CJSsDS7Lwa0
	vcJ2CavWEyB3H9NHiO0xL4AuUBq0i20z8fa7f6Ovj/3G9CD/TzSsICGmUrWzJ27R/EbeYzNqQYnaW
	h/pN19Ts2LE8J+saZMgOaZO8dllGkit44sSb2h+1dIHTwy3MHBUbvO/j350peKW7OJTeYv/CL0JJN
	7X9sZfIfDh6T72Uk3bdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFZcp-00000008DDo-0ZAC;
	Mon, 25 Nov 2024 13:59:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFZcl-00000008DDM-46Et
	for linux-mtd@lists.infradead.org;
	Mon, 25 Nov 2024 13:59:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2EEB4A40DDB;
	Mon, 25 Nov 2024 13:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA9CC4CECE;
	Mon, 25 Nov 2024 13:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732543174;
	bh=ucAXv8kZ12VdJYQNdB6I+hwZKHGi3nJZiEs0F3G7qrI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=G4jYnK1HTsvPIfacNb/NJRXwWcl201z57V7DT9T4Ki7WUujm6XuQSSBmhaUymXY9O
	 eeM98xHpUdRW+5tbURoiWxFkkcSbOKl/niDgU+UjId6uaRdjrWz6gcO8MRFhXSRsrX
	 7jPR6uGgU7hbIeKahgJXxif3t+0hr7tk7SukGkaUXwPYJjE34pG72ST8wPpXPIqTQB
	 1lsTRmJfygwb5Rnev+HjbciFSzOwpOKpKzQ/kFTtVP56yr3r67VKktwf0MMX0WJbXG
	 jclfumjVCz9qDCKWkffMZdfdY5Hh+bwIaFdNa0ez8xDbaPy6NF9lb1+CCBhNIHL47R
	 1qpWjN2NIfSUA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Parth Pancholi <parth105105@gmail.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Parth Pancholi
 <parth.pancholi@toradex.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: macronix: remove mx25u25635f from
 parts list to enable SFDP
In-Reply-To: <0525af7c-f9a9-4dfc-9fed-97efc438b2b8@linaro.org> (Tudor
	Ambarus's message of "Mon, 11 Nov 2024 10:49:12 +0000")
References: <20241105105844.257676-1-parth105105@gmail.com>
	<0525af7c-f9a9-4dfc-9fed-97efc438b2b8@linaro.org>
Date: Mon, 25 Nov 2024 13:59:32 +0000
Message-ID: <mafs0iksb5s8r.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_055936_079114_C4F1CF49 
X-CRM114-Status: GOOD (  12.04  )
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

On Mon, Nov 11 2024, Tudor Ambarus wrote:

> On 11/5/24 10:58 AM, Parth Pancholi wrote:
>> From: Parth Pancholi <parth.pancholi@toradex.com>
>> 
>> The Macronix mx25u25635f flash device supports SFDP initialization.
>> This commit removes the specific mx25u25635f entry (NOR ID 0xc22539),
>> along with its size and flags, from the NOR parts list. By removing
>> this entry, both mx25u25635f and mx25u25645g (which share the same
>> NOR ID) will utilize the generic flash driver configuration.
>> 
>> This change allows both devices (mx25u25635f and mx25u25645g) to
>> leverage SFDP-defined parameters, enabling dual and quad read
>> operations without the need for manual adjustment of no_sfdp_flags.
>
> I'm fine with this. We may re-add an entry when BP is used or if someone
> reports there's a flash with this ID that doesn't support SFDP, which
> has a reasonable amount of probability for macronix flashes, but I'm ok
> taking the risk and fixing it afterwards if reported.

Sounds good. Would be a good idea to queue it early after -rc1 so it
gets some time to bake in linux-next.

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
