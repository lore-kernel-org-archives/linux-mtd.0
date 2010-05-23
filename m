Received: from mail-yw0-f188.google.com ([209.85.211.188])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OG5Xf-0005HX-VH
	for linux-mtd@lists.infradead.org; Sun, 23 May 2010 07:24:12 +0000
Received: by ywh26 with SMTP id 26so1187242ywh.12
	for <linux-mtd@lists.infradead.org>;
	Sun, 23 May 2010 00:24:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1263541814-6642-2-git-send-email-21cnbao@gmail.com>
References: <1263541814-6642-1-git-send-email-21cnbao@gmail.com>
	<1263541814-6642-2-git-send-email-21cnbao@gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Sun, 23 May 2010 03:23:50 -0400
Message-ID: <AANLkTilWGNgBvg1Kg0OlmIv1shPwHRLrKjLojHNUz75l@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd-physmap: add support users can assign the probe
	type in board files
To: dwmw2@infradead.org
Content-Type: text/plain; charset=UTF-8
Cc: uclinux-dist-devel@blackfin.uclinux.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 15, 2010 at 03:50, Barry Song wrote:
> There are three reasons to add this support:
> 1. users probably know the interface type of their flashs, then probe
> can be faster if they give the right type in platform data since wrong
> types will not be detected.
> 2. sometimes, detecting can cause destory to system. For example, for
> kernel XIP, detecting can cause NOR enter a mode instructions can not
> be fetched right, which will make kernel crash.
> 3. For a new probe which is not listed in the rom_probe_types, if users
> assign it in board files, physmap can still probe it.

any input on this patch ?  doesnt seem to be in post 2.6.34 merges ...
-mike
