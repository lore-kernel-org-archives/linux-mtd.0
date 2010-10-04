Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P2fej-0005Mv-Ff
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2010 07:40:17 +0000
Received: by fxm15 with SMTP id 15so3783513fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 04 Oct 2010 00:40:15 -0700 (PDT)
Subject: Re: [PATCH v2] jffs2reader: convert to common.h helpers
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1286045889-25811-1-git-send-email-vapier@gentoo.org>
References: <1285953246-19729-1-git-send-email-vapier@gentoo.org>
	<1286045889-25811-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 04 Oct 2010 10:37:29 +0300
Message-ID: <1286177849.11684.76.camel@localhost>
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

On Sat, 2010-10-02 at 14:58 -0400, Mike Frysinger wrote:
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
> v2
> 	- fix a few thinkos in previous patch
> 
>  jffs2reader.c |   71 +++++++++++++++++---------------------------------------
>  1 files changed, 22 insertions(+), 49 deletions(-)

Pushed, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
