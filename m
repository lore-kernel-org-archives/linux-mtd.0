Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974ABC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Dec 2021 08:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wkg6+ro4x5E/Dg2qEmMvVi/b2ehztjWjwZmaE2V7llo=; b=Z5tiufL0BaspIb
	jISzvgjG9HwkfY/NvWZRMXAPJT6w5UV4JqxsFs0/jfcrQ1WWz0SQTBrn7dyWYw6wIUeqlhdfoy4AE
	Rgv1exXCX72qftKC8bbZPn7wxdBERfr79mSMQwi6kxnACljaNQWsh8ys77CY9t+CzuzpX5wNSRrZV
	1KswXcbat64gVCAIww61ml+93wK6g/7MSm0gEScOgKnz1GSK4wayqihHzhbjaP9ypWilUgbj+yop/
	zaNs0aubdHFrGSLmCR0cnzmhD8ojUGn7wTmj8T9WKT38+kUXr+d0C7ZFG/ocrnpCQWUpMhO4CD613
	MI2lDJS/TKiAwgk+D3UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2r94-0043f1-0T; Thu, 30 Dec 2021 08:50:46 +0000
Received: from mail.portyid.pl ([192.36.61.58])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2r8y-0043MW-Jm
 for linux-mtd@lists.infradead.org; Thu, 30 Dec 2021 08:50:42 +0000
Received: by mail.portyid.pl (Postfix, from userid 1001)
 id DC353412E0; Thu, 30 Dec 2021 09:50:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=portyid.pl; s=mail;
 t=1640854212; bh=RZjfFpT9KGSFHXuIOzTjcb+Gwkun4EXriv7y2I0PG0A=;
 h=Date:From:To:Subject:From;
 b=pnnOEstV5qzwflkyUEaT7lw8DCQy1I0s+sdHcZQGPqfP4ztF6InISMkmiCi2xLBQF
 D9NNGdQb5qXICDg2u9il1MA3/AFNWkGL0lrvhBai26+zE+ZJlrsC7umb7UxbIp6xqY
 xoHsNCBuV47IT6zYIQYkaWWXdTWmtJ2j609ZEyyxhZdt2RqNH1i4xp+USHIdyY2NnF
 oObMIHH5SHzWM/4vly1m2XUgMhQHd7gc+J39Nx0PcxuecY4/Q2d/BKXTyjFaxBJfaX
 zcGrjHopcHXov+M6ADCdDOeObfeTWyjHFtsAln0fpiUgS15tO/ztT1J7We/H/ZhkrU
 4g3W8yHTQgB6Q==
Received: by mail.portyid.pl for <linux-mtd@lists.infradead.org>;
 Thu, 30 Dec 2021 08:50:12 GMT
Message-ID: <20211230084500-0.1.x.30hc.0.4tdvgudao0@portyid.pl>
Date: Thu, 30 Dec 2021 08:50:12 GMT
From: =?UTF-8?Q?"Pawe=C5=82_Jasi=C5=84ski"?= <pawel.jasinski@portyid.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.portyid.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_005040_843956_2D08A351 
X-CRM114-Status: UNSURE (   1.86  )
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

RHppZcWEIGRvYnJ5LAoKZG9zdHJ6ZWdhbSBtb8W8bGl3b8WbxIcgd3Nww7PFgnByYWN5IHogUGHF
hHN0d2EgZmlybcSFLgoKxZp3aWFkY3p5bXkga29tcGxla3Nvd8SFIG9ic8WCdWfEmSBpbndlc3R5
Y2ppIHcgZm90b3dvbHRhaWvEmSwga3TDs3JhIG9ibmnFvGEga29zenR5IGVuZXJnaWkgZWxla3Ry
eWN6bmVqIG5hd2V0IG8gOTAlLgoKQ3p5IHPEhSBQYcWEc3R3byB6YWludGVyZXNvd2FuaSB3ZXJ5
ZmlrYWNqxIUgd3N0xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0KUGF3ZcWCIEphc2nF
hHNraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
