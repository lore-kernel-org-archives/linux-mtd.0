Return-Path: <SRS0=79EA=KN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36EBAC433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 18 May 2021 15:50:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA67E611CC
	for <linux-mtd@archiver.kernel.org>; Tue, 18 May 2021 15:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA67E611CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HQ/06wlVCwgMNrg1GP7HXGNG7cdDIUgEdPTIgFK8Qbg=; b=rWCYmOPXGreK6uauOdL06mOdz
	bL/RLJ1KUpesnDr5P1P036A7DeBxPlpisJzA17gzBvtOvWETXrPm7Cisvts6fQxcz0yXdjBzPc4fn
	XYLqVSo8l+l0Iuc04AzkQJQqG34mnn3SfKuzJ4BkpCkIiIRVRIPdYira63waNok06oCMNzFRvnyca
	pa+TAg+2Xsch8DClFrVnCOpav1cbggd9CU5xRUXEAZiPU0MJAO+CqYaMWL6dSSDwxCHvFuc+uzIRM
	lRZtOoAS2RoFie2AR21BlPklGCXe65JrGmvR/OLoFangYO1K0tYjwfuCKkxSfk/76G7S4l6yXmJpH
	+7K6MEIHw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lj1xx-001DnS-31; Tue, 18 May 2021 15:49:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj1xt-001Dmq-6d; Tue, 18 May 2021 15:49:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=x8rk4SF8kUA9lhdRyqORx0Hd48/7Wmd859uaIYQogP8=; b=jG7HWwtLjgBcLpq0XMkjni1VPK
 eH6c2/0RFW9+FUftw43UX09MTIfVQ9agN0ww/7KeZB7bYkc94+DLXWyYfSrX9sKH2pjTMIrkRJS0n
 RDVD4g5RGhxZGVngDPnuiZbHHrYY9O3qaFxfy/x3G0/kb6ye2slWGwtZmoV6rFPAsxuGFmzOVoX+f
 RJMUGqAfoRcvW45PRVIuoNOxmccUxHeCHaACGizYTYd/QrosrYDSMGN5Sxfy+7Ktp7SFuHIWidBOa
 PB5Wzx1NSC/HhMfAUjekZGm2LPFH+iT3lgDLWmIQcIcxslF2zOiA1nkLqXPfMugQ8iO6h4472DHdM
 BpcMY8GQ==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj1xp-00EmAV-7r; Tue, 18 May 2021 15:48:59 +0000
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14IFdFL9004337; Tue, 18 May 2021 17:48:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=x8rk4SF8kUA9lhdRyqORx0Hd48/7Wmd859uaIYQogP8=;
 b=kv4K43tO4C1zplxFDnyeWJau3vyR+Z596aA0Q7/dnzf8URn32MUzKeBxueu7VK+Kj2gM
 VCbYRSJMEa27L58x/BifhZmKeQC5v7kSpNwuxi+VvaxbUsArah1PtynF74fSlyI+2NqC
 E+dufxOxh1Ywwd8DT8D+utAvmUECxCdtFfJ0nfASR34hEmU2C1SKi89vb+vapSYN7LEv
 dLMZZUDbW4k+sM7BfGSj18NFdDPFC+WxvLr6Rrf/WaICczsfvmogOciJAi5FncHJ6k2u
 3wWtbru2Jq6X+j/y0MR7+82odg+1rRWkg//WySUFID1G4055o/0M4miblz3vTl3LUore dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38maunt66k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 May 2021 17:48:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4A90C10002A;
 Tue, 18 May 2021 17:48:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3508F231DCF;
 Tue, 18 May 2021 17:48:49 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 18 May
 2021 17:48:48 +0200
Subject: Re: [PATCH v4 3/3] spi: stm32-qspi: add automatic poll status feature
To: Boris Brezillon <boris.brezillon@collabora.com>
CC: Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <christophe.kerello@foss.st.com>
References: <20210518134332.17826-1-patrice.chotard@foss.st.com>
 <20210518134332.17826-4-patrice.chotard@foss.st.com>
 <20210518163707.0e6bd120@collabora.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <e0abdaf9-0f30-91a3-7cd4-c0e4140d6aa4@foss.st.com>
Date: Tue, 18 May 2021 17:48:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210518163707.0e6bd120@collabora.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-18_08:2021-05-18,
 2021-05-18 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_084857_678685_7A132847 
X-CRM114-Status: GOOD (  17.43  )
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



On 5/18/21 4:37 PM, Boris Brezillon wrote:
> On Tue, 18 May 2021 15:43:32 +0200
> <patrice.chotard@foss.st.com> wrote:
> 
>> +static int stm32_qspi_poll_status(struct spi_mem *mem, const struct spi_mem_op *op,
>> +				  u16 mask, u16 match,
>> +				  unsigned long initial_delay_us,
>> +				  unsigned long polling_rate_us,
>> +				  unsigned long timeout_ms)
>> +{
>> +	struct stm32_qspi *qspi = spi_controller_get_devdata(mem->spi->master);
>> +	int ret;
>> +
> 
> The spi_mem_supports_op() call is still missing.

Yes, i forgot it

Thanks
Patrice

> 
>> +	ret = pm_runtime_get_sync(qspi->dev);
>> +	if (ret < 0) {
>> +		pm_runtime_put_noidle(qspi->dev);
>> +		return ret;
>> +	}
>> +
>> +	mutex_lock(&qspi->lock);
>> +
>> +	writel_relaxed(mask, qspi->io_base + QSPI_PSMKR);
>> +	writel_relaxed(match, qspi->io_base + QSPI_PSMAR);
>> +	qspi->fmode = CCR_FMODE_APM;
>> +	qspi->status_timeout = timeout_ms;
>> +
>> +	ret = stm32_qspi_send(mem, op);
>> +	mutex_unlock(&qspi->lock);
>> +
>> +	pm_runtime_mark_last_busy(qspi->dev);
>> +	pm_runtime_put_autosuspend(qspi->dev);
>> +
>> +	return ret;
>> +}

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
