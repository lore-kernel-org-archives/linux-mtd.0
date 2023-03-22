Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD01CC6FD1F
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Mar 2023 23:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0UDRtRLqsvhcHgCT679cXS4JbY1EUJnrb+bHx9B5Y+M=; b=rfjVR+V2jU2Qbo
	JyUadkvThrUBfVv9fa9Kc/eZZrZ1mSaQqHcaWua4ZvtJJqk8ovm9Q1HPfFbu42j3vKldaGmEJ+xvb
	ZqynM55PvuafDsck/aGVnkYe5oFU8impdHSj2GG4sz5uaJl0rYLhbomgvgV2OL28wFpAgamAaCFWG
	bCqn+R6JGCbIM1+cr9K+SRQGE9y3JxNsGqoEDay3F7BHGXy6SKcEF1jZponxT6Vnl5PxlkOtUvD5/
	beIl+8DBjAP8T2hiejjHWzeFLl78KilntTG9k6PbgpDsAFw9tTm8+P71lzafecBxcghtaAN7E2aDF
	oLxnfp+NGtqcR+n3VawQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf7yJ-0009my-2u;
	Wed, 22 Mar 2023 23:34:23 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf7yH-0009mF-1f
	for linux-mtd@lists.infradead.org;
	Wed, 22 Mar 2023 23:34:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1679528061; x=1711064061;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rNEfSER4swwikeY50PtiH1QfqYxcG1VPN0FLVwTfQCk=;
  b=FfI1wl3GFPx1aHtfzlQjVPWOGRMy6XdNCX7C9Kq/r/WYw/8+G3NK4B9f
   cLteEMArP/Xq7Wfi5ta+KkKxdp31oXvFKtYIF+JztbsTrgxk66byDnzxD
   CgVWrGdVe1Hd9y4RfXyf/FEJ8z5ziurlt8JkZZ+6Hq9mMePi8O1BnEsq1
   x7fIfEzMKLTOE/7OFQtyZNs4AHfe1SNC0mSTZjhB4l8KpGz6H0WY8pNHh
   /z6H+9pQVFjKMswVMrZ8hdkYuP6QAMXIbJxvrIld8mom3p0IP3ymiBaYm
   YguDANKaGxSua+MS6rDwKD+3XorNYk6MUyC1r6A3hsErrkavgRHGaVtRD
   g==;
X-IronPort-AV: E=Sophos;i="5.98,283,1673884800"; 
   d="scan'208";a="231247981"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 23 Mar 2023 07:34:21 +0800
IronPort-SDR: PYI0LbD9Qy6VxKOUmZ8hz4U6QM3xM07OcSxd2ltG2x/xs+wJ9yZ3FIem+IODasWHkJR4DWXi+k
 kYuFF6kHuJcg45Q4pJKyKQDq19Nn2EC75+IWDUJhgIfvYY2sbrwJ2nvWYhbsVFV7od7F+gfGnn
 UjTrQKv02GDNlLiKsbJ2SXE4R5uaQFPxNS//fVDV7eZvSdMwwhzeCdvqEY+YKMs/+ceEms8LZ+
 aMyngcxQuxJp5fStAnk9ww0K2JpTm37kH0UfcohTggETbwlDhZaTjNk7kYmpD+75CoY//mbPTe
 hyQ=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Mar 2023 15:50:38 -0700
IronPort-SDR: yOhBwBZkIb+v/eQpn3dFrLUh43E1HejIfcWErV1jo8Efz+gzj4YHJGiQg/Qut2/tBRvx6pzEcS
 Ryt1jaBeumzC43z61W1GHsS7xOUOU9H3iu7/BPj15sUVR+I02FF8bUVe6y8dC1/cZ1kk5dBNRX
 zMZDue/2ypTR+2Wm9ZCv7d/gQ9Z7cDppYL1bn3H0m/DzMT257JftxG8qvCjLmbKw8zo+y2pYv3
 AVKjw1e1NBv6o8gthDTTMI2Bajd0QhIQVvnW/lZUrPJcT6lUgj444nybZmYiiZSAg+3cpmsowq
 jH8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Mar 2023 16:34:21 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PhlDX5QWbz1RtVp
	for <linux-mtd@lists.infradead.org>; Wed, 22 Mar 2023 16:34:20 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1679528060; x=1682120061; bh=rNEfSER4swwikeY50PtiH1QfqYxcG1VPN0F
	LVwTfQCk=; b=KIoKRoAyDoLX5+1BdzL/wF05+aNmFvhHkeLfugMJRhymYlef0Ps
	crYVyhuywL8h3CnFK36j1vKet47n7GDD45edGQzyySv0HvohdJGE2UudSkX8sqbY
	5Nj/N+EUDWqiR5RIvMfWbBw0lpH0ClyhU2nAJUAHzvijsjc+/zZAO5wT00j+LZT1
	nLkGlB+7tAXyPPQrSMBCpYKi5TfDoKQ6oZSvm2u2yADc8/0b+Wnk5gyH7spVbVYp
	j62qfUSKHI6y1jKwM8Nx1jMu3AFuxEPLhGIiMjbOa8RrXON6m0d3rtPZmf+rwvd3
	a3g30ix6wWkyvcTAAnveV5jaZ/vNmAYcuCA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id AiISETV-UY16 for <linux-mtd@lists.infradead.org>;
	Wed, 22 Mar 2023 16:34:20 -0700 (PDT)
Received: from [10.225.163.96] (unknown [10.225.163.96])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PhlDW3JbWz1RtVm;
	Wed, 22 Mar 2023 16:34:19 -0700 (PDT)
Message-ID: <8731d0e1-61ba-b894-f4ac-51b17ee675ec@opensource.wdc.com>
Date: Thu, 23 Mar 2023 08:34:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 05/10] ubifs: convert to kobject_del_and_put()
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Richard Weinberger <richard@nod.at>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230322165905.55389-1-frank.li@vivo.com>
 <20230322165905.55389-4-frank.li@vivo.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20230322165905.55389-4-frank.li@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_163421_560808_ED3355AB 
X-CRM114-Status: GOOD (  10.62  )
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

On 3/23/23 01:59, Yangtao Li wrote:
> Use kobject_del_and_put() to simplify code.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
