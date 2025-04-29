Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8790C369CB
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Apr 2025 07:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jahZiCGCQz3stF6U8MRGqLBRws+FL013FkPsBeuWaRg=; b=w7UGRawSR0PO5N
	AwhrdjwIBT4r/Fpie3biqrHWCCv93olWPzuWFv8rw1nepZ5J338lboHW53g7UGp8zSbHEP8C7xIO+
	fW2uWwjX0JfBwy0HxGMnBXS2ABCobkVggRd76+lW4QxczHNsct8bbQqe+vW5mJOq8l/XHujt7zLn8
	pOQ5duTD4XruGGFnlCvnGUPbpe0A5yt+pB5yu+kuyGWpOW62j2Jy7LTOiyPAps1hNyTkfjMsxd65/
	6pCZuNpF0kk0SzSf1DJnYfkIqvrfPwme3fHsQvePvjIPOU3Mf7jAqgC04ReNgCQc4DLo1hLO1+fHR
	XOK6fiaUtzF3G5XQX+Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9fOe-00000008ksE-2OUB;
	Tue, 29 Apr 2025 07:28:52 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9fJT-00000008jl0-1Bil
	for linux-mtd@lists.infradead.org;
	Tue, 29 Apr 2025 07:23:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0AFA439CF;
	Tue, 29 Apr 2025 07:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745911406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MhKCWuFVwH1hHKekt6v1rdT49qbUO4WZ7IDJ35etBfI=;
	b=U3auC4MkFKxqBoIXWhrDbWzpqYrdCu1xXAW1S/vyLJAVTKTfiqxY3NPU5EWUyvCfSJgOau
	9fYEjDPjRqINC3p+HPqAWg0KBVNBYkSHg93+eOaQrvRDLQ3tROkpTiXXdoggWSeN4NMlWb
	OR+DhzZH5SdAIWibj4YebT8L6reRIV0bOXQmT6BSkYgon80KDtm7wsNQFOnIvjqdGzoL4A
	lNgWZ7EQS4bem22N09kJNsYHYiV78I4b9IHtc3/ivjYksBTy3mYVNdFW0saPgYP2hrNLiY
	PMvWug7ZC5jUPu64qMfwPnx8O3C9GgPltLIoLChMk0NUGkKMfdNopaL0/RntQw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>,  richard@nod.at,
  vigneshr@ti.com,  broonie@kernel.org,  absahu@codeaurora.org,
  bbrezillon@kernel.org,  architt@codeaurora.org,
  quic_srichara@quicinc.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-arm-msm@vger.kernel.org,
  linux-spi@vger.kernel.org
Subject: Re: [PATCH v4 1/3] mtd: rawnand: qcom: Pass 18 bit offset from
 NANDc base to BAM base
In-Reply-To: <bsj6kvqjo3pfbsakex5quamk5tkrtigxdcoyu5bj3nt37zsgc5@7h7zidzbcs7p>
	(Manivannan Sadhasivam's message of "Fri, 25 Apr 2025 13:17:54 +0530")
References: <20250410100019.2872271-1-quic_mdalam@quicinc.com>
	<20250410100019.2872271-2-quic_mdalam@quicinc.com>
	<bsj6kvqjo3pfbsakex5quamk5tkrtigxdcoyu5bj3nt37zsgc5@7h7zidzbcs7p>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 29 Apr 2025 09:23:24 +0200
Message-ID: <87selrv3bn.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieefvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledvrddukeegrddutdekrddvheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrddutdekrddvheehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehmrghnihhvrghnnhgrnhdrshgrughhrghsihhvrghmsehlihhnrghrohdrohhrghdprhgtphhtthhopehquhhitggpmhgurghlrghmsehquhhitghinhgtrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtt
 hhopegrsghsrghhuhestghouggvrghurhhorhgrrdhorhhgpdhrtghpthhtohepsggsrhgviihilhhlohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhgthhhithhtsegtohguvggruhhrohhrrgdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_002331_451472_754031C6 
X-CRM114-Status: UNSURE (   6.56  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjUvMDQvMjAyNSBhdCAxMzoxNzo1NCArMDUzMCwgTWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxt
YW5pdmFubmFuLnNhZGhhc2l2YW1AbGluYXJvLm9yZz4gd3JvdGU6Cgo+IE9uIFRodSwgQXByIDEw
LCAyMDI1IGF0IDAzOjMwOjE3UE0gKzA1MzAsIE1kIFNhZHJlIEFsYW0gd3JvdGU6Cj4+IFRoZSBC
QU0gY29tbWFuZCBkZXNjcmlwdG9yIHByb3ZpZGVzIG9ubHkgMTggYml0cyB0byBzcGVjaWZ5IHRo
ZSBOQU5ECj4+IHJlZ2lzdGVyIG9mZnNldC4gCj4KPiBzL05BTkQgcmVnaXN0ZXIgb2Zmc2V0L0JB
TSByZWdpc3RlciBvZmZzZXQKPgo+PiBBZGRpdGlvbmFsbHksIGluIHRoZSBCQU0gY29tbWFuZCBk
ZXNjcmlwdG9yLCB0aGUgTkFORAo+PiByZWdpc3RlciBvZmZzZXQgaXMgc3VwcG9zZWQgdG8gYmUg
c3BlY2lmaWVkIGFzICIoTkFORGMgYmFzZSAtIEJBTSBiYXNlKQo+Cj4gU2FtZSBoZXJlLgoKSSB3
aWxsIGZpeCB0aGVzZSB3aGlsZSBhcHBseWluZy4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
