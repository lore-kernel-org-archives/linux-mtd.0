Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OWnBh-0005kn-21
	for linux-mtd@lists.infradead.org; Thu, 08 Jul 2010 09:14:33 +0000
Subject: Re: [PATCH]] mtdconcat: fix bug with uninitialized lock and unlock
	functions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Martin Krause <Martin.Krause@tqs.de>
In-Reply-To: <47F3F98010FF784EBEE6526EAAB078D10635E728@tq-mailsrv.tq-net.de>
References: <47F3F98010FF784EBEE6526EAAB078D10635E728@tq-mailsrv.tq-net.de>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 08 Jul 2010 12:10:29 +0300
Message-ID: <1278580229.12733.74.camel@localhost>
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

On Tue, 2010-06-22 at 15:00 +0200, Martin Krause wrote:
> Test if a lock or unlock function is present (pointer not NULL) before
> calling it, to prevent a kernel dump.
> 
> Signed-off-by: Martin Krause <martin.krause@tqs.de>
> ---
>  drivers/mtd/mtdconcat.c |   18 ++++++++++++------
>  1 files changed, 12 insertions(+), 6 deletions(-)

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
