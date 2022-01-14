Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175E0C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jan 2022 10:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pc8/MCtMF0WliI/phFlpIxv1FEYebnGuNrkQbzKvGlU=; b=JL6HXocgGzrQOcYq/RKMhXde6H
	FrpucuZSuzmh04Pzgv6gcRYgc/V955GxBDFDR8zmcIIhgJQJnoxhPxq2kndqK/+d5QwrMEJ1vRWXK
	UrAkMpgyqpaQsejW5gJ9hp88d3wGYkSaYdYsT7Tx4yjfKfWv7W+DJWnUNVlYR+vMyBpE94VXPfEjq
	vJVSfxtistrf2CorU4XH12d+dwiAU9zFZEsfJ+iAKEPygA8q7glMl19eI1QllSVvWh3DS1Ak533EL
	K+lO+ZuyjbesV+iOHGbYWOYrFtZlCwUujX6axxDtJcetmaTL/jG73ve39rRIk5i3akYu0KMcapBjE
	pWuyIrhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8JVE-008e6h-3G; Fri, 14 Jan 2022 10:08:12 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8JVB-008e57-0Z
 for linux-mtd@lists.infradead.org; Fri, 14 Jan 2022 10:08:11 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 4BA242223A;
 Fri, 14 Jan 2022 11:08:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1642154884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O4jyvlhZ8Yykl40vYuWgq6f+Jtd8TCx2/U599wgdVMI=;
 b=kEyL4muFvDHSteF7Qnesk2Cp1FkdOJ5a/yFCjlh70Ca+vxb0xfCi7OHAWLsMqfRGNrWJlD
 yMt2QjbL1aoYFF42om5tsVnQwP0uxxFuOi01/FEQCf7YCX62ZmaQhPu2+4S2CPkFQBrRpD
 Fj35Dlo3vF2+U3aeBhyHkl4WaUH45vI=
MIME-Version: 1.0
Date: Fri, 14 Jan 2022 11:08:03 +0100
From: Michael Walle <michael@walle.cc>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Stefan Schaeckeler <schaecsn@gmx.net>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] ubifs: use default_groups in kobj_type
In-Reply-To: <20220113180857.2158974-1-gregkh@linuxfoundation.org>
References: <20220113180857.2158974-1-gregkh@linuxfoundation.org>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <bafc94269e6fa7632bc6ea458320b238@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_020809_738876_89066546 
X-CRM114-Status: UNSURE (   8.97  )
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

Hi,

Am 2022-01-13 19:08, schrieb Greg Kroah-Hartman:
> There are currently 2 ways to create a set of sysfs files for a
> kobj_type, through the default_attrs field, and the default_groups
> field.  Move the AMD mce sysfs code to use default_groups field which

copy & paste mistake?

> has been the preferred way since aa30f47cf666 ("kobject: Add support 
> for
> default attribute groups to kobj_type") so that we can soon get rid of
> the obsolete default_attrs field.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
