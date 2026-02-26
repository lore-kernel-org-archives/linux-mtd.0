Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7704FCE08E
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Feb 2026 14:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rh1c17KhegPBkr4cXyAuWo9sJTU4AhqXIM+IWCbxT7Q=; b=QhgcTWMh6NJnAR
	xwnnCreIAUt6BVcKD3Ri8zacceGFCgddyq20UeuYilXrAGnB2+Nf+pcQMlAqzjOJ1hgGoX9zMX3HZ
	5aN3xmwqK5exPKjU9QVjQ+bPpVWJGUuAtQxHIKvH9ro3oTHb8XBaHzjJGjBMsk27uWX1rzdrhgjib
	oNGxIRt06P6+e1LutwsS/wyWEB9jpvMltBZ/78K4fbuzGf/mxPcKaugBhaM1QO2WBk2Oe3hBLuIH7
	3PDpgon8hp3MoFumLFAcCPa1y38kHCiTNesilEOTOivyRtpjuJDZkNfZAn0QiY6WMLyPWIAirIVTh
	G/ukjihM1D5qVQVksj6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcJG-00000006KrS-0v70;
	Thu, 26 Feb 2026 14:25:46 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcJD-00000006Kqx-3U5A
	for linux-mtd@lists.infradead.org;
	Thu, 26 Feb 2026 14:25:44 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-65f980cea07so1439722a12.0
        for <linux-mtd@lists.infradead.org>; Thu, 26 Feb 2026 06:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772115941; x=1772720741; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pXy73SGtwWhlxajZZ10kEyDNafO+5aYOTGZMvE1Emss=;
        b=fTadr1dhfHx9ehHiz5DVFlE6XW+hNzWwenyUqdOTP37wQF1uEOZccKGJnTpAUQeule
         jpce0EGjsZoPTYSg1YSl8xQ6yOTgqPTmis1KqYgQ74PrWGkSVClPiRoaglLRkt/DJjjO
         UCrWw4/7fD9cLcQNl4EOZUfRD3OyYcNxCO/r+VOCDmUU7hRaHpkVoQ23YDWlPOqbxZds
         zwWS9Oaa/A8Pnon7ITwpRLatAKR5xmIU5fbqOaGsJvGmrRVqurFGuae793CmMmUe7B1y
         liV8M6Nt1mqpI1K6v93XwYAIKpuRYqfyMCJBBp3mzUGYyCXPmXJI8dKqhpo8ZAY/JBFR
         /6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772115941; x=1772720741;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXy73SGtwWhlxajZZ10kEyDNafO+5aYOTGZMvE1Emss=;
        b=vGM7gueL4uXpgTRS5XtFIWMrKN5q/BF767mwXawCcg3iE+3FKy1Dd+qZEdg51tH0Hf
         1Rue7akIBteg/6L8xV4ks4f2pqdv0pkrMSRCWZ52EpiyKbIjWDM0F6L1FOAFolMohGLr
         IGVcXWxiXqiRRSdp0nGtKmOhOXovaPjpIBubhd4z53NwhNu9hH/fdpZ94ChhSH7MIryC
         QiMakkq4vR02ZNv3P/ykKlImajLmS2CmAdtqxWifDQSelBjLoSdpTz79kjRDMunuToRG
         jKxHvOGqkKW0THYQt5NXmhofYNFWwM0pSNqe/3j+fL7EzwgzyCczoylkmbPVAFqn3kWE
         EnIg==
X-Forwarded-Encrypted: i=1; AJvYcCWAOyOuIW20/SLDrEhIhYny5UlrwZc6Hk5+bCPNDUVlo77U9S/Mc8PyV90M2vdn8F7JvXgk9Abq0bs=@lists.infradead.org
X-Gm-Message-State: AOJu0YyK1oX5p4Q8ogu8pR2+A52IonJfZZceFSFQWYFyvhcjA9iAnzrh
	Km1ls1/ixVHa9PamX6Zg0BY0T4Ywp8Rk0Rtwg1LdzlMCm7NbpzELsXY2Cc/2kc+O9eXy7oJ9Ftv
	xysALVTM=
X-Gm-Gg: ATEYQzwX7Cv0AFSilPobiBIJ+Ed+tiFrO2SNdzydKuU9pCGkjwSwGt4uMI15f5Vi7H/
	D07cmMDA+I1Fo63vYt7TgS62yw++cir6DSF+BK5M93nsrh/vSN+nel6+o5hkm55310vVGX4nva5
	8o8bj8aXIwtYGRp1VbLLRZ443H/czziY/lPCjEAZE8OrzD+URiDGBr5MwKcA70T7I9vx3aIuVOF
	McnFv9gunB93Be/zX6QTJpK7+p5UhHuVc4e8z5OYqd2rSWW1j6tGQN11RN7lLcAV7U5x2QXxm8u
	DdbKld06F7GZk3m9SE0iKwU4XDZ6sZTJq20wADmUpIglb7+yvahBxskiQ0m2EqcGX2YFl4EvyT8
	R4JR761JKDcg/pSKx41mZbLvCg0FDNHY0TUzKXdFpTuYxWFNCfyrsddaoRHDisMV6tsXnCfVraD
	VMHFJfjhEa8fHGrRr5ENYQIIT9I+ZPS8A=
X-Received: by 2002:a05:6402:520e:b0:65b:e93f:689c with SMTP id 4fb4d7f45d1cf-65fb6c6f2b9mr1185703a12.21.1772115941011;
        Thu, 26 Feb 2026 06:25:41 -0800 (PST)
Received: from [10.11.12.108] ([79.115.63.77])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabf6cfd9sm549544a12.22.2026.02.26.06.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 06:25:40 -0800 (PST)
Message-ID: <e79a7344-cbdd-47a7-aca5-cbba0d34ab0d@linaro.org>
Date: Thu, 26 Feb 2026 16:25:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] MAINTAINERS: SPI NOR: maintainer and reviewer updates
To: Miquel Raynal <miquel.raynal@bootlin.com>, pratyush@kernel.org,
 mwalle@kernel.org
Cc: takahiro.kuwano@infineon.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260213-remove-tambarus-from-spi-nor-v1-0-6caefb1a63ae@linaro.org>
 <177203780705.1983427.17146838755296719140.b4-ty@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <177203780705.1983427.17146838755296719140.b4-ty@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_062543_914471_80B0B7DC 
X-CRM114-Status: UNSURE (   6.64  )
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



On 2/25/26 6:44 PM, Miquel Raynal wrote:
> Applied to mtd/fixes, I will queue these patches through a fixes
> PR. Thank you again Tudor!

Thanks for queuing this up.

And thanks everyone for the kind words and the great collaboration
over the years! It's been a pleasure, and I'm very glad to leave
the subsystem in such capable hands.

See you around the lists!

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
