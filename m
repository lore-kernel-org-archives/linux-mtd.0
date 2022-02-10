Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CEDC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Feb 2022 08:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijjDy5iLu6YMKkElqpkxdGyLg584W6Zt2BVqZubU7Q4=; b=ug8UfzTDzC6/jZ7/NoXyWqYcKs
	ThUVMptP5zVNL/+cofT1MLHjtLNIbDvxTsg2hPcEK3LxFY5eOkAxXO50MB81PdklFkPJuq1c9YgeV
	8+JI94NXZcrvJi907QJKFtciQ2R58McqDkcOuUs1uUkAWrE2w5eAw8saGwPYoLLUgPYbx+g9/cHXJ
	MA9DI4fH5Hz7GIurumGBQUKrMfXFVt6IXIM/Sy+Kfn3CmDGNosvqa8tVmpYK+RYEiAX4AdZ06c885
	/4JjBQ86Ei0FqGdnf/0MrwuhvJ7y00KqEPv81tYYXJltuvrzijW8DI14TGrXeB5tHQoFHJIEoIoe4
	LYt8N+nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI4RL-002zPN-Fx; Thu, 10 Feb 2022 08:04:31 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI4RI-002zOD-Ba
 for linux-mtd@lists.infradead.org; Thu, 10 Feb 2022 08:04:29 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id A53D42223A;
 Thu, 10 Feb 2022 09:04:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1644480266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bCRjulaua8nbar2xx5MsVkSgjkg/+PvqvIadAhk7kp0=;
 b=pypwTD4zSgrT/56iiczgSgNcWigGU0stm268lPi1hbcoaYT0nyWhFwNqv3HQlgcWxSHRFL
 8yT1XWrnGXLEjcBzZac7XhwuKespg+iI4znKJOFoi3V4SRodv3OZMyVKmQ20CsOynneoLW
 +vj23a2IUqTDmbKdhTsUunQvHmVWTf8=
MIME-Version: 1.0
Date: Thu, 10 Feb 2022 09:04:26 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: Re: [PATCH v1 05/14] mtd: spi-nor: xilinx: rename vendor specific
 functions and defines
In-Reply-To: <68aa414b-7a9d-1330-531c-37b2db2ab09d@microchip.com>
References: <20220202145853.4187726-1-michael@walle.cc>
 <20220202145853.4187726-6-michael@walle.cc>
 <68aa414b-7a9d-1330-531c-37b2db2ab09d@microchip.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <73d3d8ed2cb4ca1b06902b767fe529c3@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_000428_601037_3508033D 
X-CRM114-Status: UNSURE (   8.11  )
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

Am 2022-02-10 04:08, schrieb Tudor.Ambarus@microchip.com:
> On 2/2/22 16:58, Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the content is safe
>> 
>> Drop the generic spi_nor prefix for all the xilinx functions.
> 
> mm, no, I would keep the spi_nor prefix because xilinx_sr_ready is too
> generic and can conflict with methods from other subsystems.

But all the other functions in this file start with xilinx_ ;)

I don't have a strong opinion here, other than it shouldn't
be called spi_nor_read_blaba() because that looks like a
standard spi nor function belonging in core.c

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
