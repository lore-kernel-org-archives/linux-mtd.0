Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B018EE57DB
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Sep 2024 22:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rtVIW6hZJDE5f9plV4ZwJVr6fbHlH1dH9S2iLGYaVp8=; b=Tl1iQ54BFolTJC
	RJwhTQmAdywKta5lVuRHqY9CUUh6J68CPLlLcZ7Rp6pJYcwZJVtXArvaKFbZsGu9n3u+WUun12oRY
	D0Yr7pH6oEIFv2/nOca3MNVaOulq9FvMN1Os6wCUSIPlHzDQeyGbF0eejdYRsyy85HlkJVguWUEa1
	gy0waT8KNlOriIdt58xKpv9SNH4Hp5k3sZrFnkoFJkJanRx3t4oP5A/RwzGl+yfva6OsW44DirPtC
	b7NDIeguPGROg4oTQYZh77OmvMr/ulWQ1a/YA984SjQAJOwuEBTSCY2xKOQj24IzeEvEPZYJyHyLi
	3z6VLc8r5f76XQoLqMOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soW48-0000000BG3T-31z7;
	Wed, 11 Sep 2024 22:44:00 +0000
Received: from mail.emailsend48.com ([91.208.206.171])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soW45-0000000BG32-2T7D
	for linux-mtd@lists.infradead.org;
	Wed, 11 Sep 2024 22:43:58 +0000
Received: from emailsend48.com (static.172.87.108.65.clients.your-server.de [65.108.87.172])
	by mail.emailsend48.com (Postfix) with ESMTPA id 53B6ED06D1C
	for <linux-mtd@lists.infradead.org>; Wed, 11 Sep 2024 22:43:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.emailsend48.com 53B6ED06D1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emailsend48.com;
	s=202408; t=1726094635;
	bh=RinbZxT7CxdUDj3HtZSvkvnSiKcgVmgozH8EDVD+H/c=;
	h=Reply-To:From:To:Subject:Date:From;
	b=JHqlyLYapCpvv0VjejiPsBv84BZpXOv4gF1LP80tJBhhzHx7vYgsqnCjthczsGDAp
	 wvQeQOrJEdBFv4W6+kw/XnLYIMms9zt7//XNpmWkSifoEOAvMc4rBrtLx6zUybSdmF
	 JLBdHAWC4bxorxo4CWiBSjqD5nIztmMVTA/HEkETm6cgaudbphC1Q8O6OI3adVvwbM
	 SmRgAwzdLLRLzfyxg6UszGHNjb87QLv4tTpijwujcfIvAuG+XmbBCxq+CqXFhmDvjV
	 g1O3FGFZxglG0gGjxSpbFgepWXC9EZ084vU++WRTyMELGV+lWo+deyVsK4ocyhGE6b
	 f5IWUbePDhA5g==
From: Omar Bin <info@emailsend48.com>
To: linux-mtd@lists.infradead.org
Subject: ADNOC-UAE-197-1022 FOR CONTRACTORS/VENDORSADNOC-UAE-197-1022 FOR CONTRACTORS/VENDORS
Date: 11 Sep 2024 15:43:55 -0700
Message-ID: <20240911154355.049AEB782C232981@emailsend48.com>
MIME-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (mail.emailsend48.com [0.0.0.0]); Wed, 11 Sep 2024 22:43:55 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_154357_805778_28410C0D 
X-CRM114-Status: UNSURE (  -0.52  )
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
Reply-To: vendor@adnocssuplier-ae.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Dear Sir / Madam,



                                   
This invitation is coming from Abu Dhabi National Oil Company 
(ADNOC) in line with the ongoing projects of interest hence the 
extension of the Invitation to you and your esteemed 
organization.

This notification of invitation is In line with the development 
and expansion of Abu Dhabi National Oil Company.

We notify your organization about the ongoing enrollment of 
Vendors, contractors, suppliers, and intending partners as well 
as the Validation of the existing ones.

This enrollment is open for 2023/2024 projects and will be 
closing in 10 days.

Therefore, intending Contractors/Vendors and existing vendors who 
are interested in receiving the Invitation to Tender (ITT) or 
Request for Quotation(RFQ) are to provide us with sufficient 
information to make an initial assessment of their competence to 
handle any of the projects as shall be listed.

These projects are open to both local and international 
organizations.

Please confirm your interest in receiving the EOI and Vendor 
registration questionnaires for onward enrollment

We appreciate your interest in this invitation, and we look 
forward to your early response.

________________________

Kind Regards,

Omar Bin Al Qassim Mamoud
Group Procurement Vendor Coordinator
ADNOC - Abu Dhabi National Oil Company, U.A.E
Contracts Shared Services Center
Email: vendor@adnocssuplier-ae.com



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
