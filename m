Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OaPQ4-0008VC-Dn
	for linux-mtd@lists.infradead.org; Sun, 18 Jul 2010 08:40:20 +0000
Received: by fxm3 with SMTP id 3so1948090fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 18 Jul 2010 01:40:18 -0700 (PDT)
Subject: Re: [PATCH v3] Fix mtd-utils bugs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Stanley.Miao" <stanley.miao@windriver.com>
In-Reply-To: <1277036580-3501-1-git-send-email-stanley.miao@windriver.com>
References: <1277036580-3501-1-git-send-email-stanley.miao@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 18 Jul 2010 11:40:14 +0300
Message-Id: <1279442414.16247.39.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Artem.Bityutskiy@nokia.com, linux-mtd@lists.infradead.org,
	joakim.tjernlund@transmode.se
Reply-To: dedekind1@gmail.com
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

Stanley, sorry that this all takes so long time, I do not have enough
time. Basically, Kevin's patches are almost there, I sent him 2 other
patches, as soon as he reviews them, they should go in. Then you can
start using libmtd for your purposes as well. You'll need to extend it a
bit, though.

Vs. uname() - I do not really like this idea, because kernel version
does not cover the case when ECCGETLAYOUT is back-ported to older
kernels.

Try to use similar technique as Kevin used - just call ECCGETLAYOUT
ioctl, and if it returns ENOTTY, this ioctl is not supported. See also
offs64_ioctl flag handling in my patches to Kevin (sent 1 yesterday, and
1 today).

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
