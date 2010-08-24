Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Onr1Y-0007Et-VX
	for linux-mtd@lists.infradead.org; Tue, 24 Aug 2010 10:46:38 +0000
Received: by bwz13 with SMTP id 13so6290779bwz.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 Aug 2010 03:46:31 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] Deprecate ECCGETLAYOUT
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <norris@broadcom.com>
In-Reply-To: <4C6E9C23.6060703@broadcom.com>
References: <4C5CA4A1.1040000@broadcom.com>
	<1282154806-9420-1-git-send-email-norris@broadcom.com>
	<4C6DD170.1060807@renesas.com>  <4C6E9C23.6060703@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 Aug 2010 13:45:03 +0300
Message-ID: <1282646703.24044.162.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Shinya Kuribayashi <shinya.kuribayashi.px@renesas.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Sneha Narnakaje <nsnehaprabha@ti.com>,
	Linux Kernel <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-08-20 at 08:15 -0700, Brian Norris wrote:
> So this leaves the important patch set as the following two independent, 
> slightly different approaches to the same problem; we should choose 
> between them:
> [PATCH v3 1/2] mtd: Expand...
> [PATCH v2 2/2] mtd: nand: Expand...

Could you please re-send up-to date (against current mtd-2.6.git tree)
patches which implement your strategy #2? I'd add them to my l2 tree.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
