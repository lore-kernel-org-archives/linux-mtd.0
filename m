Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0U2M-0000Tl-BL
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2010 06:51:39 +0000
Received: by fxm4 with SMTP id 4so4380455fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 27 Sep 2010 23:51:36 -0700 (PDT)
Subject: Re: [PATCH v2] ubifs: avoid kernel error if ubifs superblock read
	fails
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Steffen Sledz <sledz@dresearch.de>
In-Reply-To: <1285590026-11629-1-git-send-email-sledz@dresearch.de>
References: <1285577837.16181.14.camel@localhost>
	<1285590026-11629-1-git-send-email-sledz@dresearch.de>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 28 Sep 2010 09:49:48 +0300
Message-ID: <1285656588.2437.21.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-09-27 at 14:20 +0200, Steffen Sledz wrote:
> * .get_sb is called on mounts with automatic fs detection too, so this
>   function should print an error if it cannot read the superblock in
>   debug mode only
>   (new behaviour conforms the other fs types)
> 
> Signed-off-by: Steffen Sledz <sledz@dresearch.de>

Pushed to ubifs-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
