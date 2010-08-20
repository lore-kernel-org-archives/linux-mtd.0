Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OmKAa-0005ND-Fm
	for linux-mtd@lists.infradead.org; Fri, 20 Aug 2010 05:29:37 +0000
Received: by fxm12 with SMTP id 12so1827844fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 Aug 2010 22:29:33 -0700 (PDT)
Subject: Re: [PATCH v3] Fix mtd-utils bugs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ladislav Michl <ladis@linux-mips.org>
In-Reply-To: <20100623151622.GA2771@localhost.localdomain>
References: <1277036580-3501-1-git-send-email-stanley.miao@windriver.com>
	<20100623151622.GA2771@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 20 Aug 2010 08:29:28 +0300
Message-ID: <1282282168.2183.2.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Stanley.Miao" <stanley.miao@windriver.com>, linux-mtd@lists.infradead.org,
	joakim.tjernlund@transmode.se, Artem.Bityutskiy@nokia.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-06-23 at 17:16 +0200, Ladislav Michl wrote:
> On Sun, Jun 20, 2010 at 08:22:57PM +0800, Stanley.Miao wrote:
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
> Tested with linux-2.6.32 (flash_eraseall -j finaly works now)
> 
> Tested-by: Ladislav Michl <ladis@linux-mips.org>
> 
> As a special bonus, here is simple patch on top of your patchset making
> flash_eraseall smaller:
> 

FYI, this patch is still sitting in my mailbox and waiting - Stanley's
stuff was not merged, and this patch depends on that. So, if you can
make it to be independent, please, re-send. Stanley said he'd re-send
the patch.

But also there is some ongoing discussion to deprecate ECCGETLAYOUT, but
I did not read it yet.

Artem.
