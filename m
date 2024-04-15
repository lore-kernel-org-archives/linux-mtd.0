Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A372C4345F
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2024 16:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qQTF5WZfli7rPcYZbaNkhwAdHXBdGeF+RlCPiXbR+ZY=; b=lH7L+vJrbO3Fl/
	PZtPBLFjA67aliBlC4qIi0oEonncOEpIzfrBy3EW9YrcLBYYqb//kLoBdREmbKlnRf7uVm4d0PSwH
	l5P5T8qyVrrGRxYZ5mYZ8aGBtUtDv9IJm0MyCI/JPHTrA/qtNs9DQcY9KHo5Ew2fwhyc8QWtezImk
	xGvYHsgmkKgiivsUuDbU2i+bL8HrQUh9y9tOJ7n4Un+KNEYj3kXSMdLEgJ/bjrAUy6/CZ52F+KgL/
	3HIEc5ro09f+a5Xx11EQPIr1oceEMzmC3wopSKxbJTyfffpF/fI2OrmZfs9rq03f1Csr3yRsVsB21
	BgtcDJEGBhAH10EY0btg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPXe-000000099Dj-1zAA;
	Mon, 15 Apr 2024 16:50:50 +0000
Received: from smtp46.i.mail.ru ([95.163.41.84])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPXY-0000000997l-3qYw
	for linux-mtd@lists.infradead.org;
	Mon, 15 Apr 2024 16:50:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=elkcl.ru;
	s=mailru; h=Sender:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To
	:Cc:Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=fU4Jb+HjcUIRnkvmA6oZd00NQJEftaoLs9sEK5mizZM=; t=1713199831; x=1713289831; 
	b=TjqeWsC3yMPABFPvzpQ0U2xlJ6iN+7y7V+mmbbekAb7s7Qxl1unP8OOHZTC+VYCNISYt0YGmZnT
	SFc7rAXk1dBS0dCcN7KM7lSMm0AAhDFE0+VNthwLGp5n3spW4iKJI1HB+CL2VXGY5qihk68dz4SS9
	TmkUzMNHHaq5YEDtChM=;
Received: by smtp46.i.mail.ru with esmtpa (envelope-from <pub@elkcl.ru>)
	id 1rwPXH-00000000gYc-2w35; Mon, 15 Apr 2024 19:50:28 +0300
Message-ID: <74f2b16a-dd48-4306-b28b-ad5ba77d8bfe@elkcl.ru>
Date: Mon, 15 Apr 2024 19:50:23 +0300
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH] jffs2: prevent xattr node from overflowing the eraseblock
To: Christian Brauner <brauner@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger
 <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>,
 Fabian Frederick <fabf@skynet.be>, Nick Desaulniers
 <ndesaulniers@google.com>, Wedson Almeida Filho <walmeida@microsoft.com>,
 KaiGai Kohei <kaigai@ak.jp.nec.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
References: <20240412155357.237803-1-dev@elkcl.ru>
 <20240415-anspielen-gelyncht-d2f0efd6569e@brauner>
From: Ilya Denisyev <dev@elkcl.ru>
Content-Language: en-US
In-Reply-To: <20240415-anspielen-gelyncht-d2f0efd6569e@brauner>
Authentication-Results: smtp46.i.mail.ru; auth=pass smtp.auth=pub@elkcl.ru smtp.mailfrom=pub@elkcl.ru
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9D327C87852EB66D31116567C8E3CFDFF0E1C6585A2586D0D182A05F538085040B179075AD4DF425F3DE06ABAFEAF6705DB7E7932B9893A00AA6517558154513EABAB3F2802300857
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE70A10A23A3B64B805EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637B24541F05F0BFC9F8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8E0CA407E709CDC0B2168C34F444F38000FFCE30886D58649CC7F00164DA146DAFE8445B8C89999728AA50765F7900637D0FEED2715E18529389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8062BEEFFB5F8EA3EF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C17119E5299B287EE03F1AB874ED890284AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3F841116EA1ACDE45BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE788761406820A3098731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5CF9135D71564AE835002B1117B3ED6968B55D18063B74FD2FB820E9FE7BD014C823CB91A9FED034534781492E4B8EEAD2609375A3A81E2DDBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742424CF958EAFF5D571004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D34C1E32F4AD4B2486BFADDC33E07DB661C86FD219ECB6969EA373161ADC8ED28D39A2BF46180FC39FC1D7E09C32AA3244CE12BF5A6A205140D77DD89D51EBB7742D02FDEF4547DCF12EA455F16B58544A20C45C0626CB26EE85DA084F8E80FEBD339673C7991D68BBF964550E41902C4E4
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojOezlh5vAwsobvGokhiVzuQ==
X-Mailru-Sender: 7971DA0162A9842A75A8A63AE98D4FF4B1116962D713EEE2F7A6B01B8567BB205D9139C693FB2D64A3EAC56F6A374A44CA0B8C118E355A7C54A42CAEBACFBF7EF55A8A299F926F354FD7C49A7833DCB4162D03413E14ADD05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_095045_226029_6630EE62 
X-CRM114-Status: UNSURE (   7.32  )
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

On 15.04.2024 17:28, Christian Brauner wrote:
> Can this overflow? I.e. can c->sector_size be smaller than c->cleanmarker_size?

I'm pretty sure that it can't. As far as I know, c->sector_size is at 
least the MTD eraseblock size[1] or even bigger in the case of 
DataFlash[2]. The cleanmarker is either the size of the smallest JFFS2 
node[3] (currently 12 bytes), 0 bytes for certain flash types (like 
NAND, where it's stored out of band[4]) or apparently at most the MTD 
writesize (which, as far as I understand, is not larger than the 
erasesize) for Intel Sibley[5].

Considering that any JFFS2 node must fit inside one block and that the 
cleanmarker is the smallest node there is (if it's even a proper node), 
it shouldn't overflow, otherwise JFFS2 won't work in the first place.


[1] https://elixir.bootlin.com/linux/v6.9-rc4/source/fs/jffs2/fs.c#L539

[2] https://elixir.bootlin.com/linux/v6.9-rc4/source/fs/jffs2/wbuf.c#L1253

[3] https://elixir.bootlin.com/linux/v6.9-rc4/source/fs/jffs2/fs.c#L557

[4] https://elixir.bootlin.com/linux/v6.9-rc4/source/fs/jffs2/wbuf.c#L1190

[5] https://elixir.bootlin.com/linux/v6.9-rc4/source/fs/jffs2/wbuf.c#L1296


---

Best regards,

Ilya


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
