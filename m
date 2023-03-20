Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E57FC7618A
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Mar 2023 04:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h8QMGi8znqRWjb7a3HHhr4KHRXwleYfaaZ9kpCNd6hY=; b=Trm6tEilIcWOqO
	AyfjVTWTGCpgMef50/c9ijZ+FCAT4lRL0mwNW9RRNHX38x8D5zDm64P5DPDTGEGQ4+AmYAfM/q7Ng
	lhgd+zdLy3jmhg3YrB5vn8LiXkBfP2Ih+6pBU73TQmUvfQxDp3Onv+Q4l5QzYZbaduNp64bSOL2QN
	ysz6NczECF5pt2q9Evl8O0NlsbHSd1rByc5tL795PX0Pnd57CIehBchlJfLsfIt6tlVhxVvJbeadW
	n7ApSHYZTpU7SuXTsFKr1hPhlxnwJTYPB4AWzbKWebM5ka+rvw8uvyWWDygZDJB4mXUrxCEt6MEH/
	L6WJ9ebCqF0hkZncCFIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe6pb-0082dO-07;
	Mon, 20 Mar 2023 04:09:11 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pe6pX-0082bQ-1o
	for linux-mtd@lists.infradead.org;
	Mon, 20 Mar 2023 04:09:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1679285347; x=1710821347;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=f0RzrlZk36B8QlnIxOLMByV1TWNDOIMn6+7Rb8kJGp8=;
  b=nGVxj+CDtfZ781SkuRYctfJqNHaeCr4QCHg3gVFZZtRfy+oswdCdnB8r
   RcuBvti6MClhXD+ckxn+46nVuwc1zWlcRPmE9ey8m2jDa/nPMxp5KxFWM
   7NURHae18lIsSv3ezk/3zzCoAXWDC6e6GDK3VVBJLAQZNRt2ZTs9CZIpV
   FSMGtWeoA/i3JrZ3kGU+kHj0Hu/PY3621aLey40FaAIqLttwzJFRSF1y8
   mO34y2GDbOtSHY2P3h8xFoc6K3oKCzeInqa0/CXF9QTowFyAzzEvAIiJU
   idRbn9fxPoe3nRZkTKTyoHbB+Y831BvfeNYlth+h3F1+6WScI8LYYhmhX
   g==;
X-IronPort-AV: E=Sophos;i="5.98,274,1673884800"; 
   d="scan'208";a="226008051"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2023 12:08:52 +0800
IronPort-SDR: zU+3Uqw91maH9q3PJTjP+KtYzvgZgHaUyzbH3kTEFcBnB8D9SAd5ggrpCiw/JZi2PSD3UTc2hx
 5/yTPqM3ZWiE9aIyL4IIGDlPRgcI97QN8FPRqOLTNBay/PIpyboYyxZQTgCnEhd4197i1PPYzU
 nKh0ut/bHU/QkGHNIwKnTj8A00N89556jkGI09CS/eWTbs3ZAM35Tu+J7ZfpVUVv73sC3OTXA1
 1MQofqw7mjMMxf/nDVIDoizMXZWoyMVHEJ3I2unCO7112ukgNSJ3WZrYcrOChkWRNnHnTlox5+
 lY8=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Mar 2023 20:25:13 -0700
IronPort-SDR: 1GBrhFuhNtRfKYC3Uz95l630wjjCIP3h1leYA+Hvmz5WdND2QUnkAGaoOWP8bbpijUFnuiYPb3
 X//WUNnsbe4JrDkbbKwmwkdawvvapf2G6wDVd/h56i9QtDJ6ZRFndfPg6185d4o0EbD064ZxRw
 WnLOIQHXVjmADQJUtAWrZtlFXyJKsB+K+6dgjN2s2XdMGa0Bt77R1x6/9cgU39g3yZ5I7elE40
 Lc9lS3OAUvaEPJESetmYGPZo+EHl6jgep5eYQlkes+lhDwe2iG8WAJo0o4hSEEiY2Ey3HwFkwb
 RPo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Mar 2023 21:08:52 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Pg1Sh1gpfz1RtVt
	for <linux-mtd@lists.infradead.org>; Sun, 19 Mar 2023 21:08:52 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1679285331; x=1681877332; bh=f0RzrlZk36B8QlnIxOLMByV1TWNDOIMn6+7
	Rb8kJGp8=; b=esT6TiIT+uoup3kWnY3xrSB3cYopIRmWLNhiVbZ6b5Myup6B95z
	p61YIXMydR7cv+BOtazS96fyHYNv37OnHrWVo6KCl4jC5ieFCwmxLpn12eg4/ysM
	pS91jjTlyfK5IAAj0Q5zaqAOyizcA9mGTXR4Q9eq3vYIamyUJ8etCo+vOy9sjk7l
	p6COnj+QZSprV+wuLiGHG6enDxDehZbJdOfQd1HClGCeQ2lGXZdLd/Qb+7pT/ebA
	Y3GEWaET42Y/8pV3BDj2JZueEuXtNYDsemmR9wfaJ23SwWvVQpUoQVjpDABRoBk6
	y7rjMU3wwH/4BD2261pJ4P51bH/Uqaj+DNg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id oeBdawT22VHp for <linux-mtd@lists.infradead.org>;
	Sun, 19 Mar 2023 21:08:51 -0700 (PDT)
Received: from [10.225.163.91] (unknown [10.225.163.91])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Pg1SY32s6z1RtVm;
	Sun, 19 Mar 2023 21:08:45 -0700 (PDT)
Message-ID: <e4b8012d-32df-e054-4a2a-772fda228a6a@opensource.wdc.com>
Date: Mon, 20 Mar 2023 13:08:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2, RESEND 01/10] kobject: introduce kobject_del_and_put()
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, clm@fb.com, josef@toxicpanda.com,
 dsterba@suse.com, xiang@kernel.org, chao@kernel.org, huyue2@coolpad.com,
 jefflexu@linux.alibaba.com, jaegeuk@kernel.org,
 trond.myklebust@hammerspace.com, anna@kernel.org, konishi.ryusuke@gmail.com,
 mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com,
 richard@nod.at, djwong@kernel.org, naohiro.aota@wdc.com, jth@kernel.org,
 gregkh@linuxfoundation.org, rafael@kernel.org
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 ocfs2-devel@oss.oracle.com, linux-mtd@lists.infradead.org,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <20230320033436.71982-1-frank.li@vivo.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20230320033436.71982-1-frank.li@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_210907_683838_BEBFBD8F 
X-CRM114-Status: GOOD (  15.20  )
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

On 3/20/23 12:34, Yangtao Li wrote:
> Hi all,
> 
> Out of consideration for minimizing disruption, I did not send the
> patchset to everyone. However, it seems that my consideration was
> unnecessary, so I CC'd everyone on the first patch. If you would
> like to see the entire patchset, you can access it at this address.
> 
> https://lore.kernel.org/lkml/20230319092641.41917-1-frank.li@vivo.com/

Hard to comment on patches with this. It is only 10 patches. So send everything
please.

> 
> Thx,
> Yangtao

-- 
Damien Le Moal
Western Digital Research


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
