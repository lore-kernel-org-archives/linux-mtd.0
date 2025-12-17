Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF5CD6552C
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Dec 2025 10:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bn/vUyX4Z4RlHQlUsQhviCldScRj/xXmVlOkvUe+eG4=; b=qZG//ONEcBVKdh
	RRMAx/WI+DSY4CbmWZ9Jas2dWxdv0T6fRbegNH+7f9VEWwYPjSENhwZ3GdYsrcFwJS4BIFL0L/niG
	VE7/hITG5sPN6uIsmS7I+PLCwMFnQj8BPm7Jrdep2dKXB0lkPCGGuft1CpsRMcKJjs50228XUIZsr
	PIhojGWUyTYBgwLyLRk+d4DxvS0lwnaXE0F3Nn9DxGZLmAIJaYjkOArGWhIO/KiD0429n7v8K/MQV
	sDwkqVMKknzm7CH0ZIcv7bVgcWY88Ljl93OD+2ZsX/S5FAN3Z5B6ADbmieIa5BJx0gO+d6zUMzLR1
	oMZQjL93JIAdEN8JopNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVp2M-00000006ffH-08wo;
	Wed, 17 Dec 2025 10:45:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVp2K-00000006ffB-0Zzq
	for linux-mtd@lists.infradead.org;
	Wed, 17 Dec 2025 10:45:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 24C0F6018E;
	Wed, 17 Dec 2025 10:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03876C4CEF5;
	Wed, 17 Dec 2025 10:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765968338;
	bh=AVUg2eXMFGByY023i/MJH+I7Cv8+X+oAHX7+mxdIRIk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RD0aOBwjc4u+WzSxiaX087/ZGGqPi7278kJoholQUd26OQ49RxRCW4TYz/VxYkNh8
	 yQSeutOlpwdq+RSMPa+aa5I5OYMYygUxG6YC/ltzfdj8Bfc3kCfkPP2v9mCVtH8QhG
	 dPTKCxI7vP3uUnVpgzCAqShcaa7pg9tibuK+kB9uDoHslvpnItbiSq0cK72dyKYP1/
	 3zqywWp26+d/Yz7ZKE4tgNuzlC3hbKToDLxTXyWLdTeObgmzCJG78Vw8wr0zRH+QZi
	 sqazQyNQdwwOKTCtO09l8egMnmg/jaSZ25S7kiIBJtZQihHSBGl9UWZbI4he9U/CH8
	 flLTz2vFrTrlQ==
Message-ID: <6475226a-0291-485b-af93-054ed3cfe664@kernel.org>
Date: Wed, 17 Dec 2025 04:45:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add dma-coherent property
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Khairul Anuar Romli <khairul.anuar.romli@altera.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
 <vkoul@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Niravkumar L Rabara <niravkumar.l.rabara@intel.com>,
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <cover.1764717960.git.khairul.anuar.romli@altera.com>
 <e1aae851-4031-4b5c-a807-7a61ecfe6af1@kernel.org>
 <877bumsv3q.fsf@bootlin.com>
 <f1948d54-2e27-44ca-8509-ca16f9b792fd@kernel.org>
 <871pktscld.fsf@bootlin.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <871pktscld.fsf@bootlin.com>
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



On 12/17/25 03:05, Miquel Raynal wrote:
> Hello Dinh,
> 
>>>> Applied!
>>> Have you applied all 3 patches? If yes, where? It happened during the
>>> merge window but I see nothing in v6.19-rc1. I was about to take the mtd
>>> binding patch, but if you took it already that's fine, I'll mark this
>>> series as already applied.
>>>
>>
>> Yes, I took all 3 and staging it in my tree for v6.20.
> 
> Noted. If you happen to rebase your own tree you can add my
> 
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> 

I'll do that.

Thanks,
Dinh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
