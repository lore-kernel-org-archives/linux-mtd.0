Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970B4C001DC
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 02:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l1ujKPN8kdM4JON3pYGWQ1iAqTDURwTjXBo6iHJSc50=; b=wM219wvl1UOESj
	8xaJEweluFyjnvNqQT7ojK6qc53oCzocwR+EVxN1hyLON85Gv0cB4ejph9TXc8alX6XQUxdxrvcQn
	U6jvnIaVN4v+Vx38FyRNTolc9SYM4CZzK8wZ3CJiNdGvFYuRTnWMqQ2XeeIv+K6aKdKSiKejAi4qt
	V6krjXYZp3QjDoxXxDSxKG9SGdJxcOa7SvrqmbWrXWkXFhT8ovH9Oz4YooVcoqggDtTr9lOM7/xFl
	UgcE7Tt7V69FUhnQ9xLN5CYdENjXvyMHifO//ikeLXDKp8oNKuhsrsPaceFp3TDaUJGjTft2tNcrA
	4+MNTZvFpTHSS7QYPzUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPDGk-001J2w-1R;
	Fri, 28 Jul 2023 02:31:54 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPDGh-001J0m-25
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jul 2023 02:31:53 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b9540031acso26586981fa.3
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 19:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690511504; x=1691116304;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FDEw8VcsipN2f9HP2hbo0C9DGlgmo5gAq6nsfLHWOes=;
        b=KjGdeUFTefSRA4UcUnwO46yAsOyPdALndbY37a66ecLG4vFt7fx7DKT42FepdCVBZX
         ragCYoh1n/fsq6BhLTi+0PDgxCE+1zOX26bcsj64g04LEWLcUXI4at4rC7Rej2Ts4nSM
         r6JucAE8EaM5MCJL9+KyskYxrDcRWGZhwyNHYRkoyyz33U2faw00B5XF1PW2t9nchNMN
         Ca/Kl+AYo2lTgY7byLrGIf8rjnXQNkLeAsXAQ6DRoMxnpXzRDDZgz8wcQ0J0S0V6GhXs
         NcxKVmBWGpKxZydun3Dmk0oC4iZ+VjEH3YxdrxLi9vkEzW73OQsksM5qB0aiw4BxQ5OH
         JjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690511504; x=1691116304;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FDEw8VcsipN2f9HP2hbo0C9DGlgmo5gAq6nsfLHWOes=;
        b=VerMHqKmvHgp2pIAF9RGeWBXG9lY63hADIyOA71QZ6iZdMKfR6jITFkDnP6xV4dffx
         PEzpgjLfuYWRu2eD24P1oWTyeVlGk+D3NLZhyPjGqXomdA6s7DJ7gtvOBZ880SbTkSra
         0+37GA7vYSqpARdo6VXALTLKAwOSwGtvYLe9+7WCj/8I7DTWaMg2g4fdT6ryUoFsJtf9
         PedgFUBxM3hy8MgWCjJEgIuVvAe4UNxIqrTKRa2CjW+OwjWopKmkrhfmEZ2N7j/b8bg8
         //ucrMIxIVb4iPWhGkyhnZzWEDPyz/slN4TSQ+M7J05zmaWMzpFcmRlZ3nY1A6RWaQVt
         aE8A==
X-Gm-Message-State: ABy/qLZgJ6k36YE8T+eInr6YYTkgyX8JOxY/cNLFXdvWdFa2AZOukddj
	dR7Y6yqKx/v/13O2H7fXTVNBAA==
X-Google-Smtp-Source: APBJJlHCbnzVRjrCqObrktQTfaax52MNIksi8HS4GWyUGX2L4dl0GTcXG0CCNRcJrQm+lBQOgNiPTg==
X-Received: by 2002:a2e:b0ce:0:b0:2b6:ad79:a4fb with SMTP id g14-20020a2eb0ce000000b002b6ad79a4fbmr597273ljl.1.1690511503878;
        Thu, 27 Jul 2023 19:31:43 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id j6-20020a05600c1c0600b003fc3b03caa5sm8121135wms.1.2023.07.27.19.31.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 19:31:43 -0700 (PDT)
Message-ID: <4701576f-5eca-b1e9-5b5c-de1d861e286a@linaro.org>
Date: Fri, 28 Jul 2023 03:31:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 8/8] mtd: rawnand: qcom: Fix address parsing within
 ->exec_op()
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>,
 Sricharan Ramabadhran <quic_srichara@quicinc.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel test robot <lkp@intel.com>
References: <20230716144612.32132-1-miquel.raynal@bootlin.com>
 <20230716144612.32132-9-miquel.raynal@bootlin.com>
 <20230717063843.GA7062@thinkpad> <20230727165923.32488041@xps-13>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230727165923.32488041@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_193151_692847_B5E2BDDF 
X-CRM114-Status: GOOD (  13.82  )
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

Hi, Miquel,

On 7/27/23 15:59, Miquel Raynal wrote:
> Hi Sadre,
> 
> mani@kernel.org wrote on Mon, 17 Jul 2023 12:08:43 +0530:
> 
>> On Sun, Jul 16, 2023 at 04:46:12PM +0200, Miquel Raynal wrote:
>>> The naddrs variable is initialized but not used. Fixing this could have
>>> been a matter of dropping the variable, but the right way to do it looks
>>> a bit more complex: we can avoid useless writes to the q_op structure by
>>> using it. In practice we could even have possible out-of-bound bugs with
>>> the existing implementation. Let's fix all that by just performing the
>>> right number of assignments in the addr{1,2}_reg fields.
>>>
>>> Fixes: 89550beb098e ("mtd: rawnand: qcom: Implement exec_op()")
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202307131959.PdPSC86K-lkp@intel.com/
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202307131730.NOYbcjBr-lkp@intel.com/
>>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>  
>> LGTM! But I'm relying on Sadre to test it.
>>
>> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
> I don't think I've received feedback from Sadre, I would like to close
> these issues, can you please test and give us feedback?

All patches are pretty straight forward. Let the 0-day bot run with them
and then apply all if no further feedback.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
