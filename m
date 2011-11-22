Received: from mail-gx0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RSxwx-00073e-K9
 for linux-mtd@lists.infradead.org; Tue, 22 Nov 2011 21:32:20 +0000
Received: by ggki1 with SMTP id i1so824067ggk.36
 for <linux-mtd@lists.infradead.org>; Tue, 22 Nov 2011 13:32:18 -0800 (PST)
Subject: Re: [PATCH] Makefile: fix install target with out-of-tree builds
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 22 Nov 2011 23:32:12 +0200
In-Reply-To: <1321736407-8801-1-git-send-email-vapier@gentoo.org>
References: <1321736407-8801-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1321997536.2222.15.camel@koala>
Mime-Version: 1.0
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

On Sat, 2011-11-19 at 16:00 -0500, Mike Frysinger wrote:
> The install target always looks for the compiled binaries in the working
> directory which breaks when doing something like `make CHOST=... install`.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed both Makefile fixes, thank you!

Artem.
