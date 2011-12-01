Received: from mail.visioncatalog.com ([217.6.246.34] helo=root.phytec.de)
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RW1tP-0003XN-PY
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2011 08:21:20 +0000
Subject: Re: [PATCH] mdt nand: omap2+ use platform options
From: Jan Weitzel <J.Weitzel@phytec.de>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <CAN8TOE-uO2rzPt64ubwzTkh6Wz2wBnH88d3RdsGdJJSpCHsdeg@mail.gmail.com>
References: <CAN8TOE9=ux=suwcQMwJY1XUhp_mnD_DL613ffF1-HTL1OVB2PQ@mail.gmail.com>
 <1322557213-23565-1-git-send-email-j.weitzel@phytec.de>
 <CAN8TOE-uO2rzPt64ubwzTkh6Wz2wBnH88d3RdsGdJJSpCHsdeg@mail.gmail.com>
Date: Thu, 01 Dec 2011 09:21:11 +0100
Message-ID: <1322727671.4543.28.camel@lws-weitzel>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="UTF-8"
Cc: dedekind@infradead.org, tglx@linutronix.de, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org
Reply-To: J.Weitzel@phytec.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Mittwoch, den 30.11.2011, 12:31 -0800 schrieb Brian Norris:
> On Tue, Nov 29, 2011 at 1:00 AM, Jan Weitzel <j.weitzel@phytec.de> wrote:
> > Options from struct omap_nand_platform_data are not used.
> > Apply options after nand_scan_ident to avoid overwrite due to
> > NAND_CHIPOPTIONS_MSK.
> > So you can pass options from platformcode
> 
> Just to clarify, were the pdata->options ever used before? And does
> struct omap_nand_platform_data even have such a field?

No not used, but field exists. There is also a devsize field which is
used to provide NAND_BUSWIDTH_16 to info->nand.options
(drivers/mtd/nand/omap2.c)
Jan

> Brian
> --
> To unsubscribe from this list: send the line "unsubscribe linux-omap" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
