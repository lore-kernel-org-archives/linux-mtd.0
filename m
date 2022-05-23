Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01777C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 23 May 2022 14:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KUsnIZnnZoPbN+YqLORUBO4FNq58+YAppalPJvHpOfE=; b=GODNwEuA3mfDbIu2Gar5oIh2EB
	u5yoP8g3HFwmEuS5pxKi1JnvK0xF0A1ZPDn31YG8D/R7s7A3SHNA345aOmNTILA5CKSnBK3pBlQMG
	FKQ3ez/ZB29gaBhTDltfdPs6CigZfpzJNaosdLcfGiuzd0iM2kn+YEMfX9WnzVBZmzJX8IK1j/H/h
	U9St1bW6hBcp4fYc+PD+EIAzfgit3ZDS13GyelsofWp352gEdYyPD8nEVD9m7JeSJQSdiJLcmNVA9
	7zsX+sfVmsN/5v6JxW0reI6g12D+FqQQ9klida6qboWQhI1ned2zkMmShQ7IO4/SyuoM30+mIhAht
	Euj+GY/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt9Wd-004p8a-1a; Mon, 23 May 2022 14:59:15 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt9Wa-004p6x-Ol
 for linux-mtd@lists.infradead.org; Mon, 23 May 2022 14:59:14 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 6655222248;
 Mon, 23 May 2022 16:59:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1653317947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cGj5h6n/mhpEpy/6trXc2PvmpwVRapEg4Ui9pjNgjCk=;
 b=X8G07+KlUFysKyCB10+5jywwKqQlpSDbTI+WOtIwm/bKeGpS0aNMPEKxV5rk0+QMblOTc4
 bqzbvI0SDmR8nAECqNV3TSO/65zTkO+TOt0GgHvmffOdwh5W0U/gw/JlrLlGGQEOFV5aE+
 QJMurQLjuz1ISSbq6gi1es8Lylt4BiM=
MIME-Version: 1.0
Date: Mon, 23 May 2022 16:59:07 +0200
From: Michael Walle <michael@walle.cc>
To: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: macronix: Add support for mx66l2g45g
In-Reply-To: <fde9bd5a-7161-9222-4719-4279b2416163@linux.intel.com>
References: <20220523143002.1754922-1-jiaqing.zhao@linux.intel.com>
 <fde9bd5a-7161-9222-4719-4279b2416163@linux.intel.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <35d64d702798d437245090ce96ae29a8@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_075913_033674_C535C1E5 
X-CRM114-Status: UNSURE (   8.91  )
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

Am 2022-05-23 16:33, schrieb Jiaqing Zhao:
> Use PARSE_SFDP for now as the SNOR_ID3() patch is not merged yet, will
> switch to it after it is merged.

Fair enough, could you resubmit it with
{ "mx66l2g45g",  INFO(0xc2201c, 0, 0, 0) PARSE_SFDP },

Looks odd, but is the same as SNOR_ID3(0xc2201c), so we can just
switch to the new macro without any more testing. Or Pratyush can
replace it inline while committing this patch if the SNOR_ID3()
will make it in before.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
