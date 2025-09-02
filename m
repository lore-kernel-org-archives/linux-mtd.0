Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDCCCA1005
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Sep 2025 06:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nhetV6Uu3qLP2yrAND8HOatz3fgtkESJBWrQf0S5ad0=; b=3tSswknfSTKqVq
	bR5bchS7l7QB8vPY5ctfIIgIuNr2pZv5TSUtHTr8Z+4NAPjxcQWdkNTriEkJnJp22+SeDCiwYEAbE
	Fizk56pDZymdk2We+Ade0wfYwDgh4nbGML3dcDtb2RBED7NlRULgvkYBC2H2JMQTND9pD5QQIUlFE
	cYwIquGlUYSMgnAGv9e2eRwLhVP/Gsmqe40ipMGJPbhLS/3HgQQULfSsjElCDwqpTeWht82P6ADS7
	kRzqqFLP1IRO5ffKOcuCOf8wGbTRkdWmydy3p3h5Pf8HeKfsPBfquF3vsmqxz9q3ltTL1jsB2WtNm
	TnwCW2ziJb6WkXC8izbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utKEB-0000000FSIE-44AV;
	Tue, 02 Sep 2025 06:10:47 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utK45-0000000FQ6M-1i91
	for linux-mtd@lists.infradead.org;
	Tue, 02 Sep 2025 06:00:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 790BB14807F6;
	Tue,  2 Sep 2025 08:00:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1756792816; h=from:subject:date:message-id:to:cc:mime-version:content-type;
	bh=/+fDJbS7gRZJNUAGRDP5IS2JtRY0a2+P5vA2nvVqsWA=;
	b=fxlPIQ7xNAv1G/CNB9CsJYRDIGRjirfueZNta3gLCMc9c+Vj2f44ZlZfm/ookhAsfp6Nud
	TnDpkXXLaZtl4ZSCW+6CWxV/MxGUmysVHoTtfaKobIaVNKFXaiG/SlEp3NoV02ejNIyP3I
	2sjnMB+DdL0QrG6a+SLa4ZzjVSgKLfDKIe30NE9KFKtlfcDvavXvCWss0TyHwIxQU+1xE6
	JqZDY+A7oHk5eKqM/Fz7Qypur2eE6bS7U3PUIieClhmaEQkEx0pIkDLGiCpPtHCpjZKvgv
	sIDsXhw6dduyezmAdZMTjJ5dwo+97jVdzaf6iXsmTsTtWo3+xBJ4EjswrzPBrw==
Date: Tue, 2 Sep 2025 08:00:11 +0200
From: Alexander Dahl <ada@thorsis.com>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Subject: State of the UBI fastmap feature
Message-ID: <20250902-yarn-from-020874b4da63@thorsis.com>
Mail-Followup-To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_230021_891093_2032BBE9 
X-CRM114-Status: UNSURE (   8.02  )
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

Hello everyone,

after using UBI for almost 15 years now without fastmap, I'm currently
experimenting with that feature.  The help text in Kconfig menu
(drivers/mtd/ubi/Kconfig) still says "Experimental feature" and
further down:

> Important: this feature is experimental so far and the on-flash
> format for fastmap may change in the next kernel versions

Is this still the current state?  I can not remember seing any patches
touching fastmap in the last time.  Are there plans to stabilize this?
Will there be changes in the on-flash format?  Do folks even use this
feature?  In production?

Happy to get some opinions here.

Greets
Alex


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
