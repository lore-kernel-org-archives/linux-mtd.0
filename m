Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F43C636CC
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Feb 2023 13:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Akt5vpsP4JkdD289H2tWLAtmh0FESQFzdxyxCWuFgGg=; b=a0hq1pKFsngCGd
	ogpkjVO4FGCvLQs2zfinkELm4z0AuTtjKvfr4zjmo7yoTXDLjnw15HG2J5aq8y/NNj9jZmDZYPGsy
	5woRu9XfxRkHCCKrANm6/E/QT9ZgmQqWiRItIMn7gOp0ryWRiKtWrQK/etkvVsEJoHESMLC7rwRhb
	hM3NFuJn2Sq0ltMQdTH3ysWYhDwcSp3qe5IAWOKUKaqFfyXoiu8JSeP0RYcYwhrUJjI7MNXmmbz4h
	yBq3TI+dLWcDKSdk0CO/LSLjxDiPU+ZRjGUZTURU/cLtHqbNobRm1os6NLKv2Yru0lYYfCf3aK4uc
	KpwbLkNC1tTdzgWBU2UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPNgD-00CCAt-Bh; Tue, 07 Feb 2023 13:06:37 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPNfz-00CC8y-Q3; Tue, 07 Feb 2023 13:06:29 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 317D6CsR033880;
	Tue, 7 Feb 2023 07:06:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675775172;
	bh=ekpjB4H4unY73nJ7BkdNZHsEInjoxv8tnvp+z0/THYw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=SCEbkJ2JVL81GhMal0ahTjr9ZTbbGSd8TKcQIa4oRBAIu6mb9j1H0tabPyPO0VffD
	 FuyDvoy7q9/99tVHVuZiwhjxfeX6cQrRiPLdTqJhWONkdCAzN9B28XyOn0Ct4fPi/r
	 zkr9KGvedmNaoDGAZxRerzS6sliLz5U3i3X31rHI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 317D6CE3036467
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Feb 2023 07:06:12 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 7
 Feb 2023 07:06:12 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 7 Feb 2023 07:06:12 -0600
Received: from [172.24.221.26] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 317D67Rc025797;
	Tue, 7 Feb 2023 07:06:09 -0600
Message-ID: <f624e2f0-5fcf-a5b4-8376-6ef37a799493@ti.com>
Date: Tue, 7 Feb 2023 18:36:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/4] spi: cadence-quadspi: Reset CMD_CTRL Reg on cmd
 r/w completion
Content-Language: en-US
To: Pratyush Yadav <ptyadav@amazon.de>
CC: Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        Vaishnav Achath <vaishnav.a@ti.com>, <linux-mtd@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Takahiro.Kuwano@infineon.com>
References: <20230125081023.1573712-1-d-gole@ti.com>
 <20230125081023.1573712-2-d-gole@ti.com> <mafs07cx8f1oc.fsf_-_@amazon.de>
From: "Gole, Dhruva" <d-gole@ti.com>
Organization: Texas Instruments Incorporated
In-Reply-To: <mafs07cx8f1oc.fsf_-_@amazon.de>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_050624_776994_1EB96D1F 
X-CRM114-Status: GOOD (  10.02  )
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

Thanks for taking a look Pratyush!

On 1/27/2023 8:46 PM, Pratyush Yadav wrote:
> Hi,
>
> On Wed, Jan 25 2023, Dhruva Gole wrote:
>
>> If one leaves the CQSPI_REG_CMDCTRL in an unclean state this may cause
>> issues in future command reads. This issue came to light when some flash
>> reads in STIG mode were coming back dirty.
> Can you explain in more detail what you mean by "reads coming back
> dirty"? Because I don't see any clear reason why not resetting the
> register would break anything. We re-create the register value from the
> scratch on the next read anyway, and as soon as you writel() that, the
> old fields get thrown away anyway.
There's a hardware bug due to which clearing of this register is necessary.
> [...]

-- 
Regards,
Dhruva Gole <d-gole@ti.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
