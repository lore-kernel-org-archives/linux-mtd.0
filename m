Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RW2Dr-00016k-8O
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2011 08:42:28 +0000
Received: by lagu2 with SMTP id u2so784221lag.36
 for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2011 00:42:24 -0800 (PST)
Subject: Re: [PATCH] mdt nand: omap2+ use platform options
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jan Weitzel <j.weitzel@phytec.de>
Date: Thu, 01 Dec 2011 10:42:22 +0200
In-Reply-To: <1322557213-23565-1-git-send-email-j.weitzel@phytec.de>
References: <CAN8TOE9=ux=suwcQMwJY1XUhp_mnD_DL613ffF1-HTL1OVB2PQ@mail.gmail.com>
 <1322557213-23565-1-git-send-email-j.weitzel@phytec.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1322728943.2332.13.camel@koala>
Mime-Version: 1.0
Cc: dedekind@infradead.org, tglx@linutronix.de, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-11-29 at 10:00 +0100, Jan Weitzel wrote:
> Options from struct omap_nand_platform_data are not used.
> Apply options after nand_scan_ident to avoid overwrite due to
> NAND_CHIPOPTIONS_MSK.
> So you can pass options from platformcode
> 
> Signed-off-by: Jan Weitzel <j.weitzel@phytec.de>

Pushed to l2-mtd-2.6.git, thank you!
