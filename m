Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QLxrI-0006KQ-Un
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 13:29:18 +0000
Received: by eyh6 with SMTP id 6so1457020eyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 16 May 2011 06:29:14 -0700 (PDT)
Subject: Re: [PATCH] mtd: convert to seq_file interface
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Alexey Dobriyan <adobriyan@gmail.com>
In-Reply-To: <20110513203419.GA29261@p183>
References: <20110513203419.GA29261@p183>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 16 May 2011 16:25:51 +0300
Message-ID: <1305552351.2630.4.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
	dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-05-13 at 23:34 +0300, Alexey Dobriyan wrote:
> ->read_proc interface is going away, switch to seq_file.
> 
> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> ---
> 
>  drivers/mtd/mtdcore.c |   50 +++++++++++++++++++-------------------------------
>  1 file changed, 19 insertions(+), 31 deletions(-)

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
