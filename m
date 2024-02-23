Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AE8C54E49
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Feb 2024 10:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDtpxBSANEpo9acSetWa/9e4r2vPecD8rsvUT+EqvRg=; b=sYvSDC/NrN3gdC+ugGhc4agXGY
	H6C+pk6EL0e/F2HMmk9LG2PlGNeq7vdkW2IULdQ4jdKwqYGGtR/VT+6DlLzb3XwB1h4MCkabJf30m
	5O+ibTkaprxcfShUAGsqZsh5UNFNidzW7rJaEiCtsyUPaxpFwuCQLr/e+dgw8N9nG4kd1+i1ULiRB
	2mbPGAlpVq3Xsnkewh7q1hPSOXAug45ZFyd5S/gs76n94r9uec8WoeEU09xhVF2Lf53LC7xUOGnrq
	i2ElFVMgTXn6eC27D58hUHD7/1re9V6ggE77cBmHSaptTxGZpHJT+2Q5Yiilp9G3IWnUZsIuQ6HM8
	wLmrtXZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdT14-0000000905x-2HBG;
	Fri, 23 Feb 2024 10:42:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdT0q-0000000903A-0GbU
	for linux-mtd@bombadil.infradead.org;
	Fri, 23 Feb 2024 10:42:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=a9d0GtZONZS/Opk6ATB8kqrwqppk5tp5+ExVhkwWwcU=; b=Skv7hr8/KRDHGJYhrvhCGT0jvf
	rGhFdu/EX9WC3AqdbbynI8kQegUIwesGTEk4fiuSPmQ565yb+tJaxwAr3ZNNxW4mSY+hNnoUwj8uP
	gjTBZnqPa6wmmfe/+nLl9r9MjDS8ymzQJIW+E80O5I9tW7j0scAPFnI166sIaN46PpqcoJkuvKl94
	nwPVDNO8qZxOifuoRyLhssTaL0CUKtTpSz/Q2LqU4tQewb/iUxR2QNPS+tmJn3HCP1UIIX2cyANQt
	VKcBux2CMhzptEZml0NVWMW5kH3fEhe6T6ilvtowxaxH32Geq632ZCVKfUiD8xdKuZu13cbG8exWb
	SUYE9ccg==;
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdT0m-00000006idq-22pQ
	for linux-mtd@lists.infradead.org;
	Fri, 23 Feb 2024 10:42:39 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Th6383HPnzXhFj;
	Fri, 23 Feb 2024 18:40:04 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id DE1791400CA;
	Fri, 23 Feb 2024 18:42:01 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 23 Feb 2024 18:42:01 +0800
Subject: Re: ubi: why ubi wear leveling always pick highly worn-out free
 physical eraseblock
To: Ryder Wang <rydercoding@hotmail.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "richard@nod.at" <richard@nod.at>
References: <MEYP282MB3164FE84067710E5AC8D34A9BF7A2@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
 <MEYP282MB3164D303B64CFF576D2FD741BF552@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
 <c14e432f-a03d-782b-48f5-f77577e29e83@huawei.com>
 <MEYP282MB31641A84730F7FB15578662DBF552@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <4e19c4df-19f0-2e90-4dc1-c164890a1e70@huawei.com>
Date: Fri, 23 Feb 2024 18:41:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <MEYP282MB31641A84730F7FB15578662DBF552@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_104237_174550_8D82BB75 
X-CRM114-Status: GOOD (  17.27  )
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
Content-Type: text/plain; charset="iso-2022-jp"; Format="flowed"; DelSp="yes"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

在 2024/2/23 18:14, Ryder Wang 写道:
> Hi Zhihao,
> 
> Thanks for your reply.
> 
> You explained why e1 and e2 use picked to compare with CONFIG_MTD_UBI_WL_THRESHOLD to decide whether WL is needed. That's right as I also mentioned. However, the point is that why such high worn-out free physical eraseblock (in ubi->free tree) should be used to store the data of e1? High worn-out PEB should always be avoided to use (low worn-out PEB of ubi->free tree should be preferred), right?
> 

Since e1 has smaller ec counter. because it comes from ubi->used tree  
and likely holds cold data, so it won't be erased for a long time. If we  
choose low worn-out PEB from ubi->free tree as e2, the high worn-out PEB  
can still be used to store new data and be erased again, which will  
aggravate the worn-out of high worn-out PEB, but actually the high  
worn-out PEB should not be scheduled for using. So, the best choice is  
that make high worn-out PEB hold cold data, which can stop frequently  
erasing worn-out PEB.

> ________________________________________
> From: Zhihao Cheng <chengzhihao1@huawei.com>
> Sent: Friday, February 23, 2024 15:11
> To: Ryder Wang; linux-mtd@lists.infradead.org; richard@nod.at
> Subject: Re: ubi: why ubi wear leveling always pick highly worn-out free physical eraseblock as the mov_to target
> 
> 在 2024/2/23 11:27, Ryder Wang 写道:
>> Refer to the ubi source code:
>> wear_leveling_worker
>>     e2 = get_peb_for_wl(ubi)
>>       e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF);
>>
>> The function find_wl_entry() always find the  highly worn-out free physical eraseblock (e2):
>> 1. It's good to check such PEB (e2) to decide whether the following wear leveling procedure should be continued according to UBI_WL_THRESHOLD.
>> 2. But personally I can't understand why such high worn-out free physical eraseblock should also be used as target PEB(move_to) to store the move_from data for wear leveling purpose. Will it be much more reasonable to use low worn-out free physical eraseblock (from ubi->free tree) in this case for more perfect wear leveling?.
>>
> 
> Normally, e1 is the smaller ec counter picked from ubi->used, e2 is
> bigger ec counter picked from ubi->free, the wear-leveling worker
> follows that rule which is based on the realization of free PEBs fetching.
> First, let's talk about the simplest case without fastmap, assumpt that
> CONFIG_MTD_UBI_WL_THRESHOLD=2, there are total 3 PEBs.
> Only 1 EB(erase block) is used, then free it, and repeat the process
> forvever. According to the implementation in
> ubi_wl_get_peb->wl_get_wle->find_mean_wl_entry, the ubi->free tree will
> change like:
> (1,1,1) -> (1,1,2) -> (1,2,2) -> (1,2,3) -> (1,3,3) -> ... -> (1,4,5) ->
> (2,4,5), which means that wear-leveling worker is not needed, because
> find_mean_wl_entry has made sure that 'max_ec - min_ec <= 2 *
> CONFIG_MTD_UBI_WL_THRESHOLD'. Similar, when there are more EBs are used
> and freed, there is no need to trigger wear-leveling work.
> However, if one free PEB is taken and not be freed, other free PEBs are
> taken and freed, like:
> ubi->used: 1
> ubi->free: (1, 1) -> (1, 2) -> ... (x, y)
> After a while, min(x,y) - 1 will be greater than
> 2*CONFIG_MTD_UBI_WL_THRESHOLD. Then, wear-leveling should start working,
> cold data always takes certain PEB for a long time, which causes PEBs
> with smaller ec counter gather in ubi->used and PEBs with bigger ec
> counter gather in ubi->freed.
> I think that's the explainations of the rule how to pick e1/e2.
> .
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
