Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OWkyM-0005aJ-Q2
	for linux-mtd@lists.infradead.org; Thu, 08 Jul 2010 06:52:39 +0000
Subject: Re: [PATCH v3] Fix mtd-utils bugs
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: "Stanley.Miao" <stanley.miao@windriver.com>, Kevin Cernekee
	<cernekee@gmail.com>, Ladislav Michl <ladis@linux-mips.org>
In-Reply-To: <1277036580-3501-1-git-send-email-stanley.miao@windriver.com>
References: <1277036580-3501-1-git-send-email-stanley.miao@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 08 Jul 2010 09:47:52 +0300
Message-ID: <1278571672.12733.54.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, joakim.tjernlund@transmode.se
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-06-20 at 20:22 +0800, Stanley.Miao wrote:
> Changes from V2:
> 1, Get the linux version via uname() according to Joakim Tjernlund.
> 2, Set the default version the latest version according to Joakim Tjernlund.
> 
> The "struct nand_oobinfo" is able to record only 32 ECC code positions,which
> is not enough for many big NAND chips. Therefore, this structure is replaced
> by "struct nand_ecclayout" in linux kernel from the version 2.6.17.
> Consequently, the ioctl command changed from MEMGETOOBSEL to ECCGETLAYOUT.
> 
> Now update nandwrite to use the new ioctl command ECCGETLAYOUT. In order to
> keep compatible with the old linux kernel, a linux version detection function
> is added.
> 
> YAFFS and JFFS2 has updated and we don't need the arguments "forcelegacy",
> "forcejffs2", "forceyaffs" anymore. Now clean them up. 

Stanley,

I'd like to first take patches from Kevin, which move libmtd from
ubi-utils and make mtd utilities like flash_eraseall start using libmtd.

It would be nice then if you enhanced limbtd to serve your perposes and
also used it, instead of direct ioctl calls. libmtd should also be used
to get information about which features are supported.

Will this upset you much :-) ?

You can find Kevin's patches I refer in the MTD miling list. The last
series to the date are:

[PATCHv2 1/5] mtd-utils: move libmtd source files to lib/ subdirectory

Could you please take a look at them, review them, then when everyone is
happy, we merge them to mtd-utils, then you can do your changes on top,
and we also add the patch from Ladislav on top.

Does this sound OK for you?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
