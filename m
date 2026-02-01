Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B66EE65298
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Feb 2026 19:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sQdBQls1MKWHjMpkg7v7fskssducuTlEWzW5y9dWQJE=; b=KJYPmljOXNOFd9
	eX0DhZII943MTFXaIj/859gZqK2yIGIz2CbpTOV72StAp4s5XXwcd9PkrL3QoLhXDWGJEykzdTbKi
	yNu39zLZ3AhRQ7Mj98s9/5FN+nILVErEjN/Et6OV2zfdZXrPrxIRcb6xcxNCDe8zWT44GLiRi2fSs
	/rZQAaIvS8S80BERk9BZ1IFYqwaqPAIqijRwaBDyEuwyvamDrgC7Uj7JkjO9+mxdTs1MqMNHpD+cO
	9H4qKwiESLhyWAT/VB8u5qUjOFz0YeJeCEW9yVvR/TfeiTe8tOYzTVxUXsqxSB2ZB3hkiUlGwk1Iq
	g/t2WKxfhConhGgbmNmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmd5B-000000047Oy-3MAD;
	Sun, 01 Feb 2026 19:26:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmd57-000000047Od-0LDw
	for linux-mtd@lists.infradead.org;
	Sun, 01 Feb 2026 19:26:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 845D6402E3;
	Sun,  1 Feb 2026 19:25:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 971F2C4CEF7;
	Sun,  1 Feb 2026 19:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769973957;
	bh=bIDEY5frNolusbVDWxt6oMlaQ4LE9aJ4Oaroe+96lXk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Zq5BCUNbYCAzHaa5wrT3MdNU+9RFSYJeO7UZeXcwbEp7zyHF+2k2JcBdgzoknG3zp
	 w5/I5/emRVdf8GLHU5xp7h3Gs4POVu9bO1iy+OcTdgey6hpjRxUGihN+i57Ag5YUq6
	 HnTBUJLd1YHmZ2P7m1U69tK9tqLCZZ5Z/5Im8FwE/tNBYHD6XtlJsKuKA4NRieWzoe
	 mSh5nUj8x7du116o5c3TeJ4jE9y4iT4ud5NytHuPY1+NYMx2AjfeeZ43c7yJXT3BXO
	 pwXV3RVPC63d6fVsPveYMQ9rkMOAgz0L7zZlX5inHRFhQdrciB9yRCCz71GW18NpvU
	 qdyuK+fwiWdQg==
Message-ID: <aa9d982e-1a69-48b4-b9f4-16584aac9924@kernel.org>
Date: Sun, 1 Feb 2026 13:25:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mtd: cdns,hp-nfc: Add dma-coherent property
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Khairul Anuar Romli <khairul.anuar.romli@altera.com>,
 Rob Herring <robh@kernel.org>
References: <20260131172611.28807-1-dinguyen@kernel.org>
 <20260131-pasty-dicing-4ed7799aa546@spud>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260131-pasty-dicing-4ed7799aa546@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_112601_147415_A968B1FE 
X-CRM114-Status: GOOD (  10.83  )
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



On 1/31/26 14:26, Conor Dooley wrote:
> On Sat, Jan 31, 2026 at 11:26:11AM -0600, Dinh Nguyen wrote:
>> From: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
>>
>> The Cadence HP NAND Flash Controller on supports DMA transactions through
>> a coherent interconnect. In previous generations SoC (Stratix10 and Agilex)
>> the interconnect was non-coherent, hence there is no need for dma-coherent
>> property to be presence. In Agilex 5, the architecture has changed. It
>> introduced a coherent interconnect that supports cache-coherent DMA.
>>
>> Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> 
> Why does this v1 have an ack?
> 

I respun this patch based on the mtd tree so that the mtd maintainers 
can take it. I had originally applied it to my tree, but avoid merge 
conflicts, I'm going to submit it through mtd. This patch is the same as 
this[1].

Sorry for any confusion.

Dinh
[1] 
https://lore.kernel.org/linux-devicetree/176488419217.2206248.9983976146883123306.robh@kernel.org/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
