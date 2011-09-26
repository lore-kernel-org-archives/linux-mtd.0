Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R85Bk-0000hc-SA
	for linux-mtd@lists.infradead.org; Mon, 26 Sep 2011 07:01:17 +0000
Received: by wwp14 with SMTP id 14so3999953wwp.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 26 Sep 2011 00:01:11 -0700 (PDT)
Subject: Re: [PATCH] mxc_nand: preset_v1_v2: unlock all NAND flash blocks
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Michael Thalmeier <michael.thalmeier@hale.at>
Date: Mon, 26 Sep 2011 10:03:59 +0300
In-Reply-To: <1316778824-12518-1-git-send-email-michael.thalmeier@hale.at>
References: <1316778824-12518-1-git-send-email-michael.thalmeier@hale.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1317020649.9442.1.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
	David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-09-23 at 13:53 +0200, Michael Thalmeier wrote:
> From: Wolfram Stering <wolfram.stering@hale.at>
> 
> For NFC v1, the unlock end block address was 0x4000, which would only
> unlock the first 32 blocks of the NAND flash.  Change that value to
> 0xffff to unlock all available blocks, as is done for NFC v21 as well.
> 
> Signed-off-by: Michael Thalmeier <michael.thalmeier@hale.at>

Pushed to l2-mtd-2.6.git tree, thanks!

-- 
Best Regards,
Artem Bityutskiy
