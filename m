Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC573C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Feb 2022 11:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9G5M/NuNchVwR/+TpAnX/geSCeaL2trZf7vNSdr0eC4=; b=BEgnSYlNF6sGEGgh0hhv3bU9jH
	1fYuzqH8XOAPfDn6SBhGql7wNzSoSDp+aJZZBKx45JvrkJsiEwriJuDeyjYHMo9FRJdibqS2vzlD7
	4lY9DcYzHJksrKhSGVnrelU7LL3A5SK6jo+7pnlFETVROt9qwFrYwYhOHyE9AXUy0hQzZCd/XEMgr
	cyeovGoJSYY+MM1eZk6C8bFP48gMW+65MV573zcz9lETioKFfJwulNFXaQ++s/npXb85pf08AsbhB
	6CoRTroUn8MHLRt9iFqhP0pdEYDPvkDXN1BNIl7XjJ04xP+CBYdwQyquvyXQkol56G+XvWwlNlnwB
	jt68AI3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIU4W-006sL0-I8; Fri, 11 Feb 2022 11:26:40 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIU4S-006sId-Nj
 for linux-mtd@lists.infradead.org; Fri, 11 Feb 2022 11:26:38 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id DD6BF223EA;
 Fri, 11 Feb 2022 12:26:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1644578792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Huq7XZw0qNSdfruXWN010/awSFwdD35NtLJBGtoEWoA=;
 b=R55i34bvyIRTYktp4mXcmiVuEPe3sBmrnR3W600CL3qaNRcozBQrvHa/e3WN7DAgO4uth9
 GPg15pnD1AEEdeWwNfvNEDZoVhkXdlF6I29o9mbXDy4ul1CNS8RcN4cFUunNHeI+Owni7Q
 XbHHmq2ugyEIcnEpt8QPs0Se06Bk+HA=
MIME-Version: 1.0
Date: Fri, 11 Feb 2022 12:26:31 +0100
From: Michael Walle <michael@walle.cc>
To: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
Cc: dianders@chromium.org, tudor.ambarus@microchip.com, p.yadav@ti.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 quic_stummala@quicinc.com, quic_vbadigan@quicinc.com,
 quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
 quic_sartgarg@quicinc.com
Subject: Re: [PATCH V7] mtd: spi-nor: winbond: add support for W25Q512NW-IM
In-Reply-To: <1644578661-21821-1-git-send-email-quic_c_sbhanu@quicinc.com>
References: <1644578661-21821-1-git-send-email-quic_c_sbhanu@quicinc.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <469eb4c95dbae9940fa4c71431972222@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_032636_963290_CA4E854B 
X-CRM114-Status: UNSURE (   5.58  )
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

Am 2022-02-11 12:24, schrieb Shaik Sajida Bhanu:
> Add support for winbond W25Q512NW-IM chip.
> 
> Signed-off-by: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
> Reviewed-by: Doug Anderson <dianders@chromium.org>

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
