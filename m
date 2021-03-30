Return-Path: <SRS0=LUPw=I4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB57C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 10:08:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3924E619A6
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 10:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3924E619A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+ujjUpk4FtaEv4P7M8p/oRZRvZ1Ng6lRBNBeFwr+mx8=; b=ppTpkFGgMUsaTT9PrQjOSQy2K
	EgzJdyyGepaZ9iDypyNYLD80MnmXxJ29fd7QGkwjEcS+sxrjgM0jobBV1fdG05Zon6fH9lBXBY603
	Q+k8qtGyBZAKiKYOOd7YfTo7KkvHw9uhFvY5Bp051Fl1qVluZBckmr387WVmZCyGouE6TV/DtPQxJ
	nWm+IPWjM3mgvhIhn8CEyYLEYvQFldyIG8lff8dDojiKdpK6cE/zIR/nsz9hGUjoMqrYszAN7IhBm
	KBaZpMIsFIpbaMgaFxlo+FmVQTU8+S7fphsbV/DVOQ9562pv3/cu4C0XLAfU3BD1GT6MPQ4u4oDvj
	JEOHwpmIA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRBI2-003Lz4-Mj; Tue, 30 Mar 2021 10:08:02 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRBHx-003Lx5-5r
 for linux-mtd@lists.infradead.org; Tue, 30 Mar 2021 10:07:58 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 3726E22236;
 Tue, 30 Mar 2021 12:07:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1617098876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tiLq4LE7BnrDVBVgGUBZ/04kcMa38cE2DDY48MfDYgU=;
 b=Rma71OlPQQXc0DGu35iz2chpo6I+EegIfjfHWe5vFVJ4Qe4qGnMjrn44My6ocspogp+iIg
 jTr6N+XQXP2KLOwJbN3+OOmFUxfH+XvHlK2EVC8j/qTmKbz/UE0bDPoyX57BWR/69zysHl
 24HRXFHEeX0+MN3YfA/+ofFnZ6Li/Ko=
MIME-Version: 1.0
Date: Tue, 30 Mar 2021 12:07:56 +0200
From: Michael Walle <michael@walle.cc>
To: Rob Herring <robh@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, =?UTF-8?Q?Rafa?=
 =?UTF-8?Q?=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: Re: [RFC PATCH 3/4] dt-bindings: mtd: add OTP bindings
In-Reply-To: <20210327170920.GA249312@robh.at.kernel.org>
References: <20210322181949.2805-1-michael@walle.cc>
 <20210322181949.2805-4-michael@walle.cc>
 <20210327170920.GA249312@robh.at.kernel.org>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <1c3e047fe0527abbeb73cd34219f6b49@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_110757_425592_F4099D0D 
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Rob,

Am 2021-03-27 18:09, schrieb Rob Herring:
>> +    spi {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        flash@0 {
>> +            reg = <0>;
>> +            compatible = "some,flash";
> 
> Soon (in linux-next, but off by default) this will be a warning for
> undocumented compatible string. Use a real device.

Two questions:
(1) I guess this is also true for "PATCH 2/4", where you already added
     your Reviewed-by?
(2) I'd add the "jedec,spi-nor" because, that is the one I target. But
     before doing so, I'd need to add the otp subnode to the spi-nor
     schema, correct? Otherwise, the schema validation will fail. Eg.

--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -9,6 +9,9 @@ title: SPI NOR flash ST M25Pxx (and similar) serial 
flash chips
  maintainers:
    - Rob Herring <robh@kernel.org>

+allOf:
+  - $ref: "mtd.yaml#"
+
  properties:
    compatible:
      oneOf:
@@ -82,6 +85,9 @@ patternProperties:
    '^partition@':
      type: object

+  "^otp(-[0-9]+)?$":
+    type: object
+
  additionalProperties: false

  examples:

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
