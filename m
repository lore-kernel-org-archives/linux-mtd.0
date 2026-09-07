Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12840C79F9E
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2026 05:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9dF6D7uITXo/mIebSxbTiIA8GKsAPJPZLsVcBavFDIY=; b=a6osDFa70RQj77
	RRKlk7iO3+P5w+jTDt6ugWogTsCrKyIt7SFsheswpXOb5FUtWAoCp0/+4SE5xNKMnUKKbqjXdGwc0
	q6KW3hliXiOMwfr7E7bl3aCzE8rZXzoNnSg0qvFixXFbMnQ65XJh2beVjuWWaTRPlHuzraozB+i7i
	6ucm/sCdVCIt2cxLWEJ1nifMtycZ9b7Zxo4V39e8JLGudK8t2NF3YHwlZLogTevsxn5rwvqUonPcA
	gG9r07NAwCoBEgiwv1qhyRfb9COXnBegrzPRry19wFQ7pIeKQGkm0m0X0YuxZ0g63s3lMYK0nGs22
	WCrK1iYXJZZyAR82lgeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3S03-00000005wNT-2PSo;
	Mon, 07 Sep 2026 05:34:35 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3S00-00000005wMZ-23I1
	for linux-mtd@lists.infradead.org;
	Mon, 07 Sep 2026 05:34:33 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47de0093c42so2855021f8f.3
        for <linux-mtd@lists.infradead.org>; Sun, 06 Sep 2026 22:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1788759270; x=1789364070; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CJur2IfjilQLONY5G5zrL5mZc6JOIFn2Q5Eu4Xl5wj8=;
        b=sDIJKYxuMv0fXyT0m2n9LylQuo/fzCZFcc/91g3VCLW7Es8Ztx6ww5LsJDzUytXEpn
         7nCKKcKlEjmN8tF+0M2A/arwvJy6pMrJ9+HFLkttZ0OcifuIYH0d9Rn2bHxpp/Gf1AZE
         KxG23ChPZQaNPzV7F50xXnD2Te/+F+568dVKqkNDQ4MH0ZbmweqP6bSD5TSh/z7fmrKP
         o7Xqbd2ul+hXsDuon2mwACKYbW+oqahfq4HjYfuHi5AyldUshbUDMIpV3zWZ18km3Qpj
         BSCa2CXTdYGoxwCJQNjFXHTgbnE2QAD2KxzT5Yfc/7IAncssfggJQ0rJu7CsGEhXQsOg
         +VGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788759270; x=1789364070;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CJur2IfjilQLONY5G5zrL5mZc6JOIFn2Q5Eu4Xl5wj8=;
        b=fE87sXgHfTbTkd9q4VNrZpb3gJT8C5OgCgXqGpUSZDVuQHtX2Hn0YLiw1BNi2KK0s8
         Z7A5RyiqpR5nRBKh3LeSY3HCz4GAnrcF0Emnu0Knam+mhggZ7udOddYDcOOLt7d29hqa
         ZJ/+IjuB5FU8PqMvo51sEgk1MzjObxKqOZhjQTzZduEXePABdvy2SpeWcJChyZ3w2Pin
         1FrkWGqtHpafnM2QDZHGBOpvvi+Pg9mHcVRUejDDcyPeBECHe2SydtGGYcU2vFc67Lss
         PBjC6+Y2ELVcaAb6WUzUKdBa2IVa8/kOyKTCBpez+CQB0t+iPnk0U8cc8wX6LSWRCSgj
         fhdQ==
X-Gm-Message-State: AFuF++kf+Ok+WZdhPRJHhOG/zvZLnrPYvTaLM+1kwaVX97H2jVK0usQv
	2tiaPBbcEWq6m5zSFihbhfN2ISvDmdnavPCHIWp36rKFAAc8lkynxvwa46UE1hNKrB0=
X-Gm-Gg: AYBFou2idoWsI+c+p5FVqxW6EphEDpvOFBJJRNLFl8Ztp3bCoJMobGy5nIOHHx7b+Eg
	qBPARoBtT7KjUoJCqd7JpbakTU6XCWSP4CpoOhDFceL1kSvawXYIHuqq8e8FTTFEBnlzxd2FSnz
	Vt08o+tlVlBPYUwWyhcZXx0nGXoV5R2YLbZZAwTmQBvyjabnlOfHCY8Ixnlo5m6xe9/vlL7vQKg
	C1eJ+odqldPY0r4htbXJxHIzWy9iwS+b/V0tuY+2SomtN/jsrhvpxDStr/mcZLjk8H+gmNBAaD/
	uCStp+mPDHuS0Xnz/ORJYc3tUQf0AhDBPB9k5S9Io/HAL5D05bD5pb34HaAwddMeB8A4z+wMLsB
	xwU2uYR8voC7oyb2mdV5cWKg+wzMmhRCrOOgE3i7svMaUp/oqZYQouOKmYDiJUOHgfVb4Rvm/Rl
	BMac3ZnLUszsokLR5lJr13d30owuzjNevQheAF+nA3LSoLIX0RxI94p2OizcxXudbsTrzqED+Tk
	bRkXMZHi04=
X-Received: by 2002:a05:6000:491a:b0:485:8c16:5efe with SMTP id ffacd0b85a97d-4858c16618emr16920019f8f.56.1788759270579;
        Sun, 06 Sep 2026 22:34:30 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885be1c1sm25298650f8f.32.2026.09.06.22.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 22:34:30 -0700 (PDT)
Message-ID: <bdb23e20-348c-4223-9a1c-ae86af934dde@sigma-star.at>
Date: Mon, 7 Sep 2026 07:34:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mtd-www] doc/ubi.xml: clarify from the start that block
 device on UBI is read-only
To: Richard Weinberger <richard@nod.at>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20260723091728.1075673-1-thomas.petazzoni@bootlin.com>
 <669411046.7135.1784798864843.JavaMail.zimbra@nod.at>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <669411046.7135.1784798864843.JavaMail.zimbra@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_223432_559902_796871D1 
X-CRM114-Status: UNSURE (   4.72  )
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

Applied to mtd-www.git master.

Thanks,

David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
