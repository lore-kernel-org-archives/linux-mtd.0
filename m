Return-Path: <SRS0=BXPI=BY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8981CC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Aug 2020 16:31:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54C6A2074D
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Aug 2020 16:31:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iMw5uwlS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54C6A2074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lucaceresoli.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vY9T8Wvra4CIqekE5xw3XITe/VRZFRz+m68xcLORGAY=; b=iMw5uwlSBs+NwIxT2AqDVM4gO
	nXKIr8a6wL+xN+L4NOPHGy2SNIx6z7/tBs/3+2Ac8hULH6O9Dvi5KkXKjDrf41TTd7HrdLaolS2UR
	tB2qTvdIFvWcC5nXnhfU8/KzKviAAZK7jJcbRpBqTABU+rl4pLBGmEHlY6l+9qXJL+S4d9ZOfy1Xs
	+QenYEOJro9sWbbwZhG9OkE4vZj83XkFdAhb2GE5f33V8i/esihdN1S274c1CmhQmPTiotnaVXL3f
	uosDbPinstyNgP7iepahM6k9IBptF9n4wjMHbMRD7vslF+n8Obnz9pTY8goXWQlV0xwqzRw6UqlN2
	mH6X4SOxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6cb7-0004l3-As; Fri, 14 Aug 2020 16:30:29 +0000
Received: from hostingweb31-40.netsons.net ([89.40.174.40])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6cb3-0004h2-LH; Fri, 14 Aug 2020 16:30:27 +0000
Received: from [37.160.38.175] (port=40734 helo=[192.168.42.162])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <luca@lucaceresoli.net>)
 id 1k6cay-0001mB-F9; Fri, 14 Aug 2020 18:30:20 +0200
Subject: Re: [PATCH] dt-bindings: Whitespace clean-ups in schema files
To: Rob Herring <robh@kernel.org>
References: <20200812203618.2656699-1-robh@kernel.org>
 <d5808e9c-07fe-1c28-b9a6-a16abe9df458@lucaceresoli.net>
 <CAL_JsqKekx0VO4NROwLrgrU8+L584HaLHM9i3kCZvU+g5myeGw@mail.gmail.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <f1963eb9-283f-e903-2a3a-4f324d71d418@lucaceresoli.net>
Date: Fri, 14 Aug 2020 18:30:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKekx0VO4NROwLrgrU8+L584HaLHM9i3kCZvU+g5myeGw@mail.gmail.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_123025_848770_5246D6A4 
X-CRM114-Status: GOOD (  15.87  )
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 "open list:REAL TIME CLOCK \(RTC\) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Linux Input <linux-input@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 devicetree@vger.kernel.org, "open list:THERMAL" <linux-pm@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Linux HWMON List <linux-hwmon@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 14/08/20 16:51, Rob Herring wrote:
> On Thu, Aug 13, 2020 at 4:31 AM Luca Ceresoli <luca@lucaceresoli.net> wrote:
>>
>> Hi Rob,
>>
>> On 12/08/20 22:36, Rob Herring wrote:
>>> Clean-up incorrect indentation, extra spaces, long lines, and missing
>>> EOF newline in schema files. Most of the clean-ups are for list
>>> indentation which should always be 2 spaces more than the preceding
>>> keyword.
>>>
>>> Found with yamllint (which I plan to integrate into the checks).
>>
>> [...]
>>
>>> diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
>>> index 3d4e1685cc55..28c6461b9a9a 100644
>>> --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
>>> +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
>>> @@ -95,10 +95,10 @@ allOf:
>>>        # Devices without builtin crystal
>>>        properties:
>>>          clock-names:
>>> -            minItems: 1
>>> -            maxItems: 2
>>> -            items:
>>> -              enum: [ xin, clkin ]
>>> +          minItems: 1
>>> +          maxItems: 2
>>> +          items:
>>> +            enum: [ xin, clkin ]
>>>          clocks:
>>>            minItems: 1
>>>            maxItems: 2
>>
>> Thanks for noticing, LGTM.
>>
>> [...]
>>
>>> diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
>>> index d7dac16a3960..36dc7b56a453 100644
>>> --- a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
>>> +++ b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
>>> @@ -33,8 +33,8 @@ properties:
>>>      $ref: /schemas/types.yaml#/definitions/uint32
>>>
>>>    touchscreen-min-pressure:
>>> -    description: minimum pressure on the touchscreen to be achieved in order for the
>>> -                 touchscreen driver to report a touch event.
>>> +    description: minimum pressure on the touchscreen to be achieved in order
>>> +      for the touchscreen driver to report a touch event.
>>
>> Out of personal taste, I find the original layout more pleasant and
>> readable. This third option is also good, especially for long descriptions:
>>
>>   description:
>>     minimum pressure on the touchscreen to be achieved in order for the
>>     touchscreen driver to report a touch event.
>>
>> At first glance yamllint seems to support exactly these two by default:
>>
>>> With indentation: {spaces: 4, check-multi-line-strings: true}
> 
> Turning on check-multi-line-strings results in 10K+ warnings, so no.
> 
> The other issue is the style ruamel.yaml wants to write out is as the
> patch does above. This matters when doing some scripted
> transformations where we read in the files and write them back out. I
> can somewhat work around that by first doing a pass with no changes
> and then another pass with the actual changes, but that's completely
> scriptable. Hopefully, ruamel learns to preserve the style better.

Kind of sad, but I understand the reason as far as my understanding of
the yaml world allows. Thanks for the explanation.

[For idt,versaclock5.yaml, plus an overview of whole patch]
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
