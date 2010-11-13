Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PHEo8-0005QR-KW
	for linux-mtd@lists.infradead.org; Sat, 13 Nov 2010 12:02:13 +0000
Received: by bwz5 with SMTP id 5so3974852bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 13 Nov 2010 04:02:11 -0800 (PST)
Subject: Re: [PATCHv2 0/3] mtd: onenand: add cache program feature for 4kb
	page onenand
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roman Tereshonkov <roman.tereshonkov@nokia.com>
In-Reply-To: <1288781721-31771-1-git-send-email-roman.tereshonkov@nokia.com>
References: <1288781721-31771-1-git-send-email-roman.tereshonkov@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 13 Nov 2010 14:01:59 +0200
Message-ID: <1289649719.2218.43.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kyungmin.park@samsung.com, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-11-03 at 12:55 +0200, Roman Tereshonkov wrote:
> Implement cache program feature for 4KB page onenand.
> This feature improves the write data performance.
> The observed 128KB data program speed change is
> from 8827KB/s to 14156 KB/s when the feature is enabled.
> 
> Roman Tereshonkov (3):
>   mtd: onenand: add option and variable for cache program feature
>   mtd: onenand: fix omap2 code to handle cache program feature
>   mtd: onenand: implement cache program feature for 4kb page onenand
> 
>  drivers/mtd/onenand/omap2.c        |   12 +++++++++---
>  drivers/mtd/onenand/onenand_base.c |   22 +++++++++++++++++++---
>  include/linux/mtd/onenand.h        |   12 ++++++++++++
>  3 files changed, 40 insertions(+), 6 deletions(-)

Pushed all 3 patches to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
