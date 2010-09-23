Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OyjDT-00014b-8M
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 10:39:52 +0000
Received: by fxm4 with SMTP id 4so1210212fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Sep 2010 03:39:49 -0700 (PDT)
Subject: Re: [PATCH] nandwrite: add --nobad to write bad blocks
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1284263480-31573-1-git-send-email-vapier@gentoo.org>
References: <1284263480-31573-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 23 Sep 2010 13:38:05 +0300
Message-ID: <1285238285.29268.28.camel@localhost>
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
> ---
>  nandwrite.c |   10 +++++++++-
>  1 files changed, 9 insertions(+), 1 deletions(-)

Let's merge this. But other people were unhappy about --nobad name and
suggested --noskipbad, and this was done for nanddump. Let's use
consistent name for nandwrite, would you please tweak the patch and
re-send?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
