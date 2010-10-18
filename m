Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=TX2EHSOBE004.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P7sES-0003o0-3f
	for linux-mtd@lists.infradead.org; Mon, 18 Oct 2010 16:06:40 +0000
Received: from mail173-tx2 (localhost.localdomain [127.0.0.1])	by
	mail173-tx2-R.bigfish.com (Postfix) with ESMTP id 95CB58A8618	for
	<linux-mtd@lists.infradead.org>; Mon, 18 Oct 2010 16:06:38 +0000 (UTC)
Received: from TX2EHSMHS012.bigfish.com (unknown [10.9.14.250])	by
	mail173-tx2.bigfish.com (Postfix) with ESMTP id E0212F80058	for
	<linux-mtd@lists.infradead.org>; Mon, 18 Oct 2010 16:06:37 +0000 (UTC)
Received: from de01smr02.am.mot.com (de01smr02.freescale.net [10.208.0.151])
	by az33egw02.freescale.net (8.14.3/8.14.3) with ESMTP id
	o9IG6YFJ011368	for
	<linux-mtd@lists.infradead.org>; Mon, 18 Oct 2010 09:06:34 -0700 (MST)
Received: from az33exm25.fsl.freescale.net (az33exm25.am.freescale.net
	[10.64.32.16])	by de01smr02.am.mot.com (8.13.1/8.13.0) with ESMTP id
	o9IGMvIM023311	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Oct 2010 11:22:57 -0500 (CDT)
Date: Mon, 18 Oct 2010 11:06:31 -0500
From: Scott Wood <scottwood@freescale.com>
To: tiejun.chen <tiejun.chen@windriver.com>
Subject: Re: [PATCH 1/2] P4080/eLBC: Make Freescale elbc interrupt common to
	elbc	devices
Message-ID: <20101018110631.22d6f081@udp111988uds.am.freescale.net>
In-Reply-To: <4CBC0B95.9010300@windriver.com>
References: <1287386552-10647-1-git-send-email-tie-fei.zang@freescale.com>
	<4CBC0B95.9010300@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Cc: B07421@freescale.com, dedekind1@gmail.com, dwmw2@infradead.org,
	B25806@freescale.com, linuxppc-dev@ozlabs.org,
	linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
	Roy Zang <tie-fei.zang@freescale.com>, B11780@freescale.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 18 Oct 2010 16:55:49 +0800
"tiejun.chen" <tiejun.chen@windriver.com> wrote:

> Looks you always iounmap(fsl_lbc_ctrl_dev->regs) on position 'err' but here
> of_iomap() is already failed you should skip iounmap() fsl_lbc_ctrl_dev->regs
> again. So you should improve that as the following on 'err', or layout 'err' in
> gain.
> ------
> 	if(fsl_lbc_ctrl_dev->regs)
> 		iounmap(fsl_lbc_ctrl_dev->regs);
> 

It looks like iounmap(NULL) is a no-op, just like kfree(NULL).

-Scott
