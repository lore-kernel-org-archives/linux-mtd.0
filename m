Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]
	helo=TX2EHSOBE010.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P6QGc-0006P5-Ig
	for linux-mtd@lists.infradead.org; Thu, 14 Oct 2010 16:02:56 +0000
Received: from mail17-tx2 (localhost.localdomain [127.0.0.1])	by
	mail17-tx2-R.bigfish.com (Postfix) with ESMTP id 126A818282DC	for
	<linux-mtd@lists.infradead.org>; Thu, 14 Oct 2010 16:02:44 +0000 (UTC)
Received: from TX2EHSMHS040.bigfish.com (unknown [10.9.14.240])	by
	mail17-tx2.bigfish.com (Postfix) with ESMTP id 038B412D804D	for
	<linux-mtd@lists.infradead.org>; Thu, 14 Oct 2010 16:02:44 +0000 (UTC)
Received: from az33smr01.freescale.net (az33smr01.freescale.net
	[10.64.34.199])	by az33egw01.freescale.net (8.14.3/8.14.3) with ESMTP
	id o9EG2fAO015472	for <linux-mtd@lists.infradead.org>;
	Thu, 14 Oct 2010 09:02:41 -0700 (MST)
Received: from az33exm25.fsl.freescale.net (az33exm25.am.freescale.net
	[10.64.32.16])	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	o9EG2f25020724	for <linux-mtd@lists.infradead.org>;
	Thu, 14 Oct 2010 11:02:41 -0500 (CDT)
Date: Thu, 14 Oct 2010 11:02:39 -0500
From: Scott Wood <scottwood@freescale.com>
To: Zang Roy-R61911 <r61911@freescale.com>
Subject: Re: [PATCH 1/3 v4] P4080/eLBC: Make Freescale elbc interrupt common
	to elbc devices
Message-ID: <20101014110239.466072be@udp111988uds.am.freescale.net>
In-Reply-To: <3850A844E6A3854C827AC5C0BEC7B60A2B0329@zch01exm23.fsl.freescale.net>
References: <20100920153718.GA4411@oksana.dev.rtsoft.ru>
	<3850A844E6A3854C827AC5C0BEC7B60A2B0329@zch01exm23.fsl.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Cc: Wood Scott-B07421 <B07421@freescale.com>, dedekind1@gmail.com,
	Lan Chunhe-B25806 <B25806@freescale.com>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Anton Vorontsov <cbouatmailru@gmail.com>,
	akpm@linux-foundation.org, dwmw2@infradead.org,
	Gala Kumar-B11780 <B11780@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 13 Oct 2010 23:43:38 -0700
"Zang Roy-R61911" <r61911@freescale.com> wrote:

> > Plus, I think the patch is not runtime bisectable (i.e. you
> > now do request_irq() here, but not removing it from the nand
> > driver, so nand will fail to probe).
> Nand driver does not need to request irq. It will use the irq requested by lbc.
> remember, other lbc device may also need to use this registered irq. 
> It should not be removed in nand driver.

The point is that you need to make both changes in the same patch.

-Scott
