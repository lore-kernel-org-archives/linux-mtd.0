Return-Path: <SRS0=cUeG=NX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=BAYES_00,
	CHARSET_FARAWAY_HEADER,DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADD9C4320E
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 08:33:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 600AB61057
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 08:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 600AB61057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wcRBWXyV6osZP9cvfEEjgP9x2HDhuOIsxLlx1iO14kY=; b=IViBECaDDiqv6o
	Qv31fjRsDFS5IRRahoGi/QM12gH6zh0Zusw9HgpcOwusQURQURhfSkBVFQLH/ymrChIHfoBLeZ9fV
	9dekNUa+Mvtek/DGXv3GU9PXdJ29+OgsnogrxIBXYk5p2YKYG0pDuS0osGoCqqXZzbqSebYQGOgyR
	fcZh292Qs7on3inQVA4tdU78xhzxQusXEFmlzS3+f7vh+O8hMPZOCVwOjqXFbbJkQKzVjfs23p74+
	9VvQ9Wt9CZkz9Jky5+/gEFLwh5ILaRq+gVW1kRvFp5FOAslckLCt5fTGAYDOXWFmZ3IjoaSweu5/Y
	f2uElju3QJ6BOb1tU1YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLLfP-004aD1-0v; Wed, 01 Sep 2021 08:32:19 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLL7l-004ROC-HT
 for linux-mtd@lists.infradead.org; Wed, 01 Sep 2021 07:57:34 +0000
Received: from dggeme718-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4GzxGT3tfzz1DFb3;
 Wed,  1 Sep 2021 15:56:49 +0800 (CST)
Received: from dggeme768-chm.china.huawei.com (10.3.19.114) by
 dggeme718-chm.china.huawei.com (10.1.199.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Wed, 1 Sep 2021 15:57:31 +0800
Received: from dggeme768-chm.china.huawei.com ([10.8.68.56]) by
 dggeme768-chm.china.huawei.com ([10.8.68.56]) with mapi id 15.01.2308.008;
 Wed, 1 Sep 2021 15:57:31 +0800
From: douzhaolei <douzhaolei@huawei.com>
To: "dwmw2@infradead.org" <dwmw2@infradead.org>, "richard@nod.at"
 <richard@nod.at>, "jamie@nuviainc.com" <jamie@nuviainc.com>,
 "christian.brauner@ubuntu.com" <christian.brauner@ubuntu.com>,
 "trix@redhat.com" <trix@redhat.com>, "wangqing@vivo.com" <wangqing@vivo.com>, 
 "yang.yang29@zte.com.cn" <yang.yang29@zte.com.cn>
CC: douzhaolei <douzhaolei@huawei.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "wangfangpeng (A)"
 <wangfangpeng1@huawei.com>, zhongjubin <zhongjubin@huawei.com>, Zengweilin
 <zengweilin@huawei.com>
Subject: =?gb2312?B?s7e72Dog?=
Thread-Index: AQHXnwcER+27g0e3yUOalIBxHdJvdA==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 35
X-FaxNumberOfPages: 0
Date: Wed, 1 Sep 2021 07:57:31 +0000
Message-ID: <a714246a6dd44dc6baddaed323e76960@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.103.61]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_005733_830433_D869EC83 
X-CRM114-Status: UNSURE (   1.68  )
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
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

ZG91emhhb2xlaSC9q7O3u9jTyrz+obChsaGjCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
