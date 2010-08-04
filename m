Received: from mgw-sa02.nokia.com ([147.243.1.48])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OgY2l-0003is-Dq
	for linux-mtd@lists.infradead.org; Wed, 04 Aug 2010 07:05:41 +0000
Subject: Re: [PATCH v3] Fix mtd-utils bugs
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: "Stanley.Miao" <stanley.miao@windriver.com>
In-Reply-To: <1279442414.16247.39.camel@localhost.localdomain>
References: <1277036580-3501-1-git-send-email-stanley.miao@windriver.com>
	<1279442414.16247.39.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 04 Aug 2010 10:04:33 +0300
Message-ID: <1280905473.15689.68.camel@localhost>
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

On Sun, 2010-07-18 at 11:40 +0300, Artem Bityutskiy wrote:
> On Sun, 2010-06-20 at 20:22 +0800, Stanley.Miao wrote:
> > Changes from V2:
> > 1, Get the linux version via uname() according to Joakim Tjernlund.
> > 2, Set the default version the latest version according to Joakim Tjernlund.
> > 
> > The "struct nand_oobinfo" is able to record only 32 ECC code positions,which
> > is not enough for many big NAND chips. Therefore, this structure is replaced
> > by "struct nand_ecclayout" in linux kernel from the version 2.6.17.
> > Consequently, the ioctl command changed from MEMGETOOBSEL to ECCGETLAYOUT.
> > 
> > Now update nandwrite to use the new ioctl command ECCGETLAYOUT. In order to
> > keep compatible with the old linux kernel, a linux version detection function
> > is added.
> > 
> > YAFFS and JFFS2 has updated and we don't need the arguments "forcelegacy",
> > "forcejffs2", "forceyaffs" anymore. Now clean them up. 
> 
> Stanley, sorry that this all takes so long time, I do not have enough
> time. Basically, Kevin's patches are almost there, I sent him 2 other
> patches, as soon as he reviews them, they should go in. Then you can
> start using libmtd for your purposes as well. You'll need to extend it a
> bit, though.
> 
> Vs. uname() - I do not really like this idea, because kernel version
> does not cover the case when ECCGETLAYOUT is back-ported to older
> kernels.
> 
> Try to use similar technique as Kevin used - just call ECCGETLAYOUT
> ioctl, and if it returns ENOTTY, this ioctl is not supported. See also
> offs64_ioctl flag handling in my patches to Kevin (sent 1 yesterday, and
> 1 today).

Just a reminder than now we have Kevin's patches in and you can do your
things on top.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
