Return-Path: <SRS0=j43f=BA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51563C433E4
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jul 2020 12:21:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5B412073A
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jul 2020 12:21:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wHwinoFO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="CjAvouVp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5B412073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/Tcw914CoAexodKngX4jGQKcVCoZPHljaU7l/mW/Ixw=; b=wHwinoFOWYfxD4QJxpolXX1yf
	4enc90uj+2pWRQyRkxdxaNE+XtaXtoPCteXbtWP/3ba7J0UnjToat9lSRc3cT/YYS+2l3ZibP3lgg
	yRLgpI/pPtB3aruT1reeDjcEoDk7PcueaBM/N+ijCwM0HREFXhIW1IbupN2y4kk14i9hIwqCCjJao
	IJbHyVPP88Bz+4eIKuHvOUVPZeQ69VMWVpbRSFZswKnRssZZ78YhsYfFjlTITG9bB8Y99BmDpjdlO
	xgzSCWExaiuZyMn4TB2IZXqTcb35qp1aRuGBbvzBNUg2jR6Gbea0kh8mKC1soZkeYQhBXSSz8q3aK
	bJJA/zznQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxrGF-0002tI-Il; Tue, 21 Jul 2020 12:20:43 +0000
Received: from mx07-00178001.pphosted.com ([62.209.51.94])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxrGE-0002sv-2C
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2020 12:20:42 +0000
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06LCDKms005348; Tue, 21 Jul 2020 14:20:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=8vP1jXV2kKgz7aR8mJyB4fFv5nSz+KvD2siLVIEFFi0=;
 b=CjAvouVpDIXWRLz0WMnm2myUrWADTdNPWZTdxXe2+LwCaaRlsuZ3OX3ZTLMxFWInj5CG
 K8bX/rx6Lut1aF356CFRE268amwO5IPI1WQjn27PmIIACY2lx0HhglKVZ9mcIUTmFPg4
 ttwZfYbMtkIrAm3kYws2+zaDp3iZh+wtbREQh7MxPOx/A4eU/mcIjOtSFRDpnZ/fL0AS
 0n87DittucpPeagrJYXP6mHrnm+8ruj81wYqgbBmyYEZzvKe0hT/lGR0iO72hjCAfFWG
 Sq59kThMqruYcvN0psmJeJDX/FwweaMohPpkriovMSGTqFxxCoHNkYpi1tJW9cv95NdI mQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32bsfpdrj8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 14:20:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 73D7110002A;
 Tue, 21 Jul 2020 14:20:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 681DB2BC7A9;
 Tue, 21 Jul 2020 14:20:40 +0200 (CEST)
Received: from [10.48.0.224] (10.75.127.48) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 Jul
 2020 14:20:40 +0200
Subject: Re: [bug report] mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash
 controller driver
To: <dan.carpenter@oracle.com>
References: <20200720123747.GA58697@mwanda>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <ce570a06-35ca-1bef-5b3e-eabba5f0acd2@st.com>
Date: Tue, 21 Jul 2020 14:20:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200720123747.GA58697@mwanda>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-21_05:2020-07-21,
 2020-07-21 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_082042_370965_D23E944F 
X-CRM114-Status: GOOD (  14.36  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Dan,

On 7/20/20 2:37 PM, dan.carpenter@oracle.com wrote:
> 1741  static int stm32_fmc2_nfc_parse_child(struct stm32_fmc2_nfc *nfc,
>    1742                                        struct device_node *dn)
>    1743  {
>    1744          struct stm32_fmc2_nand *nand = &nfc->nand;
>    1745          u32 cs;
>    1746          int ret, i;
>    1747
>    1748          if (!of_get_property(dn, "reg", &nand->ncs))
>    1749                  return -EINVAL;
>    1750
>    1751          nand->ncs /= sizeof(u32);
>    1752          if (!nand->ncs) {
>    1753                  dev_err(nfc->dev, "invalid reg property size\n");
>    1754                  return -EINVAL;
>    1755          }
>    1756
>    1757          for (i = 0; i < nand->ncs; i++) {
>    1758                  ret = of_property_read_u32_index(dn, "reg", i, &cs);
>    1759                  if (ret) {
>    1760                          dev_err(nfc->dev, "could not retrieve reg property: %d\n",
>    1761                                  ret);
>    1762                          return ret;
>    1763                  }
>    1764
>    1765                  if (cs > FMC2_MAX_CE) {
> 
> Which suggests that this should be >= FMC2_MAX_CE to prevent an off by
> one.

Thanks for reporting this issue.
A patch has been sent to solve it. 
(https://patchwork.ozlabs.org/project/linux-mtd/patch/1595325127-32693-1-git-send-email-christophe.kerello@st.com/)

Regards,
Christophe Kerello.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
