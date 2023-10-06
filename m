Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CDBE92FF8
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Oct 2023 08:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/wPX47/0knPaO9tuSMe8EgPiGs3moTpHddKksfgJrA=; b=VMARFBmdb8owPo3P3h1QlmbEOF
	x/UlnhEVot+5xQ5XcnnNpMuPOjaj6ogjia+nLwrT8ljIL+GDSIDOJZKk2mWCWEg8o0dmH6VijjRlL
	Y0jubPYJGiv5AekKZ57UVUWhPBy8rKbvxpu2kU9YWp7qdbPD6ptM6mazZ5L5QS/k58qZZINjQ+ZH1
	A5wpPn+6XwEPA4IEIvjTHie6xxcjlSwswX4siJP+O5L5lilUDV7SnMyTCF0YLayni33uGyUyzgp9n
	k2zWHLeYWqI0D7OTu/jJ1xaONa5G2uUvigGCcf4DxHY8tEYcQuddQ2uw6p6oI7kXji8Nu2ghDF7Dg
	Z1/Q+Y3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qog7Q-005HAj-2o;
	Fri, 06 Oct 2023 08:23:32 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qog7N-005H9Z-27
	for linux-mtd@lists.infradead.org;
	Fri, 06 Oct 2023 08:23:31 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id D06ABEA6;
	Fri,  6 Oct 2023 10:23:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1696580605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oLg79HnG703mEZIT/6RKZmJQhfrMvBoAbDPYGd1rZpE=;
	b=hdqIf9ZnUpXpY7WJs2VukggaKcwVhVGQBz3kNEG00/ULgVV2vZ1+31MsBK5KpUGgHso+cP
	uaGBGC8yymlaP2/Hgd/esjRTpZP6W9A4t2BF6DVxPsxJ4Mf43a8kHhh7L0kWXQQH3FUOv1
	tuvagAkFht8Hw1hnP2uCimL5kdVYQsoCD2eoN4opGioH7mhgK+pBWGeNgwW4k/gjApxNr4
	Px6C7eNNcvCd2No8SuZ1jhG7I3tM6hoFKtZ6sGvrF0Aro+bUVsELYDbx1Vlc15PlQq/PQF
	L4HmyoYx4swTiv6wrZXcRFVK67Vza1Seao0ObtgHbUCVmGZHCUCI038oNoQ9BA==
MIME-Version: 1.0
Date: Fri, 06 Oct 2023 10:23:25 +0200
From: Michael Walle <michael@walle.cc>
To: Angelo Dureghello <angelo@kernel-space.org>
Cc: linux-mtd@lists.infradead.org, pratyush@kernel.org,
 tudor.ambarus@linaro.org
Subject: Re: EM016LXQAB313CS1T
In-Reply-To: <3608d2fa-5097-bd94-5dac-9fea9d45654a@kernel-space.org>
References: <6e5e4221-9abf-e572-304d-1150ebd15ab9@kernel-space.org>
 <fbff7dde1b2d6c85650fe16560ce38a7@walle.cc>
 <3608d2fa-5097-bd94-5dac-9fea9d45654a@kernel-space.org>
Message-ID: <d5d2237190b6048c3d690bd9eafc5cef@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_012329_846538_D3F04D6E 
X-CRM114-Status: GOOD (  13.62  )
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

>>> as far as you know,
>>> is there some development ongoing for the EM016LXQAB313CS1T
>>> mram ?
>> 
>> No, in fact, we'd like to get rid of these MRAM devices as they don't
>> have anything to do with NOR flashes - or move them over to the at25
>> driver.
>> 
>> Now I see that this part is rather new, supports faster modes and
>> even DTR, emulates erase op codes, etc. But they are lacking SFDP 
>> support..
>> 
>> You might get away with adding an entry to the database with it's ID.
>> But please *don't* use the SPI_NOR_NO_ERASE.
>> 
>> I'm curious, do you have a board with that chip? If so, why don't you
>> use a cheaper NOR flash? Genuine question.
>> 
> 
> thanks a lot for the clarifications, i am working on a custom
> hardware that should mount this chip, not sure it can be
> changed at this phase.
> 
> Supposing i can have it working by the spi-nor driver,
> is it possible to see the device as memory mapped to be
> accessed from userspace ?

You'll get the ususal MTD device /dev/mtdN.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
