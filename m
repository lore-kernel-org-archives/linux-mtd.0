Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTo1H-0001MP-Mo
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 04:36:00 +0000
Received: by eyh6 with SMTP id 6so1933624eyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 21:35:58 -0700 (PDT)
Subject: Re: [PATCH] ignore (FLAT) gdb files
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1307380501-30946-1-git-send-email-vapier@gentoo.org>
References: <1307380501-30946-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jun 2011 07:31:41 +0300
Message-ID: <1307421101.11104.8.camel@localhost>
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

On Mon, 2011-06-06 at 13:15 -0400, Mike Frysinger wrote:
> Linux FLAT toolchains produce .gdb files alongside the normal program
> for debugging purposes (so linking to "foo" will also produce "foo.gdb").
> Ignore these too.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed this patch to mtd-utils.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
