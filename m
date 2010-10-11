Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P5Nz3-0004Hy-Af
	for linux-mtd@lists.infradead.org; Mon, 11 Oct 2010 19:24:30 +0000
Received: by bwz7 with SMTP id 7so897802bwz.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 11 Oct 2010 12:24:27 -0700 (PDT)
Subject: Re: [RFC] do_mounts: Allow mtd names for non-flash block filesystems
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Karl Beldan <karl.beldan@gmail.com>
In-Reply-To: <1286398974-12114-1-git-send-email-karl.beldan@gmail.com>
References: <1286398974-12114-1-git-send-email-karl.beldan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 11 Oct 2010 22:24:23 +0300
Message-ID: <1286825063.1742.13.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-10-06 at 23:02 +0200, Karl Beldan wrote:
> Hi,
> 
> I have been using this tweak for some time now, and I am getting tired of 
> having to resort to it so often.
> It allows to pass such cmdline root as: 
>  "root=mtdb:ubivolx rootfstype=squashfs"
> I am pretty sure many people use squashfs/cramfs filesystems on top of nand, 
> for example, and I thought that this might initiate discussion.
> 
> -- 
> Karl
> 
> Signed-off-by: Karl Beldan <karl.beldan@gmail.com>
> ---
>  init/do_mounts.c |   15 +++++++++++++--
>  1 files changed, 13 insertions(+), 2 deletions(-)

Dunno... 

First of all, if you have to do this, let it be mtdblock, not mtdb - no
need to breed aliases.

But how about teaching squashfs to understand mtdX and mtd:name syntax
instead?

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
