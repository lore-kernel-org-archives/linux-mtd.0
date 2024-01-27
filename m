Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92BAC46CD2
	for <linux-mtd@archiver.kernel.org>; Sat, 27 Jan 2024 09:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LsyVmCNUa5tnTvy8v1s3ABfsW1oy6JykeZ6YGs2tGwU=; b=HUVACumSv5Xdtmst3CFgozEIl/
	g/YGHR1kofQDOBxgUoj1uAT/NGJB6+uM7dVMx4Ou5uuXGRvRLxf7tNAIWm4+qoLc57Q8h2qRX8D/J
	Tov6R8G/fgeVo4v52IlZ4tSADcqC6w44Dl/6hHTEupoCuvDoZqWTUpwvVgS+q0onRlzGYnRyHXz2B
	CZL5GOEGhlhCdoxgR5OZAsjsWPj8o61ce/0QlLqVOK9f1Cu6mf7cVeagOaZ8gNPyZV4/94PQwUQi3
	OAa0Xowz1u06PNRH5b115UDM4SMUL9L5GWATa1pCfFwhHzvqApwUdIPDE+A3XlQI2k9/k7+58xHay
	8RSxSRMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTf9v-00000007IDR-0We8;
	Sat, 27 Jan 2024 09:39:31 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTf9r-00000007IAT-0QxP
	for linux-mtd@lists.infradead.org;
	Sat, 27 Jan 2024 09:39:28 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4TMTy83hpgzsVBl
	for <linux-mtd@lists.infradead.org>; Sat, 27 Jan 2024 17:38:08 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 38151180079
	for <linux-mtd@lists.infradead.org>; Sat, 27 Jan 2024 17:39:15 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 27 Jan 2024 17:39:14 +0800
Subject: Re: ubifs: master area fails to recover when master node 1 is
 corrupted
To: Ryder Wang <rydercoding@hotmail.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
References: <MEYP282MB3164FE84067710E5AC8D34A9BF7A2@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
 <45ef54d1-582b-e6a8-f8f7-291f9b4c98c4@huawei.com>
 <MEYP282MB3164A9167C34C14EAC15663ABF782@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <628521b7-36c1-ab83-4e98-752d6ff71017@huawei.com>
Date: Sat, 27 Jan 2024 17:39:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <MEYP282MB3164A9167C34C14EAC15663ABF782@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_013927_522841_913DE3C0 
X-CRM114-Status: GOOD (  17.08  )
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

在 2024/1/27 15:21, Ryder Wang 写道:
> Hi Zhihao,
> 
> Your explanation is very professional. Thanks for it.
> 
> But I still have a doubt about the code logic:
> ------------------------------------
>    if (mst1) // false
>    else {
>     offs2 = (void *)mst2 - buf2;  // offs2 = 0
>     if (offs2 + sz + sz <= c->leb_size) // true, mst2 is the first node in LEB 2
>       goto out_err
>    }
> ------------------------------------
> 1. My testing result just proved that CRC-corrupted master#1 also runs to "else" clause of the code above, just like master#1 is unmapped.
> 2. For CRC corrupted master#1 case, the code logic looks inconsistent:
>    2.1. If master#2 LEB is just to be full, master#2 will be used to recover master area.
>    2.2. If master#2 LEB is not to be full, master recovering will be aborted with error.
> 
> I think whether master#2 LEB is to be full has nothing to do with whether to recover master area in such case. How do you think about it?


Actually, UBIFS can still work even if master#2 is recovered in such  
case(master#1 is corrupted), because the master#2 is the newest version.
The offset checking for master#2 LEB being full is a way to make sure  
that UBIFS can find the newest master node. If we simply remove the  
checking, UBIFS could go wrong in some situations, for example:

Powercut happens before writing mst2_v2 on LEB2, so the UBIFS image  
looks like:
              LEB1                                LEB2
|mst1_v1 | mst1_v2 |0xFF 0xFF ... |      |mst2_v1 | 0xFF 0xFF ... |

The mast1_v2 is expected to be recovered after exeucting  
ubifs_recover_master_node(). If both mst1_v1 and mst1_v2 are corrupted,  
UBIFS will enter into this branch:

    if (mst1) // false
    else {
      offs2 = (void *)mst2 - buf2;  // offs2 = 0
      if (offs2 + sz + sz <= c->leb_size) // offset checking
        goto out_err
      mst = mst2;
    }
If the offset checking is removed, mst_2_v1 is recovered, apperantly,  
UBIFS picks wrong master node and it's not right.

So accodring to the realization of ubifs_recover_master_node(), UBFIS  
choose the newest master node by various offset checking, it's just like  
a whitelist of situations that UBIFS can fully trust on, other  
situations are failure pathes, although some of failure pathes can make  
UBIFS still get a right master node in some(not all) cases.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
