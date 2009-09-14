Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MnD9d-0004Em-9c
	for linux-mtd@lists.infradead.org; Mon, 14 Sep 2009 15:07:49 +0000
Subject: Re: [PATCH] MTD: Correct misspelled Kconfig var
	CONFIG_MTD_DATAFLASH_VERIFY_WRITE
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
In-Reply-To: <alpine.LFD.2.00.0909110543410.11692@localhost>
References: <alpine.LFD.2.00.0909110543410.11692@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Sep 2009 18:07:11 +0300
Message-Id: <1252940831.5060.104.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-09-11 at 05:44 -0400, Robert P. J. Day wrote:
> Make the source file correction CONFIG_MTD_DATAFLASH_VERIFY_WRITE ->
> CONFIG_MTD_DATAFLASH_WRITE_VERIFY to match the Kconfig variable in
> drivers/mtd/devices/Kconfig.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

Actually, a patch you sent earlier is already in the mtd-2.6.git tree:
http://git.infradead.org/mtd-2.6.git/commit/05dd180709fca14fbae617c0dab1bed56be334fc

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
