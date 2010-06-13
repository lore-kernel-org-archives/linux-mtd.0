Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1ONkF6-0005OZ-F5
	for linux-mtd@lists.infradead.org; Sun, 13 Jun 2010 10:16:41 +0000
Subject: Re: Fix mtd-utils bugs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Stanley.Miao" <stanley.miao@windriver.com>
In-Reply-To: <1276422718.19028.211.camel@localhost>
References: <1276248975-1822-1-git-send-email-stanley.miao@windriver.com>
	<1276422718.19028.211.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 13 Jun 2010 13:14:08 +0300
Message-ID: <1276424048.19028.217.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-06-13 at 12:51 +0300, Artem Bityutskiy wrote:
> On Fri, 2010-06-11 at 17:36 +0800, Stanley.Miao wrote:
> > Re-send them because I didn't give a email subject in last version.
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
> Please, make sure your submissions have proper version. I have limited
> amount of time and do not want to spend it figuring out which patch is
> the latest. Use the best kernel practices and apply prefix your stuff
> with [PATCHv3] or something like that.
> 
> Could you please re-submit your latest version?

Also, it is nice to put a short changelog, but I can live without it.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
