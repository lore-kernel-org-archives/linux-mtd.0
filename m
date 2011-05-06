Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QILAb-0007rF-44
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 13:34:13 +0000
Received: by eyh6 with SMTP id 6so1092367eyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 May 2011 06:34:11 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] ubifs: add a superblock flag for free space fix-up
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <BANLkTinhXzObLKjvREqxfOmt35HJ5V9APg@mail.gmail.com>
References: <BANLkTinhXzObLKjvREqxfOmt35HJ5V9APg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 06 May 2011 16:30:38 +0300
Message-ID: <1304688638.7222.59.camel@localhost>
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

On Thu, 2011-05-05 at 16:33 -0400, Matthew L. Creech wrote:
> The space_fixup flag can be set in the superblock of a new filesystem by
> mkfs.ubifs to indicate that any eraseblocks with free space remaining should be
> fixed-up the first time it's mounted (after which the flag is un-set).
> 
> Signed-off-by: Matthew L. Creech <mlcreech@gmail.com>

Hi, I've made the commit message a bit more verbose, and also added fre
comments into the code, for those who will try to figure out what the
flag means in the future. I've also fixed the patch because it is
line-wrapped. And I've applied this one to the ubifs-2.6.git tree to the
master branch.

> index f7515bd..3dce5f3 100644
> --- a/fs/ubifs/debug.c
> +++ b/fs/ubifs/debug.c
> @@ -316,6 +316,8 @@ void dbg_dump_node(const struct ubifs_info *c,
> const void *node)

This should be one line. Using git send-email could help to avoid this.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
