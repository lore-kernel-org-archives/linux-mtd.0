Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BBAC433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jan 2022 07:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gVE4V6ASbVQSXo2q8lsDMOQHtKS8cQPc0wgyVPfAJWc=; b=nQtM98WNpltmm2
	koFoaUq8Sh5RF5fXlPU2FB62FQribpVz31KLzLiklpqSGzY/VZnz9iv2lrPTAL2gh5H/gqsiheILD
	m1WYQ87pWqRN0+/c77sY/zbf84NBI5Q+JiXmDJ8zT9eZUjPO67wLNqHpkNcA+aaVBOeqW2Q5rDnAa
	3PKq0oT7gpwDoOtN3aD9SaoMCODjJom45i4pbzGIUIJnBjhLYG5+qQuGfjcnpODIDMVHLi0uQLhHq
	ru2yT9m9W3ufWyxgxzUIN31sxESMjbFC76+045goASYxuq38jWEMopAB8O903f6nnlQ7YLhaSkJD5
	hXhupwl0IhX9SfwEdZtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Bs2-00FAP2-Ev; Tue, 11 Jan 2022 07:47:06 +0000
Received: from mail.betterbiz.pl ([45.86.209.138])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Brz-00FAO1-Q1
 for linux-mtd@lists.infradead.org; Tue, 11 Jan 2022 07:47:05 +0000
Received: by mail.betterbiz.pl (Postfix, from userid 1001)
 id CC4CC82CEC; Tue, 11 Jan 2022 02:46:04 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=betterbiz.pl; s=mail;
 t=1641887221; bh=07NAgW1e0WiNB9zqagiM2BnwZfWBCpNa2E4+ccxBPgw=;
 h=Date:From:To:Subject:From;
 b=opHrEKrK4UEG7MUu9xL4F9citl6usQ7ThGZvoxL69fNOwJaGhpX6ML/IslBh/3Irj
 J3C5XGWmvO4iwSZeljA4ySt+scC8y4roE6vyPf5LChvcvir1RFmGxVT8/jhjy839Ii
 OqoQySE4ZkyoTfKqYFvVbYJCspFneit6ybkNg6fMUb06Bmy14bYxC1l9isnQ1VzlUg
 sdOtt0FJGQf0Bv3Lialgc6MHPSWoLloGBHf/9zny9yH9T0A9YC2TjrlrIRMX9wcSnD
 bBQW8WoLJdgBDC/8ncZEcJ5YV+j/Za6KSp0Aycq8Wff6CrA38gkdkzlgpbeW2PCQ7i
 mRD0FmRcCpmKg==
Received: by mail.betterbiz.pl for <linux-mtd@lists.infradead.org>;
 Tue, 11 Jan 2022 07:45:59 GMT
Message-ID: <20220111024500-0.1.o.10mv.0.g02djjerbl@betterbiz.pl>
Date: Tue, 11 Jan 2022 07:45:59 GMT
From: "Jakub Daroch" <jakub.daroch@betterbiz.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.betterbiz.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_234703_898228_16E6AD06 
X-CRM114-Status: UNSURE (   1.96  )
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
ZmlrYWNqxIUgd3N0xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0sCkpha3ViIERhcm9j
aAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
