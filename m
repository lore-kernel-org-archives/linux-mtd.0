Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A9EC6FD1F
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Mar 2023 06:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=moqj37g3xuwuA5fDWCKYARan0UHr9boqYqZ7awuJgXs=; b=t+xVFdj4mXcTEA
	By3RLGUtlepRXdUlZ1Hgxay/wWOMkxTIUnW8+BBA5+otCWuvHyVU5uqm3IGkMxMsGWIyL0nH6JZlb
	XTYCRya7SW1N4OcqcK7XGGRWsdq1P7+bkfJDXSFLtg1kYkHydCGGcnXBGDFPg4FAXtoqCS6QRgYe/
	WKzNqPMhZxyMIAJXz7/vL3CA1cq1gO9Ej9vS9InC6FLAnmgab3VRBVyC/1nRhkSbxPOFOcIk/HIgh
	16WLveuhotgOuzRg97K/PogeDO2oFZVCj0xa25SIrIPhu8NOkaGgnb3zrlFQAaKLgtPb3lkX2Nc2f
	cDiYHp0ZUaYHABFq1fCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbxoV-0099Q5-Bk; Tue, 14 Mar 2023 06:07:11 +0000
Received: from [103.30.145.160] (helo=defaultworkshop.klidefectmanagement.com.novalocal)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbxoR-0099PC-4k
	for linux-mtd@lists.infradead.org; Tue, 14 Mar 2023 06:07:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=asda.co.uk;
	s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
	Subject:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=ceYZREiqx6TcrEW+/C5DMhaN6S/kIA/5MNRfJ6H8PDw=; b=g
	NZF4tAOzI+FYSTcxvhyq8dQkVK8+9D4MzfD/S5a3auCyYCh65pvKF6tbE5FkY4bIgnjyReclLqcih
	IZcI9MuZ2b0Ekx0W7IEV3JvTUUoVS1aLbEGjeZuJ+cqRPNGxQbcImyx4rdcmuAUMIdILYpiQANw4x
	KAtgJxvV1wrEcPO0=;
Received: from ec2-52-11-215-80.us-west-2.compute.amazonaws.com ([52.11.215.80] helo=asda.co.uk)
	by defaultworkshop.klidefectmanagement.com.novalocal with esmtpa (Exim 4.94.2)
	(envelope-from <sales1@asda.co.uk>)
	id 1pbls7-0005KY-NF
	for linux-mtd@lists.infradead.org; Tue, 14 Mar 2023 00:22:08 +0700
From: ASDA Stores Limited <sales1@asda.co.uk>
To: linux-mtd@lists.infradead.org
Subject: First quarter procurement order/enquiry
Date: 13 Mar 2023 17:22:06 +0000
Message-ID: <20230313152049.A669FF5EDA89FDE3@asda.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_230707_470081_B6DF559F 
X-CRM114-Status: UNSURE (  -0.32  )
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
Reply-To: sales@asda-c.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Dear linux-mtd
I'm a procurement manager  with ASDA Group (the owners of ASDA 
Stores) and your company product has caught our interest. 
Therefore, we request you send
list and prices of your hot selling items (products) for our 
evaluation/pick.

Soon as we receive your reply, we shall send you our company 
profile and buying proposal. You can also check our website below 
for detailed info of our purchase area and trading capacity.

Your immediate response E-mail:  sales@asda-c.com   shall be 
appreciated.

Best Wishes

Ms Stelle Montgomery
Purchasing Dept.
ASDA Stores Limited
Tel:  +44 7418367220
WhatsApp: + 44-7502985874
Website: www.asda.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
