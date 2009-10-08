Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MvlMG-0007Hy-Lb
	for linux-mtd@lists.infradead.org; Thu, 08 Oct 2009 05:16:12 +0000
Subject: Re: [PATCH v2, Repost]: NAND: Add panic_write for NAND flashes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
In-Reply-To: <20091005155552.3f2e89b8@marrow.netinsight.se>
References: <20091001140959.60364dbe@marrow.netinsight.se>
	<20091002101431.GI9644@edde.se.axis.com>
	<20091005155552.3f2e89b8@marrow.netinsight.se>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 08 Oct 2009 08:15:58 +0300
Message-Id: <1254978958.3359.20.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org,
	"Edgar E. Iglesias" <edgar.iglesias@axis.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-10-05 at 15:55 +0200, Simon Kagstrom wrote:
> This is a quick and dirty patch to add panic_write for NAND flashes. The
> patch seems to work OK on my CRIS board running a 2.6.26 kernel with a
> ID: 0x20, Chip ID: 0xf1 (ST Micro NAND 128MiB 3,3V 8-bit), and also on a
> OpenRD base (Marvell Kirkwood) board with a Toshiba NAND 512MiB 3,3V
> 8-bit flash with 2.6.32-pre1.
> 
> Signed-off-by: Edgar E. Iglesias <edgar@axis.com>
> Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
> ---
> ChangeLog:
> v2: Fix issues from Artem
>   * Fix comments about 400ms and question marks
>   * Add oops_in_progress to panic_nand_wait condition
>   * Change prototype for panic_nand_get_device
>   * Make some changes to the patch description

I've pushed this to my l2-mtd-2.6 tree, thanks:

http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commit/af9fcfdbb514e9d7e15c3b398669af1d0e714837

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
