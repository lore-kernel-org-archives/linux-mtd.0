Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OupQJ-0001jd-5o
	for linux-mtd@lists.infradead.org; Sun, 12 Sep 2010 16:28:59 +0000
Received: by bwz13 with SMTP id 13so5022611bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 12 Sep 2010 09:28:57 -0700 (PDT)
Subject: Re: [PATCH] nandwrite: add --nobad to write bad blocks
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1284263480-31573-1-git-send-email-vapier@gentoo.org>
References: <1284263480-31573-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 12 Sep 2010 19:27:31 +0300
Message-ID: <1284308851.1783.23.camel@brekeke>
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

On Sat, 2010-09-11 at 23:51 -0400, Mike Frysinger wrote:
> Sometimes dumping bad blocks is useful, like when the block isn't actually
> bad but the OOB layout isn't what the kernel is expecting or is otherwise
> screwed up.  The --nobad option allows just that.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

How useful is this? I think instead you should implement the force flag
we discussed and deal with 'otherwise screwed up' eraseblocks with
flash_erase. I am afraid it is too dangerous to introduce this option.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
