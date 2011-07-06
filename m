Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QeLrd-0002jT-K4
	for linux-mtd@lists.infradead.org; Wed, 06 Jul 2011 06:45:38 +0000
Received: by iwn35 with SMTP id 35so7144512iwn.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 05 Jul 2011 23:45:34 -0700 (PDT)
Subject: Re: [PATCH 1/2] mtd/nand : don't free the global data
	fsl_lbc_ctrl_dev->nand in fsl_elbc_chip_remove()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: b35362@freescale.com
Date: Wed, 06 Jul 2011 09:46:34 +0300
In-Reply-To: <1309225852-1664-1-git-send-email-b35362@freescale.com>
References: <1309225852-1664-1-git-send-email-b35362@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309934799.3149.69.camel@sauron>
Mime-Version: 1.0
Cc: linuxppc-dev@ozlabs.org, dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-06-28 at 09:50 +0800, b35362@freescale.com wrote:
> From: Liu Shuo <b35362@freescale.com>
> 
> The global data fsl_lbc_ctrl_dev->nand don't have to be freed in
> fsl_elbc_chip_remove(). The right place to do that is in fsl_elbc_nand_remove()
> if elbc_fcm_ctrl->counter is zero.
> 
> Signed-off-by: Liu Shuo <b35362@freescale.com>

Changed the subject to something shorted and pushed to l2-mtd-2.6.git,
thanks.

-- 
Best Regards,
Artem Bityutskiy
