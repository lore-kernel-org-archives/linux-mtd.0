Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P5bQb-0000Sh-FY
	for linux-mtd@lists.infradead.org; Tue, 12 Oct 2010 09:45:50 +0000
Received: by ewy7 with SMTP id 7so801298ewy.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Oct 2010 02:45:48 -0700 (PDT)
Subject: Re: [PATCH] mtd: onenand: fix 4KB page onenand chip recognition
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roman Tereshonkov <roman.tereshonkov@nokia.com>
In-Reply-To: <1286797652-13610-1-git-send-email-roman.tereshonkov@nokia.com>
References: <1286797652-13610-1-git-send-email-roman.tereshonkov@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 12 Oct 2010 12:42:59 +0300
Message-ID: <1286876579.2164.30.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: rohit.hs@samsung.com, kyungmin.park@samsung.com,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-10-11 at 14:47 +0300, Roman Tereshonkov wrote:
> For 4Gb non-DDP chip it does not follow that it is always 4KB page chip.
> The number of data buffers is checked and if it is equal to 1
> we suppose that it is 4KB page onenand chip.
> 
> Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
> ---
>  drivers/mtd/onenand/onenand_base.c |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
