Return-Path: <SRS0=Kp4F=33=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B566C2BA83
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2020 20:17:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6398E20715
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2020 20:17:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LM1pDL5C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="ha2nbOJF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6398E20715
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=y78ZMTOQ362UyrIobH1t1wMtv728Hph8t0/YtswJ908=; b=LM1pDL5C1fVH/joZSvvN59Q9yK
	aNoOHSa/rPWgRnkW7RYgwGpZ5XtYNg8XFzaYuOHj/1hrhVEx9cSFPyURh9SjUKS0emBPdvNwggcqX
	UVcnRXadS0pyiIJgas81voaKizUJYwsmRIAgZV52Z6CckaPtBP1zkjijge4Jjm8Tpxhww3+1PI+Yv
	EZFKiayGGmpS2gEaDEIC2Qq9NMQSJbJCbHcYZQQ9+GbYtl2etbNYzVDc+DnO370jS96J7NAjN1num
	B62SAwZSjwS55p4ezdLPF/4q3z7qhux9M9PNQcGMksmewPr1GOZIDQkd4qvreVn1ekUl04gJRPb3t
	gMTSY8Gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j0A4O-0001Rb-Hd; Fri, 07 Feb 2020 20:17:44 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j0A4L-0001Qg-CW
 for linux-mtd@lists.infradead.org; Fri, 07 Feb 2020 20:17:42 +0000
Received: by mail-lj1-x241.google.com with SMTP id a13so610094ljm.10
 for <linux-mtd@lists.infradead.org>; Fri, 07 Feb 2020 12:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vFTxeE5liDry5r2GcFp5oMwFF8a0KAeUk2qXnfNDNow=;
 b=ha2nbOJFJXBO4S6wqcOY0NojAVOe0Zm7mkE+a1f6/UBspDKjoamJJ+z5UdVIbZSN4D
 /XNwB4EqSolhYFgPf3wQJeHZvrLId2BeEKxPAiQqwTPE5X+qLHlk72YlaxlMe14RCUYx
 EmbF4LheJV0cshm0iyzX3uQE3US4xbeOhPl7KfUkFcNNDz2vwM5z+Zp5CkJwiXGpadWx
 LugqtdFmxzsLwuopEaMZWxNtaPgHMcBZTp0iFixcxSGpV+OKkHggHK9nWDlE7HJ08L7W
 hFAhSsOIDcLnGQh/AP0OkiCUVIlDzh8DOCMvetMti/6ygpapCLQ7wZXz85p4dwF94oF/
 HG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vFTxeE5liDry5r2GcFp5oMwFF8a0KAeUk2qXnfNDNow=;
 b=cWKtHEB9oY9L8TXpVAQ7tp75cDudIv6d0MV5T2/MkMdA7IVHrYutibnwDKA5k9DfOM
 IkXE98htQdY97pUhIJlWUxFq6mnV7kfVMIUjuRiR3E1oCQr/nIRZ9Xx9rmwI62s3Q/lc
 2ZMd1U85wQ63Sq9wI228lfLgao/ROq9IN+sKhl0y5v/aE/cUFtN+nbxg7o6sxljEDeuZ
 g1ljidwavy0UjNaMKAmVLeDFavL59+dNIo6yv+PGD0p+WlT81jk2Pz6LCEpUcEKJbHkz
 EDoum8g1NsoEOC9N9dO72z/VkoXamiVBxCVHHwRS/UrDdtPM52TkgyULlEtO6GR72dpH
 /psQ==
X-Gm-Message-State: APjAAAWNaIv4uEbifHLbEEsVlzx8xpgfxNCl1HTSAw36x6bjnJmWY1Jd
 uFGx6HNX4P1i50X/T+BhOdQxkXEut8E=
X-Google-Smtp-Source: APXvYqwpW/K9IxVP/BoeR2GMegVuuCOvHO6S4eVZsMf5AiYyVo7l3sQ4QH95vEKdR9eOoEmH1T3u9g==
X-Received: by 2002:a2e:a491:: with SMTP id h17mr540152lji.101.1581106658459; 
 Fri, 07 Feb 2020 12:17:38 -0800 (PST)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:667:86ec:de03:9020:cf24:beb2])
 by smtp.gmail.com with ESMTPSA id d22sm1522668lfi.49.2020.02.07.12.17.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Feb 2020 12:17:37 -0800 (PST)
Subject: Re: [PATCH RFT 0/2/2] mtd: hyperbus: add Renesas RPC-IF driver
To: Dirk Behme <dirk.behme@gmail.com>,
 "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
References: <fd1360ab-8872-f750-1314-77c6d432b413@cogentembedded.com>
 <eba43289-3cb2-406b-cc5f-1209778621bf@cogentembedded.com>
 <34271135-d103-ccd2-2933-59fd4a399795@de.bosch.com>
 <3ea71f24-d466-81f8-2c1e-239b59e712f8@cogentembedded.com>
 <02108a3e-4527-ee53-3d6a-07b78cad5b60@gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <5fc79de7-fd24-0ded-d696-cba81ad0e336@cogentembedded.com>
Date: Fri, 7 Feb 2020 23:17:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <02108a3e-4527-ee53-3d6a-07b78cad5b60@gmail.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_121741_576180_330FDCAA 
X-CRM114-Status: GOOD (  20.13  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 02/07/2020 10:31 PM, Dirk Behme wrote:

[...]
>>>> Add the HyperFLash driver for the Renesas RPC-IF.  It's the "front end"
>>>> driver using the "back end" APIs in the main driver to talk to the real
>>>> hardware.
>>>>
>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>> [...]
>>>> Index: linux/drivers/mtd/hyperbus/rpc-if.c
>>>> ===================================================================
>>>> --- /dev/null
>>>> +++ linux/drivers/mtd/hyperbus/rpc-if.c
>>>> @@ -0,0 +1,162 @@
>> [...]
>>>> +static u16 rpcif_hb_read16(struct hyperbus_device *hbdev, unsigned long addr)
>>>> +{
>>>> +    struct rpcif_hyperbus *hyperbus =
>>>> +        container_of(hbdev, struct rpcif_hyperbus, hbdev);
>>>> +    struct rpcif_op op = rpcif_op_tmpl;
>>>> +    map_word data;
>>>> +
>>>> +    op.cmd.opcode = 0xC0;
>>>> +    op.addr.val = addr >> 1;
>>>> +    op.dummy.buswidth = 1;
>>>> +    op.dummy.ncycles = 15;
>>>> +    op.data.dir = RPCIF_DATA_IN;
>>>> +    op.data.nbytes = 2;
>>>> +    op.data.buf.in = &data;
>>>> +    rpcif_prepare(&hyperbus->rpc, &op, NULL, NULL); // ?
>>>> +    rpcif_io_xfer(&hyperbus->rpc);
>>>> +
>>>> +    return be16_to_cpu(data.x[0]);
>>>> +}
>>>> +
>>>> +static void rpcif_hb_write16(struct hyperbus_device *hbdev, unsigned long addr,
>>>> +                 u16 data)
>>>> +{
>>>> +    struct rpcif_hyperbus *hyperbus =
>>>> +        container_of(hbdev, struct rpcif_hyperbus, hbdev);
>>>> +    struct rpcif_op op = rpcif_op_tmpl;
>>>> +
>>>> +    op.cmd.opcode = 0x40;
>>>> +    op.addr.val = addr >> 1;
>>>> +    op.data.dir = RPCIF_DATA_OUT;
>>>> +    op.data.nbytes = 2;
>>>> +    op.data.buf.out = &data;
>>>> +    cpu_to_be16s(&data);
>>>
>>>
>>>
>>> Testing this, I found that writing data to the Hyperflash results in swapped _data_ in Hyperflash due to this cpu_to_be16s() conversion:
>>>
>>> 02 01 04 03 06 05 08 07 ...
>>>
>>> Breaking the usage of the data written for other users, i.e. the boot loaders.
>>>
>>> On the other hand, dropping this cpu_to_be16s() (and be16_to_cpu() in the read16 above) makes the probing to fail completely.
>>>
>>> The topic seems to be that rpcif_hb_write16() handles command _and_ data, and the commands seem to need the conversion.
>>
>>     The HyperBus spec says the register space is always big-endian but the
                                                                          ^^^ then

>> again

>> HypoerFlash doesn't have the register space...
>>
>>> As mentioned, the first idea, dropping the conversion and adding some debug output in the driver [1] results in failed probe [2]. Successful probing of the unmodified driver  results in [3], then.
>>>
>>> Seems I need some advice: Why is this conversion for successful probe required?
>>> Why is the first 'QRY' returned by the device not detected by cfi_qry_mode_on()?
>>
>>     "QRY" is in the MSBs?
> 
> 
> Well, even if we have swapping enabled and with this it's in the LSBs, it's not detected in the first run. See the first 5 traces in [3] below.
> 
> 
>>> Is the any possibility to drop the conversion _and_ make the driver probe
>>> successful? Or do we need to split the path the commands and the data are 
>>> routed? If so, how?
>>
>>     I've found some interesting options under the CFI advanced config options,
>> e.g. "Flash cmd/query data swapping" having MTD_CFI_BE_BYTE_SWAP value in this
>> item. With this variant chosen, I don't need any byte swapping in the driver
>> any more... and the QRY signature is read correctly on the very 1st try.
> 
> 
> Yes, but ;)
> 
> I tried MTD_CFI_BE_BYTE_SWAP config option, too. Enabling that and dropping cpu_to_be16s()/be16_to_cpu() in the driver result in a successful probe. And
> /dev/mtdx afterwards. That's the good news.
> 
> But, the bad news:
> 
> Trying a write (dd to /dev/mtdx) hanged and never returned. In contrast to the

   Not for me:

root@192.168.2.11:~# dd if=jffs2.img of=/dev/mtd11                              
random: crng init done                                                          
2666+1 records in                                                               
2666+1 records out                                                              
1365320 bytes (1.4 MB) copied, 33.0917 seconds, 41.3 kB/s                       

> solution with the cpu_to_be16s()/be16_to_cpu() in the driver, which wrote nicely to the Hyperflash, but swapped.

   Something's wrong at your end...

> Best regards
> 
> Dirk

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
