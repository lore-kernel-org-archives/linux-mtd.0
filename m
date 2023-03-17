Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53128C6FD1D
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Mar 2023 08:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7eB/uZu1ls+rFxar0tsRn94AEm+AujMaYJrfp4DAxQk=; b=2iFjUv5MiTrfSx
	Znzx46s2+HjjVvsMHDIG6EB82PkUrEdrlzQ+N/4WH1KUOcAGjuRuCpvX4JhcWoqJPFUtuVoVNu6QD
	0PRYjWj8L37YUrGBluWmBjC6NXaXzxDID7jJaff2E171HxRtTsgyjtq3u65rB6BifaeBZma0xVhbQ
	Nl7HBW+9WFXIknt4afRh97Q9I1wEU0QOn/fbLcfC2/EuptieLXv8+9N2yhsJlV+VJO88SS7yhqhGu
	FVtuLurjL8SAKSBC3wPHMFpPMLnoeWVcD/u6/M+F0mV9jGCHZ/U68favj8YlL0GUkK9hJNPVFLQEw
	KBCrqUPFAo1ScUWUJNFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd5hN-001Xjz-2P;
	Fri, 17 Mar 2023 08:44:29 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd5hJ-001XiC-2I
	for linux-mtd@lists.infradead.org;
	Fri, 17 Mar 2023 08:44:27 +0000
Received: by mail-ed1-x531.google.com with SMTP id z21so17511186edb.4
        for <linux-mtd@lists.infradead.org>; Fri, 17 Mar 2023 01:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679042663;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J6NYA0wCgWDefyLAOc5P5kFbBTKmFV1aY1moHxgahZ4=;
        b=nSnrtmro6phByHozBbIH+6vgvGhfoA2XR6oh4c9iFxXwheTatFHgEWS+SwuFCFkbdZ
         BfBVGU5j7zYY5VUsQnQP37PgGMeZ42DOcBJvs4A9sZqamJKHfTQ1yxG94Hsoic30WAwd
         qW20GsPtNzcWJkTob8X0JCuetOip0Odt2nqnmF0fgsoB7z8Vxf2XjM1j4yR6ZS9jjTtV
         LijYWf13ukfiur9d7iEcl7Or8Vah/ec81ZO2/HtxHBuc9F0UF23agl6m3HSaQEktfJu+
         qbJRkgZOeB6KPxPvcM8KXOZo4PEZVNYJ+WpIeKdRGDCRlvv7RAKTZB3OsIX0+cc1QNqu
         BqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679042663;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J6NYA0wCgWDefyLAOc5P5kFbBTKmFV1aY1moHxgahZ4=;
        b=uEUSrQ4aM9royqXtuT9YW35iWttLo7JlvJ0/YPtNZWdWajRNqJQDIKE7ZJn3dARv5c
         Hy6Ze6LRQLpl7mDjB234g5ihsvj3LhI+w33mtDLySwofEyuj28xmUBCRN0ddXRtOse8z
         R2ZXQqsSgUJlAY4b098k5mbMKFVBXywmtvXKcDXKkh1gvVrM4XYtaNtP32uA/+nE0qd3
         w8IBzbD1zBwYimmp/XKat4wOIVL1KdAyH3+JlBrKn8zWDzNKbfdXLj+q6F10jRJAGTzg
         oBM13gHpdlDhDKhaV4gvjwuEfy83FJx+m/OF43m37pJDSKc9VbaDaUukIN9lyOr8QUJj
         PuLA==
X-Gm-Message-State: AO0yUKWf2ihx2rOFesB90IZ0WE5EC2fSy4g50Qufa3j8dPhmL+MJ7cHk
	HXI+uoV6rpeVXWlaMM4xFaM=
X-Google-Smtp-Source: AK7set8KpwunSYP+AssKKXLVGbERVf3AkLTktgzChwGdNKe+i4I0cKfF28SlHZOKl4ijmlRxjNML2g==
X-Received: by 2002:a17:907:a4ca:b0:92f:d900:9c66 with SMTP id vq10-20020a170907a4ca00b0092fd9009c66mr7600786ejc.10.1679042663332;
        Fri, 17 Mar 2023 01:44:23 -0700 (PDT)
Received: from [192.168.0.173] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id jx3-20020a170907760300b00930876176e2sm713264ejc.29.2023.03.17.01.44.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 01:44:23 -0700 (PDT)
Message-ID: <5077782b-334f-c292-2e06-450c203b8fdc@gmail.com>
Date: Fri, 17 Mar 2023 10:44:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4] mtd: spi-nor: fix memory leak when using
 debugfs_lookup()
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Walle <michael@walle.cc>, linux-kernel@vger.kernel.org,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
References: <20230208160230.2179905-1-gregkh@linuxfoundation.org>
 <f60870dee13900252e0b13fb2f5f05b5@walle.cc> <ZAWNtv0g6vmADGnb@kroah.com>
 <20230306093336.523832b0@xps-13> <ZAWuvRHVVV3hTm0e@kroah.com>
 <20230306120558.00f614fb@xps-13>
From: Tudor Ambarus <tudor.ambarus@gmail.com>
In-Reply-To: <20230306120558.00f614fb@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_014425_766450_DA6D145C 
X-CRM114-Status: GOOD (  18.88  )
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



On 06.03.2023 13:05, Miquel Raynal wrote:
> Hi Greg,
> 
> gregkh@linuxfoundation.org wrote on Mon, 6 Mar 2023 10:13:33 +0100:
> 
>> On Mon, Mar 06, 2023 at 09:33:36AM +0100, Miquel Raynal wrote:
>>> Hi Greg,
>>>
>>> gregkh@linuxfoundation.org wrote on Mon, 6 Mar 2023 07:52:38 +0100:
>>>   
>>>> On Wed, Feb 08, 2023 at 05:15:41PM +0100, Michael Walle wrote:  
>>>>> Am 2023-02-08 17:02, schrieb Greg Kroah-Hartman:    
>>>>>> When calling debugfs_lookup() the result must have dput() called on it,
>>>>>> otherwise the memory will leak over time.  To solve this, remove the
>>>>>> lookup and create the directory on the first device found, and then
>>>>>> remove it when the module is unloaded.
>>>>>>
>>>>>> Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
>>>>>> Cc: Pratyush Yadav <pratyush@kernel.org>
>>>>>> Cc: Michael Walle <michael@walle.cc>
>>>>>> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
>>>>>> Cc: Richard Weinberger <richard@nod.at>
>>>>>> Cc: Vignesh Raghavendra <vigneshr@ti.com>
>>>>>> Cc: linux-mtd@lists.infradead.org
>>>>>> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>    
>>>>>
>>>>> Reviewed-by: Michael Walle <michael@walle.cc>
>>>>>
>>>>> one nit below I didn't notice earlier, no need to send a new
>>>>> patch version just for that.
>>>>>
>>>>> ..
>>>>>     
>>>>>> +void spi_nor_debugfs_shutdown(void)
>>>>>> +{
>>>>>> +	if (rootdir)
>>>>>> +		debugfs_remove(rootdir);    
>>>>>
>>>>> debugfs_remove() already has a check for NULL.
>>>>>     
>>>>
>>>> Ah, good catch, I merged this in when I applied it to my tree, thanks!  
>>>
>>> Any reasons why you did apply this patch to your tree? It is a spi-nor
>>> fix, I would have expected it to go through mtd.  
>>
>> It's been sitting around for a month, I assumed it was lost, so I picked
>> it up.
> 
> Sorry if it took too long, the merge window also happened during that
> time, we are collecting patches now that 6.3-rc1 has been released.
> Next time don't hesitate to ping first ;-)
> 
>> I can revert it if you don't want me to take it for 6.3-final
>> through my driver core tree.
>

It's fine, I don't expect other changes on these chunks of code. Anyway,
if there will be merge conflicts I'll solve them locally by merging the
-rc containing the fix.

BTW, you forgot to cc stable and add a fixes tag :).

> I'll let spi-nor maintainers decide what they prefer.
> 

If it'll be a next time, a ping would be better.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
