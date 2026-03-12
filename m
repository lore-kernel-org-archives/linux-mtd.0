Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2626BFED2E9
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Mar 2026 14:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tDMkHiMWbKbrzJ81xYehBu2ww9nc7lmo/+sqYSMdewQ=; b=uOH1LXkeiojmN0
	US17VmG6L2sJSv7osZ2alV3EzoyLRcFviQjSSz20ggWLLzqDSrY8s64IQmk8eAWdmrAQCDgpDXTi3
	Flx7rQKFiYdlN77y2utOReK9A/Pw/SUcxPCHZ4gpEi8AEEmC+qzWJBLqy4XtjwzpogGcZdVEa4zfz
	9GNTr+i4AgRL37ucN9FGAKarkKnqNfdjnaV9zgY8syyWifG25j5PYiILDpFSDNYu+OndyAY690yCF
	3mt9VDyBC1aqBFdaH8ZX60Zlbt4f6OgVp/UMxrT8S/Io6GoncJsVk24uQA9OYLDZx5VxXcpEgDXmZ
	zD37HqSXM6djCqStbfJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hHv-0000000EF4w-3bc8;
	Thu, 12 Mar 2026 14:45:23 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hHo-0000000EEuP-2Etu
	for linux-mtd@lists.infradead.org;
	Thu, 12 Mar 2026 14:45:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1D7271A2E09;
	Thu, 12 Mar 2026 14:45:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DF3245FDEB;
	Thu, 12 Mar 2026 14:45:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD3EB10369DD7;
	Thu, 12 Mar 2026 15:45:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773326713; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=4daAQZWFYXM6mQK2PksFrwRHEdQEwOFynA5SkgmnW1w=;
	b=k54hmVgT0xaFqCJtR3GbR3zGCAB20/a+19R66w4l0p+aHd4JVXrkqkTP0r3wHJo5GIgOB3
	c4FnpJq5MT728TpHIr+DclaqeazBsb+FtNvFgnRjnem1LjYoFFzC395CCbNcFSWSsHfEkS
	qRk8d+nJAeGsKkcFjXiOmjCyINkbMK+dkxxPekFu6gt3aADOjhJFp5tUJRdPkQkWQ7QjWf
	SDz6NJb/fBa3nD/nY826wsMFxIxzgLa7gLHQ+UsI6Orrn6iO+tpBGoKm1wnWqoAXxOOhwz
	Y9SRXKwLzlVm0u1Bw3trxYQTmgAlQC7ZpBREBfNrzWcZCg+Uo8P5fPxouaRZUw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Cheng Ming Lin <linchengming884@gmail.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  Tudor Ambarus <tudor.ambarus@linaro.org>,  Mikhail Kshevetskiy
 <mikhail.kshevetskiy@iopsys.eu>,  Pablo Martin-Gomez
 <pmartin-gomez@freebox.fr>,  Tianling Shen <cnsztl@gmail.com>,  Pratyush
 Yadav <pratyush@kernel.org>,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  alvinzhou@mxic.com.tw,  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v8 1/3] dt-bindings: mtd: spinand: Add randomizer
 enable/disable properties
In-Reply-To: <20260312140553.GA2914438-robh@kernel.org> (Rob Herring's message
	of "Thu, 12 Mar 2026 09:05:53 -0500")
References: <20260305071042.1193522-1-linchengming884@gmail.com>
	<20260305071042.1193522-2-linchengming884@gmail.com>
	<20260312140553.GA2914438-robh@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 12 Mar 2026 15:45:06 +0100
Message-ID: <874imlksy5.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_074520_418305_1B66B7D2 
X-CRM114-Status: UNSURE (   8.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


>> +  nand-randomizer-enable:
>> +    description:
>> +      Enable the randomizer feature. This property is mutually-exclusive
>> +      with nand-randomizer-disable.
>> +    type: boolean
>> +
>> +  nand-randomizer-disable:
>> +    description:
>> +      Disable the randomizer feature. This property is mutually-exclusive
>> +      with nand-randomizer-enable.
>> +    type: boolean
>> +
>> +dependencies:
>> +  nand-randomizer-enable:
>> +    not:
>> +      required:
>> +        - nand-randomizer-disable
>
> Rather than define this in the schema, make the properties inheritly 
> mutually-exclusive with a single property:
>
> nand-randomizer = <0|1>;
>
> That's assuming you need not present to mean a 3rd thing such as use the 
> bootloader setting. If you only need enable/disable, then a 
> single boolean property works.

We need the "not present" case, so the single boolean property cannot
be considered here.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
