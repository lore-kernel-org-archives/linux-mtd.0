Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E384C87FDA
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Aug 2025 07:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xdMyuIdrVni+aXQZRCgP8tmatfwM+yfrKNTYeEJ87dQ=; b=Gc/gV9X7oj72eq5O5LfcdSIawj
	uIkrx8GjW5iOQ8cB7HRPGSEn5oX+ivcoITNfqf7JoODRqlcZdfyprkDxm9o3vkpzD1wm9Jm6l0CcU
	MDxhmSq+mm741tneYGHJWI6HRKcnl/iAjs2JMM5xjMxm5VOrRZuUdqRdjyfNQXRyF2G/QJf877gSH
	Q+lq3tIlJ/GsfAyipI9Mk4GLSsifkO3d24hDPWnLhxaJBUKHM+lo0h7dUb3ZYUxLJooQuJTaQS5tp
	LGuAa9tu+XkBAxk3rZn1iwLadWOyfrHYQmiPxG1rC7s2OE5Qm0bw1xJE8p+/gu7r4jIpJt3+m8cJq
	HAZx9S8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uipeZ-00000009p84-4AVI;
	Mon, 04 Aug 2025 07:30:39 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uipeX-00000009p7F-0E0Y
	for linux-mtd@lists.infradead.org;
	Mon, 04 Aug 2025 07:30:38 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-458b2d9dba5so14107775e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 04 Aug 2025 00:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1754292635; x=1754897435; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qYEoYYxDw1+do/dWl1i2qeNhKyKoyKkuuBdx/RYptEM=;
        b=Wds4afg46mdYKkuLKHnyNXIRP0ir3o4JCTxjOSehB00UuVSyYgq6ArPhs7mFjnTGCE
         rBL/x15hmK6hZQ0fRObaguxIKZyO7iVCOq8e4a03p2dG5nrcvgFgDr1FZSKbYp1i+/yS
         IqiQtJsGgix1C3I34Zrf8ehAyF3P/pcsxz55o2jfnvh7jn7y+wdBzxVu/WBg/EcGrJ/a
         MiRMGVPP/01lpFcBMBkfeGvoQg8/mjBS93eXYdkkGS9i7DbNI45xed/6Ct11+trMZhTK
         DwG4wbovB9iPjUsKPmkb2u2/2f0DDLta5b9yjMH+eeEzgyGG1hTtMH2Mcmp2itbAbS9d
         TXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754292635; x=1754897435;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qYEoYYxDw1+do/dWl1i2qeNhKyKoyKkuuBdx/RYptEM=;
        b=Soy9JWsdCblrLoPtOivY6yxaGxtVJHS5SeQCsKxKFq0R3GBoMnNtiBeEyGUmB6lwX6
         9qbdM6SIAgGun0FjdIHANL8XSCjJwqm+oxDRxrecc2ZxtatuV6eB/odrxmOAWElJPWBN
         PvRlG3RBMeNiv2WEJ39HzqzmnwRCjqXe1RgIx1PzZ7RaJ8LirK+oWPLaz7ALqi7S4Csf
         W5O7OkMH1saXoD4H1kjhwbOGvBkugVJVGFJALMHaHTdmxHj8V9Md+U96h5SRPnQUZ572
         jOVUzEluIjK5il7OpJ927liTetvwAho4Dl342Xr6+QzKHj2xQWuSAP2cupATH9uzfalP
         0g6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5chk+6cI5ux+exEJMFnsr+NysgSh8cI6DPevPe2ajRfuIXO4rZDX/EbrbVWZqnQg0eDrYFDRxOl0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzT8G157Nhu2GVDmMtNoQNafBv7rRWgjCCt4WeHuAggX/jd0Spt
	JtQkHOzZxLkZbyXmoSq0nOTJs3gAASRpFm/cfBPWp8WJe1cyElIbnHNAVHZgIWgjJcw=
X-Gm-Gg: ASbGncu0F41HmAit3psx2nRZdQxdKgGhFzefdp0iY+qQR9PmryHzXWADKIEXMnebxfp
	sh2RaRr1EMV76U4jjTWmftY76wDC5jOy7yitXPWNqS9dZHaWURv/oWYk5qPajtw+sIPTaQZpDpH
	fZ9kEq8frSYsqB+HPiWdKDomYKaSPitFcrJMu6SynKAyqhfE9OAgQke67LO5/1P8s6hitthgy4s
	WQVcAY/kVRTm3q6Gm/nzKoRsq/9bTeEexyQpoV+HbhGXIH+HPOaFNDk4p34l+SQ3APldkHJqB4z
	8VLJaSupxdiSNpyP0n9s0mvv8FBtFrVDMdDFiGTF6BHlv957TulpfgrTgwrcIaFdgsISB6YSzKU
	gGmsA5erbJWKB01mr6gejdmbllFIWVhoPDcU8VYG5CcvTpeCbzlERHRQ=
X-Google-Smtp-Source: AGHT+IEmWBuNi3LA07Xk8K9TgjMG4h792OkgcNY8un3jy16qvwG56ZKmK+6DiUdn+hjsybokaIqwwQ==
X-Received: by 2002:a05:600c:35c6:b0:459:d709:e5cf with SMTP id 5b1f17b1804b1-459d709e8b1mr26603715e9.3.1754292634673;
        Mon, 04 Aug 2025 00:30:34 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4818c1sm14361820f8f.65.2025.08.04.00.30.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 00:30:34 -0700 (PDT)
Message-ID: <8114ae51-a238-40d3-9ecd-70e23abae28b@sigma-star.at>
Date: Mon, 4 Aug 2025 09:30:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-6.16/fs/jffs2/readinode.c:189: loop can never finish
To: Zhihao Cheng <chengzhihao1@huawei.com>,
 David Binderman <dcb314@hotmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "richard@nod.at"
 <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <AS8PR02MB10217F68E5D37ECD491495E669C23A@AS8PR02MB10217.eurprd02.prod.outlook.com>
 <df923d94-92ee-f824-01e2-21e6ed3d593c@huawei.com>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <df923d94-92ee-f824-01e2-21e6ed3d593c@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_003037_387699_A6FA8DA1 
X-CRM114-Status: UNSURE (   8.58  )
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

Hi,

On 8/4/25 9:10 AM, Zhihao Cheng wrote:
> 
> The 'next != NULL' is also a condition for the loop, this snippet of code finds a leaf node in 'tn_root'.

Yes, this is a classic tree traversal. Assuming the tree isn't
broken, the loop eventually terminates when it runs of a leaf.

The real issue with this code is that this is the *only* exit
condition of the loop. The traversal loop always branches until
it hits a leaf and the function then returns NULL. I'm pretty
sure this might not be the intended behavior.

Greetings,

David


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
