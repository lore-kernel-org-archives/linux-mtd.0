Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74F4CCFA19
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Nov 2025 09:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NO1UAQxERxYqzL6hPYyhgTtD6z9GDdM9eSTtOZoq1JU=; b=Lt3FAmPRys046zaAkpCJTW6e1l
	BSjbG+gawwf6T0ahDaJE7ShNwoZ/UrHWuSp7STlNFCdYzzSUwY007q6zTMUUk6r+d5yrnJB1KueOE
	AV/lazEar6Rr9qNCP7ltKo6825NdUtklT+O52Dzw3veTOxxKCqs75nC87l3oogS7zsfizKafoFlaD
	MSCiDJyvCjSdwBsNCDKCMM5UuZG6gPoXL4km++rlPEq57ZL+dd2sWIJmjwPk8PqyEYQkH1Q7qkiJA
	5OFBm9KQwczWS5+CU+zOCdg2Ha7PVeAxnFImxdlNY2k4FyDgj2YUzP+BZrk0D7c7SiEqe8WOV+270
	IOIUupRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIwI-0000000Gyth-41kp;
	Fri, 07 Nov 2025 09:39:26 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIvt-0000000GyP2-0VnG;
	Fri, 07 Nov 2025 09:39:03 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=6lG6deOb5NWhbiwLUm26+RJ/9qVvh6HCnpI4bUBb76I=;
	b=v5tgvizviGkzq6i9w85nQ0e/oouNS2MNUiLdxt1++3ztywUoe0t2IHd/856wrUOr6RNNybqzg
	+ij4oQejd07Q42moNksHixcS7PwAq4Y4FOp5cCJ6jpQsdJUs94BcKN9bhvTb9VhEbrVFDxCt0NH
	Mk9TP6lEIvUCkEIqIAdebLc=
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4d2v9632KgzRhRy;
	Fri,  7 Nov 2025 17:37:14 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 65501147B8F;
	Fri,  7 Nov 2025 17:38:50 +0800 (CST)
Received: from kwepemq100008.china.huawei.com (7.202.195.91) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 7 Nov 2025 17:38:50 +0800
Received: from DESKTOP-DKE2JV6.huawei.com (10.67.110.146) by
 kwepemq100008.china.huawei.com (7.202.195.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 7 Nov 2025 17:38:49 +0800
From: Liyuan Pang <pangliyuan1@huawei.com>
To: <markus.elfring@web.de>
CC: <alexandre.torgue@foss.st.com>, <chengzhihao1@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<mcoquelin.stm32@gmail.com>, <miquel.raynal@bootlin.com>,
	<pangliyuan1@huawei.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<wanqian10@huawei.com>, <young.liuyang@huawei.com>
Subject: Re: [PATCH] ubi: fastmap: fix ubi->fm memory leak
Date: Fri, 7 Nov 2025 17:38:43 +0800
Message-ID: <20251107093843.1077536-1-pangliyuan1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <396b2d11-29ca-4fae-97c3-7280c879cbfd@web.de>
References: <396b2d11-29ca-4fae-97c3-7280c879cbfd@web.de>
MIME-Version: 1.0
X-Originating-IP: [10.67.110.146]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq100008.china.huawei.com (7.202.195.91)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_013901_624053_56CFE2A9 
X-CRM114-Status: UNSURE (   9.46  )
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
Content-Type: multipart/mixed; boundary="===============8385777399132265494=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8385777399132265494==
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

>>> …
>>>> +++ b/drivers/mtd/ubi/fastmap.c
>>>> @@ -1644,3 +1644,15 @@ int ubi_update_fastmap(struct ubi_device *ubi)
>>> …
>>>> +void ubi_free_fastmap(struct ubi_device *ubi)
>>>> +{
>>>> +	int i;
>>>> +
>>>> +	if (ubi->fm) {
>>> +		for (i = 0; i < ubi->fm->used_blocks; i++)
>>> +			kmem_cache_free(ubi_wl_entry_slab, ubi->fm->e[i]);
>>> …
>>> +	}
>>> +}
>>> …
>>>
>>> May the local variable “i” be defined in the loop header?
>> 
>> I think it's better to leave it as it is, most of the code in
>> ubi defines variables outside the loop header, and defining
>> "i" in the loop header may cause compilation error in some old
>> kernel versions that use C89.
>
>Would you support to reduce the scope for such a variable to
>the code block of the if branch?

Ok, I will send a v2 patch.

Regards,
Liyuan


--===============8385777399132265494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8385777399132265494==--
