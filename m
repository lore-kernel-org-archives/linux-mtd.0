Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QBiRO-00006o-4p
	for linux-mtd@lists.infradead.org; Mon, 18 Apr 2011 07:00:14 +0000
Received: by wwb39 with SMTP id 39so3938752wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Apr 2011 00:00:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1303109438-24309-1-git-send-email-j.weitzel@phytec.de>
References: <1302876214.3220.62.camel@localhost>
	<1303109438-24309-1-git-send-email-j.weitzel@phytec.de>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Mon, 18 Apr 2011 12:29:47 +0530
Message-ID: <BANLkTimxgyStkfYXyHJUzQBKTR0pYsF7Qw@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: omap2: mtd split nand_scan in ident and tail
To: Jan Weitzel <j.weitzel@phytec.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Artem.Bityutskiy@nokia.com, vimalsingh@ti.com, tony@atomide.com,
	s.hauer@pengutronix.de, linux-mtd@lists.infradead.org,
	s-ghorai@ti.com, linux-omap@vger.kernel.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 18, 2011 at 12:20 PM, Jan Weitzel <j.weitzel@phytec.de> wrote:
> nand_scan calls nand_scan_tail and here we got a ecc.layout and calculate
> oobavail for this layout. After calling nand_scan, we change the layout pointer
> if OMAP_ECC_HAMMING_CODE_HW_ROMCODE is set. This results in not calcluated
> oobavail. Mountig as jffs2 is not possible.
>
> To fix that nand_scan has to split up in nand_scan_ident and nand_scan_tail
> setting ecc.layout between these calls. So nand_scan_tail calculates oobvail
> for the used layout. This is also done in serveral other platforms.
>
> v2:
> update commit message
Move above two lines to below (as there are not part of commit log):

>
> Signed-off-by: Jan Weitzel <j.weitzel@phytec.de>
> ---
here.

Feel free to add:
Reviewed-by: Vimal Singh <vimal.newwork@gmail.com>

Regards,
Vimal
