Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58DACD6E43
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 09:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hzj1jj7fG/JaWzxf8xyA9gMkhdMk3TmsMajfwvdk3+8=; b=B8pw/bFEF47MkPYlbcV/hiIU90
	uFTEGS25RpQYZ517I92jRYooHQuW9fBNNWoFQE6iP9eX6HOtByi0DZM51IbTn36ZgZj6VqCnLzLtK
	cn3VH6FZDpiFueHn4snNtpcasI9nhylnfrwsC6VY4HCWFRRUYoP/qr+NlIX/nNFl5pNS9YcDHNjsA
	eoeuJ1PleFP4WrsXe2vac65qO4VUW4o4EZFwjVMt5zr48Lh6s79EgmEbuk3GMwWMm8hIwZDwO9P5z
	2eOh+kcKSw3vuqw5B8HPACBXg2dB74hvqeU9av3OLKVR4ujzUAZGjB83VWMKbYrrH5Ao2aKGegcFr
	/NRxCndg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAfA-00000003edG-2s1o;
	Wed, 27 May 2026 09:34:56 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAf8-00000003eca-1fIH
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 09:34:55 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1F80B14000B6;
	Wed, 27 May 2026 05:34:53 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 27 May 2026 05:34:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1779874493;
	 x=1779960893; bh=S9YlJzsKcVvZ1lUPJ+PugHZmYhkA+/elOtZQeUcnhXc=; b=
	hvZM/n/MuiLWuGM5AHBEd9X91319fH/Z6kDlX8S704Ac/0/37Gcek7xo02nxRcdE
	QRvxgh58vItip44J+VsTMdGPZgDwh/HWq0aX7LoyDFvxHqdma680AlrNC9CGf8WO
	4nECootn/f+tyj3DYHMAmKikchU533jWhmGZvsDhGdShGtZF7ZnV9c+vIbtlUb4l
	Ej8M1WyKGrcigiNtrEerkZfDdH3sgJEF9YwcMZI6S1u2WOyA/Fx1nKuzFrjv0gIc
	+qAKPzyN5QRAkkC9k6jNtin3G7YQ8FDHm99NTI1uqTAyS7b8x02GlVU2sm/VzAKW
	wF7buDqM84saxUuiRD18rA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779874493; x=
	1779960893; bh=S9YlJzsKcVvZ1lUPJ+PugHZmYhkA+/elOtZQeUcnhXc=; b=s
	FjOCOg8r7iho4PbSlHXAs5QhJAPXGR05seGmpgUtZg9lIDEuipDhEANIYNMjO/8C
	nL5S40jMrBmrpyLbfey9m5mUpRj9YliqbIfTvMXxREn3a38nyyTEmvC8j9feO5RC
	dTk7xVEZ98yTH9kooURgnGYi/MG5GorqBsHxx4tuQG06ZA4OoU678nnnS8M3Yc1W
	/c5R7QUEBhtoYZI2cVY0f924+YqNmYeuekyh2v8A2P6ALUWGSPzLx5KXOYZdgw/q
	OFrLhdNq38Ed+bVYZ4TKOMn4O5qIJCz9WroVAVqgHKRgfp/qIXkM/ILkDoR1thoe
	ERgrzgqUIYb9IJlHAwerA==
X-ME-Sender: <xms:vLoWarCt3ljYfoJPvMYLG8gBxh68mNhGPSP6eZqMmHxLSvGxDaJv0g>
    <xme:vLoWasXnqoCr-S1m0KPRlyTBJOW6d9snV8kEfBFDr9lz6aNI0DWLS8Dl2cRWv_ZXd
    8aFUlBS0xF0ozh8LcWm7qNztoK7q2wO88_dKExYrsNOWWMrGS5OrCU>
X-ME-Proxy-Cause: dmFkZTGs/eQA4UV6bVk8Ubl0C7Mne/LKfc8mnqdK2jE+zgEL7AK5PT91zwPjWuvdt0N/bB
    dOnx631CcPksmLLbb6QjlIBHHM5HL7+3JjAInSUjApFdr995/m3ChS/r6J02MKZBiEK9IH
    qKfXfv8T2gJ1xkEpWWDQatYS/J0gfC8cYoG3XI4Qr8vULh5Ad6F80S9E9Tr5M/E1BBoP5s
    UGXtO6DzSCAj+bHeXN6le/68FGEts9qXQB97ZyZv985UItCcCG2tGciqYtqnEg/BMHAZFk
    f2Zfv9MczP8kTi9j7L1H36O/oBIqrOIxhLphjKM8PeDhlMIp1XJgBg7ilUZYZXKeG8n7Rk
    z0LncfjODOJS7XrenvvGU2h+4B9KHk1khHVUAx0m/E4Ft8THcfFuxu6KoanRUOaiB59sc4
    bAgbVemJ4/f3Wjhz/58XbMmFxBLirnlTC64aJZkzIV8wIU3Si+P/DqVVCYtMBSCJgdBoyd
    o+kU9SlYUqNNAbKgbU2Vq8RNLkVJWG2XPInZ0ruvKwv+kcUuJu3kFB3ODXr+jsntJoYDht
    LDpDf/BprI4nXumchHBRLEVSlfZa25qKvFfPOYARWy3drmZKRFJEIjbGeYclhByOXGcZk1
    mn7go+mMcTpcVqXJDa0Uu8WZJ63DzZwBaTYophl0KabmZuVclhRyNpyPBYKg
X-ME-Proxy: <xmx:vLoWalywHuGEwNnh2bLmwrGgP1kysHRuXm_-4E_SGFhonQXVlhjTAA>
    <xmx:vLoWan2fB_w08cIM783c8ytM4xVBqWi4P0GQO3eFE_PXiiTYuCS2Bg>
    <xmx:vLoWai8L4xytgn5VEDicOgerRvByLBaCQ3hvkdkpipoqhqGb95EPJg>
    <xmx:vLoWanqymGd7B5vtl9esz8T23rGawKL3Sb9-hn8DoawlIEYl4mSybQ>
    <xmx:vboWalNLXFhANTrnGIaZhT2Qwa-FDGnC4Dbw3QP2uMBMO-DwCtHx4ZTQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 10C58182007A; Wed, 27 May 2026 05:34:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AwzDuXPgpp8N
Date: Wed, 27 May 2026 11:34:30 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Randy Dunlap" <rdunlap@infradead.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Message-Id: <6909a1ef-355b-41a9-9ce5-ae0c9c993b25@app.fastmail.com>
In-Reply-To: <87fr3djjhl.fsf@bootlin.com>
References: <20260526103227.3152003-1-arnd@kernel.org>
 <87fr3djjhl.fsf@bootlin.com>
Subject: =?UTF-8?Q?Re:_[PATCH_1/3]_mtd:_maps:_remove_AMD_=C3=89lan_specific_drive?=
 =?UTF-8?Q?rs?=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_023454_506807_3183F6CB 
X-CRM114-Status: UNSURE (   6.54  )
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

On Wed, May 27, 2026, at 11:21, Miquel Raynal wrote:
> On 26/05/2026 at 12:32:04 +02, Arnd Bergmann <arnd@kernel.org> wrote:
>      3 files changed, 469 deletions(-)
>
>
> Is it okay for you?

Looks good to me, thanks a lot for rebasing the patch.

     Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
