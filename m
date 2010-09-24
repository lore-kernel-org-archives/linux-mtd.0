Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oz419-0002os-RA
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 08:52:32 +0000
Received: by fxm4 with SMTP id 4so2040757fxm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Sep 2010 01:52:30 -0700 (PDT)
Subject: Re: [PATCH v2] nandwrite: add --nobad to write bad blocks
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1285272255-6980-1-git-send-email-vapier@gentoo.org>
References: <1285238285.29268.28.camel@localhost>
	<1285272255-6980-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 24 Sep 2010 11:50:49 +0300
Message-ID: <1285318249.29268.163.camel@localhost>
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

On Thu, 2010-09-23 at 16:04 -0400, Mike Frysinger wrote:
> Sometimes dumping bad blocks is useful, like when the block isn't actually
> bad but the OOB layout isn't what the kernel is expecting or is otherwise
> screwed up.  The --nobad option allows just that.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
> v2
> 	- rename --nobad to --noskipbad

Amended the comments and pushed, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
