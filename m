Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P5aaI-0001zp-NI
	for linux-mtd@lists.infradead.org; Tue, 12 Oct 2010 08:51:49 +0000
Received: by ewy7 with SMTP id 7so781900ewy.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Oct 2010 01:51:45 -0700 (PDT)
Subject: Re: [PATCH] jffs2: Do not assume erase will fail
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
In-Reply-To: <1286468986-24627-1-git-send-email-Joakim.Tjernlund@transmode.se>
References: <1286468986-24627-1-git-send-email-Joakim.Tjernlund@transmode.se>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 12 Oct 2010 11:48:57 +0300
Message-ID: <1286873337.2164.6.camel@localhost>
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

On Thu, 2010-10-07 at 18:29 +0200, Joakim Tjernlund wrote:
> Test if it did and then abort.
> 
> Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> ---
>  fs/jffs2/nodemgmt.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
