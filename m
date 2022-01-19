Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7F5C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jan 2022 15:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pq9jFDBwjSImvteC9koWrtyhCAWu20Ygl28JjPv+aPM=; b=hUQLE2+Moa7riECobZqy0NTk15
	8xlyRbi5JLu/tEQa98EwcyarMusDaqKlu3bN5Z4aPMiKh1jxTX31q/r1j1EwJfuEfii5nnz3gwruD
	he3dOtcPyFa54nPmVbiLNho0dVVzb1pgwOq52N8n/4kjvckdFLO7+Av0qbzBXRYkNS/IOZJmv1iyN
	VPSAvtfKT8qGuzeu5Fa+lkoGLIap8qPEiR1gnjA4EyzvGLX2sexnydoAp4hA36s442jfHIF5GSVG/
	VgGvmQQHinxgF8oWdnj1pDk9FofaapI7BKczSAUrjiWaLD10h13x32dSkmuDBrZsl7CHjWaaBJX7x
	izfTRfFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nADFc-006EIZ-4r; Wed, 19 Jan 2022 15:51:56 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nADFZ-006EHq-H5
 for linux-mtd@lists.infradead.org; Wed, 19 Jan 2022 15:51:54 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 65A23223EA;
 Wed, 19 Jan 2022 16:51:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1642607512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tE1VF3g/rX5C3ifjMZBPjLLm6cBP9Tc4XyzTVG+pf1I=;
 b=SaNAtkBMsm4GrJgTbHVgzd1P+k0oh5U18nnZaPDkG0YBL4cZXkg83Yj0OI34sZiWw39Suv
 7fwiJeDvG84R9pNQAlN/WysgPtI0tgvKFG674e8MYMiRGOR4V1yk0s7P0hXEZIx1f/ws0x
 1QLIcsEiaGiL8Q8LcwGw4vRlfGOPAOk=
MIME-Version: 1.0
Date: Wed, 19 Jan 2022 16:51:51 +0100
From: Michael Walle <michael@walle.cc>
To: "Sajida Bhanu (Temp)" <c_sbhanu@qti.qualcomm.com>
Cc: Tudor.Ambarus@microchip.com, "Sajida Bhanu (Temp) (QUIC)"
 <quic_c_sbhanu@quicinc.com>, dianders@chromium.org, p.yadav@ti.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stummala@codeaurora.org, vbadigan@codeaurora.org, "Ram Prakash Gupta (QUIC)"
 <quic_rampraka@quicinc.com>, "Pradeep Pragallapati (QUIC)"
 <quic_pragalla@quicinc.com>, sartgarg@codeaurora.org
Subject: Re: [PATCH V3] mtd: spi-nor: winbond: Add support for winbond chip
In-Reply-To: <PH0PR02MB84557EA76BD8DDD35A99B915CD599@PH0PR02MB8455.namprd02.prod.outlook.com>
References: <1639476991-25676-1-git-send-email-quic_c_sbhanu@quicinc.com>
 <488aafc3-2fa9-198b-c448-d1ca7ef52f35@microchip.com>
 <PH0PR02MB84557EA76BD8DDD35A99B915CD599@PH0PR02MB8455.namprd02.prod.outlook.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <b4aad212d86b2d4dd27602db6add82e3@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_075153_762941_78D225F7 
X-CRM114-Status: UNSURE (   6.46  )
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

Am 2022-01-19 06:34, schrieb Sajida Bhanu (Temp):
> Gentle Reminder.

As Tudor mentioned, you'd need to rebase your patch to the
latest next.

Thanks,
-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
