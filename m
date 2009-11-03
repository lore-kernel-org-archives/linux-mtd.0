Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N5CoI-0005oH-C4
	for linux-mtd@lists.infradead.org; Tue, 03 Nov 2009 06:24:11 +0000
Subject: Re: [PATCH v12 3/4]: mtdoops: Make page (record) size configurable
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
In-Reply-To: <20091029134119.7452f327@marrow.netinsight.se>
References: <20091015094057.7298e0d7@marrow.netinsight.se>
	<20091029133535.2ea65f72@marrow.netinsight.se>
	<20091029134119.7452f327@marrow.netinsight.se>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 03 Nov 2009 08:23:58 +0200
Message-Id: <1257229438.21596.28.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-10-29 at 13:41 +0100, Simon Kagstrom wrote:
> The main justification for this is to allow catching long messages
> during a panic, where the top part might otherwise be lost since moving
> to the next block can require a flash erase.
> 
> Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
> Reviewed-by: Anders Grafstrom <anders.grafstrom@netinsight.net>
> ---
> ChangeLog:
>  * Rebased over "[PATCH v12 2/4]: mtdoops: Add a maximum MTD partition size"
> 
>  drivers/mtd/mtdoops.c |   75 ++++++++++++++++++++++++++++--------------------
>  1 files changed, 44 insertions(+), 31 deletions(-)

Pushed this one to my tree, on top of the previous patch which I
tweaked, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
