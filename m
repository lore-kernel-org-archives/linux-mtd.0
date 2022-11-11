Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988F4C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Nov 2022 17:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Date:To:
	From:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EaIXpD5cew8Pp/o1Xpi87JcfBlQrx8nO19WEMyBw0gE=; b=np8PnjlIfEICbO
	YrYYIlJWzwU20FK/0lpHxoH2GsAR8il9qPiSX8AbbF3W/p5lhJXVW5szFKd4WGU4qjVvXnngsPUaO
	z5JfEXIox45/OeRufSWdFSVGiNKbQbrKHt9LxNrPXz6knYIZ5u99SQv3kWgJmfZbGybZdB+eH+HmZ
	MwQuKlm3SkkF1TUfkl++vumc7zjqqzi3wTM3H0rHSFlnsTp3wFdEeO7S4z3qeM9jQgACaEK/zewbf
	mlUG3efeI7JkniU29/BHBwT5MJJLB4ROPn4DiKyIX3QJa2cKw0CaBbej3CiiZr1FDcy8xMPHaNKV0
	WHCKdCbNMlrWDOGuPHQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otYHa-00HW1z-3m; Fri, 11 Nov 2022 17:57:38 +0000
Received: from present.status.customizedparts.de ([193.9.45.199])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otYHW-00HVzg-OR
	for linux-mtd@lists.infradead.org; Fri, 11 Nov 2022 17:57:36 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=mail; d=Present.Status.customizedparts.de;
 h=Message-ID:From:Reply-To:To:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding; i=Leo.Soders@Present.Status.customizedparts.de;
 bh=hzhEHetQtu5A/+iy1gMc3XXtHKE=;
 b=GgTAKiWWF1HlRbvlC5VQ73ukwGtVHmjpI858xEtMzs5cBYTqwPrYssSSw0RRGV4Fg6dUZiMdjDkK
   JIsOLSK6oPufjez8CvGpj1TLjCBqynveX8Chgvn/oe/N8SwMrc7O7n2ILuAhYeA6+hraDvT855lb
   IxwzjPWSz5mTyBwH2TM=
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; s=mail; d=Present.Status.customizedparts.de;
 b=JUbCfDBV51RY8dpUg0gK1PTNvhj8voINngKIcXuGZPB6q6DXycBgaO51D/ozxHIRpE+BEWI3Z/3u
   n1m6zITTt+qjTXzT3iqCHkSW+4c9kQ898OqBLTpRnAFJM7Ia7zex7g5znXIRbsbXt6ymvzfL+6u1
   o60XgaF22Gpy/oKbdNA=;
Message-ID: <00579ba7e95b$3ccb2b7c$bc44a5ff$@master.sype7.com>
From: Leo Soders <Leo.Soders@Present.Status.customizedparts.de>
To: linux-mtd <linux-mtd@lists.infradead.org>
Date: Sat, 12 Nov 2022 00:56:59 +0800
Subject: produces and delivers high-quality plastic parts and solutions to the market lists.infradead.org
MIME-Version: 1.0
X-Priority: 3
X-Mailer: Microsoft Outlook 16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_095734_809882_6AA6A879 
X-CRM114-Status: UNSURE (   1.02  )
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
Reply-To: paul@en.ideasareality.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

hello linux-mtd,
I hope you enjoy your day.

We operate from our 3,500 sqm/37,673 sq ft engineering facility in Pingshan New District, Shenzhen, China. We continually invest in the most advanced 5-Axis and CNC engineering machinery. We use the latest CAD, SOLIDWORKS, Pro ENGINEER and UG software which allows us to manufacture highly complex precision components to tight deadlines. Dowse can produce bespoke one-off components, or manufacture larger batch requirements.
we wook
1) Cold & Hot Runner mold
2) Single & Multi-Shot mold
3) Large mold
4) High precision mold
5) 2-color / Bi-color mold
6) Unscrewing mold
7) Prototype Tooling
8) Over molding
9) Stack Mold
10) Mass production for plastic parts, aluminum/zinc/ metal parts 
Please try to reply directly to this email.

If you have any questions about plastic parts, metal parts, aluminum, zinc alloy parts. Please send me drawings or samples and we will provide you with the best quotation soon!
 
And hope to get your reply asap,
Yours truly!  -  Leo.Soders

CNM
 
  
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
