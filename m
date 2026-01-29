Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8471D61013
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jan 2026 13:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oOpep/2hYw6DJ8b5H5T6a01CVT9SH+pDdd1agUfndQs=; b=s2g6+C27QczVLz
	Ev+n/07mQvD3VfNzkQeRf397L8mU3C9GWH7B+EtvPA7tRa2gpzJlwnBgPziiUD0bUymsg/bNfpsAx
	IOhHKBFyfmjE5Bzc501G2aUg1XJjsfaYkCv0uEtM7VHeBAgr9CEkxRzzV9ksaKOjrEfRhXQ8mJogm
	Zi5cZqPQG9d2F1GwRwIvPuDEf1vOMQortA/71hkbdux8Pw9gZJsVb9tN7MeqIEli66YzlS5dqyXY4
	ZZYjP8X5K6C6Dms+4+LalOwsiWAIKjAqDf0BRepVdtWq8pzafEfVzHmgeB0VHHca6Cz3mkll/gnrm
	kknOi9gWJn1Qdnr0qxjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlRiw-000000008Lk-0WLL;
	Thu, 29 Jan 2026 13:06:14 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlRir-000000008JL-3nB3
	for linux-mtd@lists.infradead.org;
	Thu, 29 Jan 2026 13:06:11 +0000
X-QQ-mid: zesmtpsz4t1769691913t366438cd
X-QQ-Originating-IP: gz+CZwWd9plegMHqHSJgsZdH2WQTASPPIlBKPKpeCCc=
Received: from [192.168.0.109] ( [110.81.94.113])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Jan 2026 21:05:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9450623713281733181
EX-QQ-RecipientCnt: 11
Message-ID: <B4C4E86D6B3966B4+c6e5887b-f61a-4425-8608-d4dad52fed69@radxa.com>
Date: Thu, 29 Jan 2026 21:05:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] mtd: devices: Qualcomm SCM storage support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Xilin Wu <sophon@radxa.com>,
 Junhao Xie <bigfoot@radxa.com>
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
 <d0652707-c983-4deb-981c-b1584168e330@oss.qualcomm.com>
From: Junhao Xie <bigfoot@radxa.com>
In-Reply-To: <d0652707-c983-4deb-981c-b1584168e330@oss.qualcomm.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: M1RocC0a9oEUB1s3OPAAUNbmd8ZddQaz/jHhsiI+tPTnRw4OoAtcHyPz
	YkYT0Ffk/BWfrzcFyyO2swPu4xsi7Gjev2UpQpJILwzcdmfDoVNAwFe+e/SV9iNmaI05dpI
	aurbkzNfUe7vWwX8ZJlfdvDixAQSBIl+sobi+y8vlNdQtDZHwrGEj/ohui/C7F1jiJ6ghJo
	3VnZRcKl9t7ZjbYh8krcXFXQH0uBMiFSFBS2smTr+Uf6fe47JENasZ8IcU0qLQwE3zUMBo8
	nPenaFlJe3VoSgCNCxFkJJCPIJfeUPphY3RvahCfF7h7CHB1TyVjliyWnbriSSSmKPgJZ5I
	IgqwjxQHSoJud6NKVwlL8fHES08GOJur6eIZHce9egoTjk+Vj+ZK16gZGtHRRiTy9sKOmuW
	OwLSEN+FNmMIPbN4UoMvXMu9+tG8kXQg9AXpzMGCETWQo8BYMDYgnw4Qjm4UX4xEadBqUks
	8fcyTtbQ2tYRf4xBDVhD2rrkC9tABOMGSfPSy4TQlsuZ+6EnAL2zBncohepIFqWkfCiEPru
	0zok1CZa/rIpppwvxuhK1z9XSQ7EUCXzLP0Op9mfjg2GQQPiYVMtvxakawUtLZP/ivQY+z4
	1PrczJFEbs9CJw7WLMQfnd7xfQ2i3AzPoH6hoU+MuF2QwVHmUoqGezVWM9Ra/mL0ykbkji5
	RQ40Ot5HoCtk703QW6FYtCupP5OnsG9LvYGjjuqqR8vXYtcMe0FVNcqYBZn94l5Q/4sw6G2
	fFBEVgwWioYXRWuCegy8xTJfKFCpHTnIAfDR/d/XGz122m9Qk44FS/mcXMSBLdvpBIKKMgs
	rkeCqFAGB4sl0bTQ8C5il/QE2Vh0oBP7qYvNhgwNrL+xqzrXiXV9fxsT4vCQxHLJXvpli7G
	tE7GLha4HFndDHCeZ9Jk7ha2u/6N4G9cQ3U3cSXPZSx+tzoTwrQlGYGTx7JdvMMeBy9V+MM
	JPtTaJyl0ibFgyF3UScGQ9QCPW0L6vchR2YLnSdc/beH4cYZu6LATpGV4+YwATkkWlolZ3b
	Dy16k0mI30yMLRFs8rdhe/V32tP14sFDsmTgmSff4ENQ74hZKg
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_050610_401429_43779290 
X-CRM114-Status: UNSURE (   7.79  )
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

On 2026/1/28 21:26, Konrad Dybcio wrote:
> On 1/26/26 12:44 PM, Junhao Xie wrote:
>> Junhao Xie (2):
>>        firmware: qcom: scm: Add SCM storage interface support
>>        mtd: devices: Add Qualcomm SCM storage driver
>>
>>   drivers/firmware/qcom/qcom_scm.c       | 161 ++++++++++++++++++++
>>   drivers/firmware/qcom/qcom_scm.h       |   3 +
>>   drivers/mtd/devices/Kconfig            |  17 +++
>>   drivers/mtd/devices/Makefile           |   1 +
>>   drivers/mtd/devices/qcom_scm_storage.c | 265 +++++++++++++++++++++++++++++++++
>>   include/linux/firmware/qcom/qcom_scm.h |  34 +++++
>>   6 files changed, 481 insertions(+)
>> ---
>> base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
> This is 6.19-rc7, please rebase on linux-next/master (the series
> doesn't currently apply because this base is essentially a full release
> behind)

I will rebase the series onto linux-next/master in v3.

> Konrad

Best regards,
Junhao Xie



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
