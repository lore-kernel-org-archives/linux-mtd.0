Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MaOkJ-00047p-Gl
	for linux-mtd@lists.infradead.org; Mon, 10 Aug 2009 06:52:43 +0000
Message-ID: <4A7FC319.30209@gmail.com>
Date: Mon, 10 Aug 2009 09:50:01 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: nsnehaprabha@ti.com
Subject: Re: [PATCH v4 3/3] mtd-nand: DaVinci: Add 4-bit ECC support for large
	page NAND chips
References: <1249678139-23795-1-git-send-email-nsnehaprabha@ti.com>
In-Reply-To: <1249678139-23795-1-git-send-email-nsnehaprabha@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: davinci-linux-open-source@linux.davincidsp.com,
	Sandeep Paulraj <s-paulraj@ti.com>,
	linux-mtd@lists.infradead.org, tglx@linutronix.de,
	dwmw2@infradead.org, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/07/2009 11:48 PM, nsnehaprabha@ti.com wrote:
> From: Sneha Narnakaje<nsnehaprabha@ti.com>
>
> This patch adds 4-bit ECC support for large page NAND chips using the new ECC
> mode NAND_ECC_HW_OOB_FIRST. The platform data from board-dm355-evm has been
> adjusted to use this mode.
>
> The patches have been verified on DM355 device with 2K Micron devices using
> mtd-tests and JFFS2. Error correction upto 4-bits has also been verified using
> nandwrite/nanddump utilities.
>
> This patch series applies to linux-mtd next (mmotm) GIT tree.
>
> This version (v4) addresses the review comment to leave 2 bytes at offset 0
> for NAND manufacturer badblock markers.
>
> Reviewed-by: David Brownell<dbrownell@users.sourceforge.net>
> Signed-off-by: Sneha Narnakaje<nsnehaprabha@ti.com>
> Signed-off-by: Sandeep Paulraj<s-paulraj@ti.com>

There are already 3 patches in my l2-mtd-2.6.git tree:

http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commit/d391d866060d31884c6fc0fe459b3d9ee0a8fd4c
http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commit/5284a62fc7a526db9db1c922208e07b7fc442e72
http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commit/8cefbcdbb7d60baddb2db3d8d743b03eb3df619e

Please, verify them and let me know if they are OK or I should drop
them and take other patches.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
