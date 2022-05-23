Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB17C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 May 2022 09:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6beCFfDVhv9Lxz4b6UnQUk3zadNMVr9I4xWbCcb3C38=; b=Czz0+5AGIhwY+B
	QelwMK8vb/SS14GrTsZUAymlRnjW46OxXB0V+LmhQOhQa5Zau0wyYAn5ezOYwQnZtCfrRzrplB16Y
	BOGgSSoRBs+hw1Yh5AZXhhKalsUdPnu/7cxrLolKxE5SFOhkEz6kBeN/KyGC9lS5wQIEUQ05Abuxx
	2q6jVX/C4xQcaDUCOVecBSVBTegg+6aiT3f1/MLbqj+fbQq2Q7kLdBXeM4BBM6CPNdTsRWMWHe3L0
	BRecXqg/t/1tsg95r0e3s01cATyFyD5ChIZmqrkXrK5iFH55vSmN8l908Xy71Xuz8vSnopjsbbYfe
	ixcyNLhAc2DUPdkwEhEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt4e2-002xLC-Bu; Mon, 23 May 2022 09:46:34 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt3ly-002Zwl-TX
 for linux-mtd@lists.infradead.org; Mon, 23 May 2022 08:50:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653295842; x=1684831842;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FamiyyxcUQwvcpbngfiwoV2qv2k3L6KGhOagpsExFA4=;
 b=BjpqdBpN5Tt0Qxbo3OyRV3Sfm4WS0IvEHyWVb8wLHhzbPjJ1yGq0ZqYj
 GVLuLi9df7uuYnkGfPJ18mfCnkfaNNBHaw53KhcYK/PzAZr0ZsbS5WvpG
 ODMhihxwQ/L+4zX1Iu/dS+wpwr8RsSbguXj+/MI6FlMkDw6Z2tmiySRbv
 U18muU30/LucQjf5zCqXIAuuxiAblFvS3kHEvin6xxta+8101ef28lDOm
 L0UnzbQT8xFWILxTlbqTIdsRRhTE+fyVat34KLJW7hiXIqV69KXBKA3Mt
 4mb2m1be3zEFq4dZmUXfFqj+Sx3jH6lYJCXbt/BCCRRa+OmU53q5rKBLe A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10355"; a="298467215"
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="298467215"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 01:50:40 -0700
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="600533288"
Received: from jiaqingz-mobl.ccr.corp.intel.com (HELO [10.249.171.16])
 ([10.249.171.16])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 01:50:38 -0700
Message-ID: <b3e85d41-9415-b911-6f61-941885af1955@linux.intel.com>
Date: Mon, 23 May 2022 16:50:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/2] mtd: spi-nor: macronix: Add support for mx66l2g45g
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>
References: <20220522054802.1719443-1-jiaqing.zhao@linux.intel.com>
 <04c432289041752d113c15245361ade8@walle.cc>
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
In-Reply-To: <04c432289041752d113c15245361ade8@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_015043_003274_9203D574 
X-CRM114-Status: GOOD (  10.81  )
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

Hi,

Yes this one supports SFDP according to its spec.

On my setup, I cannot see the sysfs object. Do I need to enable some specific
kernel config or it's SPI controller related? My setup is running kernel 5.15.

Jiaqing

On 2022-05-23 15:54, Michael Walle wrote:
> Hi,
> 
> Am 2022-05-22 07:48, schrieb Jiaqing Zhao:
>> Macronix mx66l2g45g is a 3V, 2Gbit (256MB) NOR flash that supports
>> x1, x2, and x4 operation modes.
> 
> I presume this one supports SFDP? Please provide an SFDP dump, see [1].
> If it supports SFDP please try to use the SNOR_ID3() macro [2].
> 
> Also please add what was tested in your commit message.
> 
> Same goes for your patch 2/2.
> 
> -michael
> 
> [1] https://lore.kernel.org/linux-mtd/4304e19f3399a0a6e856119d01ccabe0@walle.cc/
> [2] https://lore.kernel.org/linux-mtd/20220510140232.3519184-1-michael@walle.cc/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
