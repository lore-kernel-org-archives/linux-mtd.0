Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9mIg-0005kn-EG
	for linux-mtd@lists.infradead.org; Tue, 12 Apr 2011 22:43:11 +0000
Received: by yxh35 with SMTP id 35so20212yxh.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Apr 2011 15:43:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1302646496-32261-1-git-send-email-maksim.rayskiy@gmail.com>
References: <1302646496-32261-1-git-send-email-maksim.rayskiy@gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 12 Apr 2011 18:42:48 -0400
Message-ID: <BANLkTi=O4piTA3ycrGb9Rc1_B6Q6ztHyJA@mail.gmail.com>
Subject: Re: [PATCH v2] Fix gcc-4.5.2 "statement with no effect" warnings in
	UBIFS
To: maksim.rayskiy@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 12, 2011 at 18:14,  <maksim.rayskiy@gmail.com> wrote:
> From: Maksim Rayskiy <maksim.rayskiy@gmail.com>
>
> When compiling UBIFS with CONFIG_UBIFS_FS_DEBUG not set,
> gcc-4.5.2 generates a slew of "warning: statement with no effect"
> on references to non-void functions defined as 0.
> To avoid these warnings, replace #defines with dummy inline functions.

thanks for doing this !
Acked-by: Mike Frysinger <vapier@gentoo.org>
-mike
