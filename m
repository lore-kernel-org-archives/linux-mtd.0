Received: from mail-fx0-f49.google.com ([209.85.161.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RVqoH-0000Mx-FR
 for linux-mtd@lists.infradead.org; Wed, 30 Nov 2011 20:31:18 +0000
Received: by faan17 with SMTP id n17so1179135faa.36
 for <linux-mtd@lists.infradead.org>; Wed, 30 Nov 2011 12:31:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1322557213-23565-1-git-send-email-j.weitzel@phytec.de>
References: <CAN8TOE9=ux=suwcQMwJY1XUhp_mnD_DL613ffF1-HTL1OVB2PQ@mail.gmail.com>
 <1322557213-23565-1-git-send-email-j.weitzel@phytec.de>
Date: Wed, 30 Nov 2011 12:31:13 -0800
Message-ID: <CAN8TOE-uO2rzPt64ubwzTkh6Wz2wBnH88d3RdsGdJJSpCHsdeg@mail.gmail.com>
Subject: Re: [PATCH] mdt nand: omap2+ use platform options
From: Brian Norris <computersforpeace@gmail.com>
To: Jan Weitzel <j.weitzel@phytec.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: dedekind@infradead.org, tglx@linutronix.de, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 29, 2011 at 1:00 AM, Jan Weitzel <j.weitzel@phytec.de> wrote:
> Options from struct omap_nand_platform_data are not used.
> Apply options after nand_scan_ident to avoid overwrite due to
> NAND_CHIPOPTIONS_MSK.
> So you can pass options from platformcode

Just to clarify, were the pdata->options ever used before? And does
struct omap_nand_platform_data even have such a field?

Brian
