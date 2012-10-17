Received: from mout2.freenet.de ([2001:748:100:40::2:4])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TOb6g-0005wh-MT
 for linux-mtd@lists.infradead.org; Wed, 17 Oct 2012 21:24:51 +0000
Message-ID: <507F219A.4000700@freenet.de>
Date: Wed, 17 Oct 2012 23:22:34 +0200
From: Thomas Betker <thomas.betker@freenet.de>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH RESEND] jffs2: Fix lock acquisition order bug in
 jffs2_write_begin
References: <507321E6.1050609@freenet.de> <507476E7.8030705@freenet.de>
 <1350477742.5769.144.camel@sauron.fi.intel.com>
In-Reply-To: <1350477742.5769.144.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, thomas.betker@rohde-schwarz.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Artem,

I have mailed theupdated patch to the list as "[PATCH v3] ...".

> This patch does not apply to l2-mtd.git, which is based on 3.7-rc1.
>
> $:~/git/l2-mtd$ git apply --check ~/tmp/thomas.mbox
> error: patch failed: fs/jffs2/file.c:138
> error: fs/jffs2/file.c: patch does not apply

Fixed, using another mailer ...

> Could you please wrap commit message lines to 80 characters when you
> re-send?

Fixed -- sorry, this should not have happened.

> Also, would you please add Cc: stable@vger.kernel.org [vX.Y+], where
> vX.Y is the starting version for which this patch is relevant, e.g.,
> v3.0.

Fixed, using [v3.4+]. (The patch may also be relevant for earlier kernel versions, but I don't have the means to test them.)

Thanks,
Thomas
