Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDACC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 07:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UbnOeek9x2nte2zV3HlQ+SBzZ+Ca47IplGkpK6Ciric=; b=pkO60APK7TuIQi
	yUr9WUz8Qy6UJBAHR9t1qwUPnkHDkf44lgl3EZg+yAPqhqoupZI3evKMAc+pEIVtqb755YVJ9JQ+5
	VCH5NzWzGd6TpO2WkdMTu8I2TzLz6Tm2E0TuOPKBZJO5krXjVsVjavVpIxNwtNcku7Y2/mds+b65x
	BNbVLH7oDT11C39ZTqawGedpLHDOkYMWKsZDIBNXOeUB5iTpJUCuU/rllbk+pHPJ0nVdLvJc2is31
	HblgkhAQj3YK0/SlzAxcRzS/Wf4zljM8mbw0WbsSV4Az4vF2gwNDnBFJ5fchPXSi8+lnvywVs/HYm
	kUnEeY1kYvdYmjCsHUhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhRPB-00C5Ok-Rt; Thu, 21 Apr 2022 07:39:10 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhRNA-00C3vH-Bw
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 07:37:06 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CCD46FF803;
 Thu, 21 Apr 2022 07:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650526622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uRVVqnMVlYsQL7wBWWqE63v2riceyDIujbiEijbMoEc=;
 b=h4k4TNo5+1xEirWFkS2ehVFp2K1oNAyJ/5gGYAOyRL0VKsKFJmDWZfTIiIYZODxLyOgmPK
 fpdGd6FLyskFhfSF2LNXs6Rcu5z5OhqVk6tjXHhoU2MNyV/pSEuokHEtumkn4V9lkl0YmU
 NMyJjAM9sv1i4QJne9e9w66a/VmPuAdOg3oKF3CKntuBqnJfiFXrHDDfORa2S4km9jPd0F
 zJO6/WIf5XUlLaA68ACog4I0WwsTHH2lkks4TJhi3IVXxADL8rj4Xt3Rvrqqcnv7b1j/2F
 zegbRL7QhYT2kW0zx4uYS/2d3MsZqB5zvYyHTa8HkFAYRct5j6pKMiZxfTDTkg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <han.xu@nxp.com>, sean@geanix.com, frieder.schrempf@kontron.de,
 festevam@gmail.com
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, ye.li@nxp.com, peng.fan@nxp.com,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v4 3/5] mtd: rawnand: gpmi: Uninline the gpmi_check_ecc
 function
Date: Thu, 21 Apr 2022 09:37:01 +0200
Message-Id: <20220421073701.72621-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220412025246.24269-4-han.xu@nxp.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'109158579e64267439c4491845b770cf530f8cba'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_003704_657562_3AF2EDCA 
X-CRM114-Status: UNSURE (   5.73  )
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

On Tue, 2022-04-12 at 02:52:44 UTC, Han Xu wrote:
> The gpmi_check_ecc() is not small after adding more strict ecc check,
> uninline it.
> 
> Signed-off-by: Han Xu <han.xu@nxp.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
