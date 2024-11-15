Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A5AD6DDD5
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Nov 2024 06:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LzHqnryFSoHIevzt743dImasu5H1dxoyBsib/ACqCow=; b=TFTr8uNC8Qamei
	2nll+8qSYg4ZhySwlNa7AxtkBUPpdp9bq39IxPahaLMxs5j0A9ERkqKLSkp5hrpx+joeVEXxcR2id
	hQj16+3RF+8WZDj16SY/hA/lsXalyrwcqTq5lTpAvdKJ0Jga7TBZY+olTTCYXe0IZBleaomlnOpPz
	H8Z5tngMuRUgun0K09JPDPouxe8ODAV2/lN+cHylnikOSiJiU4Dm/d+AnhpixZHHYyjnEZN0yEO/T
	g7S0wX3QgZ7yC+cQ/B99LCXZ8bVUlSv8HlJE5IqcDdgTXDxwJjtz20lytfx2v3p8sce3hUxRL/Tkn
	Xpy5tjFire7xi33sQL/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBpxM-00000001nxp-2Xkr;
	Fri, 15 Nov 2024 06:37:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBpxK-00000001nxf-0Xft
	for linux-mtd@bombadil.infradead.org;
	Fri, 15 Nov 2024 06:37:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=zM9fKz5MJ1t7OEbVMi3Fdh2y0NYfPlc0oZSSZJHBOts=; b=ZaGRlatADh59XBHPFmWuexX7+e
	seQ6WV1KYP3Y9JobuYrq/Z3ko62uRfqxpsWXnSdLneti12ZKJsfH+eJ3/Yn7uFzb20ySgcT4c76aZ
	tWo0gKlee3JqHoLi4TLsTkmUxXKlDh6O934KCWhHl2XJeTgbFQXewT0sL6E8SH6BSZNV0zUw7f7yY
	0kYoJw4D+p8AlRB5flUeb1/LHn3HaeCJ6N4O/LPwOagoYE512tpU9FSbI9EruTPLMfPgimpZ7+grX
	Qz6tYjaEppNNHFl9fYpfUCiEsDjy3T8zsTdS9Hn53gTrsBHNU2KkADnXLUMFeWzOgg9VZiO0dY07k
	KMHjFAzQ==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tBpxG-00000000yjp-0ceI;
	Fri, 15 Nov 2024 06:37:17 +0000
Message-ID: <ea59021e-2c52-435c-8de4-34e00edb40c7@infradead.org>
Date: Thu, 14 Nov 2024 22:37:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] jffs2: Use str_yes_no() helper function
To: Thorsten Blum <thorsten.blum@linux.dev>,
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>,
 Zhihao Cheng <chengzhihao1@huawei.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241112183113.173127-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20241112183113.173127-2-thorsten.blum@linux.dev>
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



On 11/12/24 10:31 AM, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_yes_no() helper function.
> 
> Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  fs/jffs2/nodemgmt.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)


Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
~Randy

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
