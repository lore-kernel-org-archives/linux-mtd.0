Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DB3C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jan 2022 19:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1pK0NxaJ6RiX5GU8BAgj1aSozW2gbv7hDp/JPscoeg=; b=RZUQiuADPuZe3lMIXEKR1qKwns
	bmwCS3m3TCfnU9TsSiWWeV9+TLumvJFAddnzIpiE3CpJk3YjPGe/wHnkUizQ33C1OfA3z5aVjXboH
	P3CJmx8cfFRg1jGQSjG9x7k0le4FE6qcbNC1OSJY+xbIsiedaCCKgwDOJMo2nkmRnznzZjpnEbjXp
	lFWmi/r9oXaHOBid9eMMptuELBkZCmlA1+uBvsgoxz7y4Aqad51R7l01cld497JT7Bkjk7aR2ynqE
	fAjSJfNP4pW4MIZpSMiyLwCrfLPU+RZvGup9vvC5dbAtl466ZUDqfG7BLcL2RLJ7qetR2QlSmGSXb
	MoOrIQ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCR2L-009HgV-QY; Tue, 25 Jan 2022 18:59:25 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCR2J-009Hfa-Lq
 for linux-mtd@lists.infradead.org; Tue, 25 Jan 2022 18:59:24 +0000
Received: by mail-pl1-x631.google.com with SMTP id k17so2723693plk.0
 for <linux-mtd@lists.infradead.org>; Tue, 25 Jan 2022 10:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=mOrQTgeQbpnpFUv4xSLza7WRSVXccPgKOa8wh4rdTUU=;
 b=hAylbz4lNlpsYjSm4M5m6osIa6FFcRbPwCfln2HVoslCWLTYjQQyI7J6fTPXt2JrvR
 KlEP9TYKVZoSRhZ8P6vgdOAxhPpxxF+/yEOWBNC1fWhGKjanr67cavJsc1a0ndE7ePBO
 D7Z+k7bm0K8r7yw+1c7IsKUZkkqoqZz73oJWq0nFvzgiwoFrNQ8sqEfZ1wsrKCVSIFEW
 UE5WUm58Lg5b3C3zylkLdQu7Xenxogv2FDMzP34pQCTKQiF5JugF1yNaa79AD/0yfqhA
 Vkr3KJLeWca8Z5k/W+Wi+XdwKTPtxES1vSxPsYZu+03Rbr2R6POPCRs4lCXqvH+s6OTf
 W9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mOrQTgeQbpnpFUv4xSLza7WRSVXccPgKOa8wh4rdTUU=;
 b=Sf6SVRIfAPKwu7GuWpcyd8kho11z9STNNwqQNNLQzbNDPVf4tS2mA2gV8ruGG1Xqda
 luJ1ExH4q8bEWdqmJy7F+W1wAL88WW7RzwnZrRb0GK7CVoehvQFaynTNbQaL4YaJCWyw
 JqLkuQ7qR0N9UoNGoTT3jQFNSqYP8gYUWMcO+DNAOtKi/hxq4xZtq4YJCABfLINp3X0a
 THp8/3VYHbOHiails+eiJ/fErfNiAaXTdtn4HqjyMJiMSec1TpNQcwTtZZxksI074RK6
 53tu5thK7R5/IqwMuzdkAMAKdkbtax90P23FaU1S5hJ6VyepAaB5ChfwHsEXunM76bsU
 fQRA==
X-Gm-Message-State: AOAM533+hz+B6OjCfDab7UfFzvyJ6GWYmKifkeABYq9gUOL/WM1MyOgj
 3TwmPa9oL1ASoDWzLUBtl8w=
X-Google-Smtp-Source: ABdhPJx0v9NoOlHks/z4GnJ8x3fPwyZb4NyO8ZKXSd+IFduVIg1vHCQ8nvRGX4vMOV5cCbchDZgagg==
X-Received: by 2002:a17:90b:1e41:: with SMTP id
 pi1mr4933630pjb.64.1643137161840; 
 Tue, 25 Jan 2022 10:59:21 -0800 (PST)
Received: from [10.230.29.214] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id g9sm15315150pgi.84.2022.01.25.10.59.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 10:59:21 -0800 (PST)
Message-ID: <5ea1a3c7-a8fa-f88e-7575-8d8e96833398@gmail.com>
Date: Tue, 25 Jan 2022 10:59:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] mtd: rawnand: brcmnand: Fixed incorrect sub-page ECC
 status
Content-Language: en-US
To: david regan <dregan@mail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Kamal Dasu
 <kdasu.kdev@gmail.com>, Joel Peshkin <joel.peshkin@broadcom.com>
References: <trinity-0c92e0e4-dcf8-4753-a934-f2cc41b5e6de-1642021707668@3c-app-mailcom-lxa14>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <trinity-0c92e0e4-dcf8-4753-a934-f2cc41b5e6de-1642021707668@3c-app-mailcom-lxa14>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_105923_757789_F10E9061 
X-CRM114-Status: GOOD (  13.01  )
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

+Miquel,

On 1/12/2022 1:08 PM, david regan wrote:
> The brcmnand driver contains a bug in which if a page (example 2k byte)
> is read from the parallel/ONFI NAND and within that page a subpage (512
> byte) has correctable errors which is followed by a subpage with
> uncorrectable errors, the page read will return the wrong status of
> correctable (as opposed to the actual status of uncorrectable.)
> 
> The bug is in function brcmnand_read_by_pio where there is a check for
> uncorrectable bits which will be preempted if a previous status for
> correctable bits is detected.
> 
> The fix is to stop checking for bad bits only if we already have a bad
> bits status.
> 
> Fixes: 27c5b17cd1b1 ("mtd: nand: add NAND driver "library" for Broadcom STB NAND controller")
> 
> Signed-off-by: david regan <dregan@mail.com>

Miquel since you were not copied explicitly, adding you now. Re-sending 
my tag:

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
