Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SVNgZ-0005zO-O7
 for linux-mtd@lists.infradead.org; Fri, 18 May 2012 13:57:41 +0000
Received: by laap9 with SMTP id p9so2628648laa.36
 for <linux-mtd@lists.infradead.org>; Fri, 18 May 2012 06:57:36 -0700 (PDT)
Date: Fri, 18 May 2012 15:57:29 +0200
From: Frank Svendsboe <frank.svendsboe@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] mtd: Fix typo in Kconfig
Message-ID: <20120518135729.GA11703@gnubox>
References: <1337287389-28386-1-git-send-email-frank.svendsboe@gmail.com>
 <1337338834.2483.21.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1337338834.2483.21.camel@sauron.fi.intel.com>
Cc: dbaryshkov@gmail.com, linuxppc-dev@lists.ozlabs.org,
 randy.dunlap@oracle.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 18, 2012 at 02:00:34PM +0300, Artem Bityutskiy wrote:
> On Thu, 2012-05-17 at 22:43 +0200, Frank Svendsboe wrote:
> > MTD_OF_PARTS and the default setting is not working due to using 'Y'
> > instead of 'y', introduced in commit
> > d6137badeff1ef64b4e0092ec249ebdeaeb3ff37. This made our board, and
> > possibly other boards using DTS defined partitions and not having
> > CONFIG_MTD_OF_PARTS=y defined in the defconfig, fail to mount root
> > after v3.1.
> 
> The commit was released in v3.2, so it not v3.1 probably?
>

It was committed between 3.1 and 3.2-rc1. I said _after_ 3.1, so it is
not completely wrong either. Feel free to change to commit message, or
I can resend the patch if you want me to.

> > Signed-off-by: Frank Svendsboe <frank.svendsboe@gmail.com>
> 
> I've amended the subject to make it look scarier than just a fix of a
> typo, added a tag for the stable tree, and pushed to l2-mtd.git, thanks!
> 
> commit aa2465b2d5d44defb269ac66a2d2b6e6b8feb399
> Author: Frank Svendsboe <frank.svendsboe@gmail.com>
> Date:   Thu May 17 22:43:09 2012 +0200
> 
>     mtd: of_parts: fix breakage in Kconfig
>     
>     MTD_OF_PARTS and the default setting is not working due to using 'Y'
>     instead of 'y', introduced in commit
>     d6137badeff1ef64b4e0092ec249ebdeaeb3ff37. This made our board, and
>     possibly other boards using DTS defined partitions and not having
>     CONFIG_MTD_OF_PARTS=y defined in the defconfig, fail to mount root.
>     
>     Signed-off-by: Frank Svendsboe <frank.svendsboe@gmail.com>
>     Cc: stable@kernel.org [3.2+]
>     Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 

Great. Thanks!

-- 
Best regards,
Frank
