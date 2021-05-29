Return-Path: <SRS0=Jc64=KY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D98C4708E
	for <linux-mtd@archiver.kernel.org>; Sat, 29 May 2021 10:19:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A026E6103E
	for <linux-mtd@archiver.kernel.org>; Sat, 29 May 2021 10:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A026E6103E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date
	:Message-ID:From:References:Cc:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fSDRJ7t7DSzZSmaWp/vTFZ5hnYlhzoywiXt+k7Svtu4=; b=D38sJdWBw3CXsN
	kEbXBgYRV+XdSh43tt3z7L7XD7nI+GRRW/X7WTGiWFw39YmwuGyvBquZnpOuB7WgvVaeadvt553GK
	AyVb2kvqQXdmnrXVa1o52DD6n/icr2kQrCtxLXXb6mRzFkLMh3SujQXR3PO5Lno+/pE1YJWIv7o2y
	QNrGc8OeBciQ9ua4WDGRlgLW5IM9vWvt0xtKiAI4Z2TUEZGx3ZIhaCeDBS8lsT8wNmiryqP98MGTc
	IykoJ6TOUySJ2QjaF7NTDlAMIqdSVV63W0ZFSYBw8sU5JtB1styUd3yZlWGXbxUuJXFkSGt10ATDT
	I1Ihn7yHsgnyC9W3CnNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmw3L-004iIX-BW; Sat, 29 May 2021 10:18:47 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmw3G-004iGL-T4
 for linux-mtd@lists.infradead.org; Sat, 29 May 2021 10:18:45 +0000
Received: from [192.168.1.107] (82-131-159-88.pool.digikabel.hu
 [82.131.159.88])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: hs@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A125E81743;
 Sat, 29 May 2021 12:18:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1622283518;
 bh=eOWChuaOlYEg9WTzT+lQpfH+ZYt2RbscXxyZVBn3HNU=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=KgXO2kaalxVNCnULCyHQe40gcwQNhjmcM8JfVhIqQWIGZj5UqPMpH4qY4O/xX6L1X
 R9LL8Ka2pX7CTUKDYb6OsmXdL+dq3SrW/DHsVMZVKzd7DcxC3QliZh8ooyPbyT3LK6
 uxbbh4ey2tN9I0k47TCqFKNFR26lH9fqHLi0T6JgqTD6msp3iyMUcaJLycAD/dONu2
 JBdMIw87Aa67g8rDp5Ly2J5TE3wWs9BvZSz+zCE1jMwzWZGcPIIX/mRuq/vaytjlBO
 uBPKZXGXgxRYymIunnnVuojh1dEbAzf++EjkZ5RjUszT8tQfGq+8OShjrcmTvpRBz4
 ZmCa/vLIjvK+w==
Subject: Re: [PATCH v1 1/2] mtd: devices: add devicetree documentation for
 microchip 48l640
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
References: <20210528072351.1639575-1-hs@denx.de>
 <20210528072351.1639575-2-hs@denx.de>
 <1622218910.743539.3720612.nullmailer@robh.at.kernel.org>
From: Heiko Schocher <hs@denx.de>
Message-ID: <8397f566-6a72-5b39-56bb-bdc37081357e@denx.de>
Date: Sat, 29 May 2021 12:18:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1622218910.743539.3720612.nullmailer@robh.at.kernel.org>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210529_031843_296114_4931FD08 
X-CRM114-Status: GOOD (  21.91  )
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
Reply-To: hs@denx.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Rob,

On 28.05.21 18:21, Rob Herring wrote:
> On Fri, 28 May 2021 09:23:50 +0200, Heiko Schocher wrote:
>> The Microchip 48l640 is a 8KByte EERAM connected via SPI.
>> Add devicetree bindings documentation.
>>
>> Signed-off-by: Heiko Schocher <hs@denx.de>
>> ---
>> I must admit that I created the file
>>
>> Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml
>>
>> by hand, looking into other yaml files...
>>
>> Is there a way to check such a file to its correctness?
>>
>>  .../bindings/mtd/microchip,mchp48l640.yaml    | 40 +++++++++++++++++++
>>  1 file changed, 40 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Traceback (most recent call last):
>   File "/usr/local/bin/dt-doc-validate", line 67, in <module>
>     ret = check_doc(f)
>   File "/usr/local/bin/dt-doc-validate", line 33, in check_doc
>     for error in sorted(dtschema.DTValidator.iter_schema_errors(testtree), key=lambda e: e.linecol):
>   File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 723, in iter_schema_errors
>     meta_schema = cls.resolver.resolve_from_url(schema['$schema'])
> KeyError: '$schema'
> make[1]: *** Deleting file 'Documentation/devicetree/bindings/processed-schema-examples.json'
> Traceback (most recent call last):
>   File "/usr/local/bin/dt-mk-schema", line 38, in <module>
>     schemas = dtschema.process_schemas(args.schemas, core_schema=(not args.useronly))
>   File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 587, in process_schemas
>     sch = process_schema(os.path.abspath(filename))
>   File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 568, in process_schema
>     DTValidator.check_schema(schema)
>   File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 738, in check_schema
>     meta_schema = cls.resolver.resolve_from_url(schema['$schema'])
> KeyError: '$schema'
> make[1]: *** [Documentation/devicetree/bindings/Makefile:62: Documentation/devicetree/bindings/processed-schema-examples.json] Error 1
> make: *** [Makefile:1416: dt_binding_check] Error 2
> 
> See https://patchwork.ozlabs.org/patch/1485038
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.

I just setup this stuff, and have now a

'make DT_CHECKER_FLAGS=-m dt_binding_check'

running without warnings from my new yaml file.

Thanks for your help!

Will send a v2 soon...

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
