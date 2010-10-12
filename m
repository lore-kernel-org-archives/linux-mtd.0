Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P5afi-0002yA-Q1
	for linux-mtd@lists.infradead.org; Tue, 12 Oct 2010 08:57:23 +0000
Received: by ewy7 with SMTP id 7so783889ewy.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Oct 2010 01:57:21 -0700 (PDT)
Subject: Re: [PATCH] jffs2: Reduce excessive scan of empty blocks
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
In-Reply-To: <1286471374-25840-1-git-send-email-Joakim.Tjernlund@transmode.se>
References: <1286471374-25840-1-git-send-email-Joakim.Tjernlund@transmode.se>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 12 Oct 2010 11:54:33 +0300
Message-ID: <1286873673.2164.7.camel@localhost>
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

On Thu, 2010-10-07 at 19:09 +0200, Joakim Tjernlund wrote:
> Scanning 1024 bytes to see if an EB is empty is a bit much.
> Lower it to 256 bytes and make sure the while loop is
> optimized.
> 
> Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> ---
>  fs/jffs2/scan.c |   12 ++++++------
>  1 files changed, 6 insertions(+), 6 deletions(-)

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
