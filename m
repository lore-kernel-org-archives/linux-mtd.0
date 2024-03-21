Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3809BC54E58
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2024 08:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gGRrouJCW8hylaTdRjlp1U8wHthJmmKutO2AH1zIuIo=; b=Yl+REOeeRslAxm
	cnXXRv0kaKKTMnI15GgDfULLAoanB6vu3n52p/THVOx3BRnjeLL2h1qjaA3Er6bXI1GmNeGHs0mc4
	VWe9ejrdtHL6OYqrjJMyPmwA4vBqPvLzUqIxQERfbY4IEM1J/xSedDi62Sx63RtxT6i+cEnQeiqWX
	NlCtrq+7AXI2/pwEHEOeL9J1Albh+SQg72B2ilcktRnftW5C9KRtNRWemXzHOYL1TsMWwjIc2vA6W
	hqYX51aYhWoy3coQO6trpWt2b4/jpu6DwEGeRTUOpnMYd6QUV29YqmIdU6hmxomdzqOHyLegLM1lu
	c8uhgwxIqL15FfMIJjQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnE4W-00000002NBJ-2QHs;
	Thu, 21 Mar 2024 08:46:48 +0000
Received: from mail.haughton.pl ([195.231.81.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnE4S-00000002N7x-3lQi
	for linux-mtd@lists.infradead.org;
	Thu, 21 Mar 2024 08:46:46 +0000
Received: by mail.haughton.pl (Postfix, from userid 1002)
	id 51B5182F94; Thu, 21 Mar 2024 09:46:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=haughton.pl; s=mail;
	t=1711010803; bh=+oYP7ZwnEeonL1pLtE73TJ85xaesKIG0Ys99vCW5hiU=;
	h=Date:From:To:Subject:From;
	b=gVDq10Thfu1d20EhVbfFyRyG54EW5TgFI+yE9wU9y02UybUMD1TcZe89/H3w/H5WA
	 u/K92VTivUz+B3QE1kO6bg5SzxdZrtLCnwLTvE5qcgAzMRzh0GHNOZkQdpabtzhivL
	 1l5Tsvv5ipQ1KynwjOYp5AsUTSlzpKS3mIFuXsEFVd2zoDbY8BJ/zVdTuz/uXLIRAt
	 F6p3Fh7yGpLm7wEobzL/GO47ocI1FpbAjDuCeqWIl4jrrVWQ+At65OQ11WR1mGZSyZ
	 9BIm2P86Q4FKB6ItFVxh/YnjfOMmwQbgz1AaO1jrm2/6haZxNSfkYDqyJs3lKhtwCz
	 hUEY1Isc9DJ/Q==
Received: by mail.haughton.pl for <linux-mtd@lists.infradead.org>; Thu, 21 Mar 2024 08:46:21 GMT
Message-ID: <20240321084500-0.1.16.bq0w.0.xrjn2vax3g@haughton.pl>
Date: Thu, 21 Mar 2024 08:46:21 GMT
From: "Patryk Wysocki" <patryk.wysocki@haughton.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.haughton.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_014645_137724_D0884B32 
X-CRM114-Status: UNSURE (   2.12  )
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

RHppZcWEIGRvYnJ5LAoKUG96d29sacWCZW0gc29iaWUgbmEga29udGFrdCwgcG9uaWV3YcW8IGpl
c3RlbSB6YWludGVyZXNvd2FueSB3ZXJ5ZmlrYWNqxIUgbW/FvGxpd2/Fm2NpIG5hd2nEhXphbmlh
IHdzcMOzxYJwcmFjeS4KCldzcGllcmFteSBmaXJteSB3IHBvenlza2l3YW5pdSBub3d5Y2gga2xp
ZW50w7N3IGJpem5lc293eWNoLgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHIHcgY2VsdSBwcnpl
ZHN0YXdpZW5pYSBzemN6ZWfDs8WCb3d5Y2ggaW5mb3JtYWNqaT8gCgoKUG96ZHJhd2lhbQpQYXRy
eWsgV3lzb2NraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
