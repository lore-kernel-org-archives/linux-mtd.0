Received: from mail-fx0-f209.google.com ([209.85.220.209])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NcBtD-0000NG-W1
	for linux-mtd@lists.infradead.org; Tue, 02 Feb 2010 06:05:36 +0000
Received: by fxm1 with SMTP id 1so2165322fxm.4
	for <linux-mtd@lists.infradead.org>;
	Mon, 01 Feb 2010 22:05:30 -0800 (PST)
Subject: Re: [PATCH] [JFFS2] Readpages using Read-While-Load feature
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Amul Kumar Saha <amul.saha@samsung.com>
In-Reply-To: <A71F4C904C9343EB9DA2088AEF89D2E3@sisodomain.com>
References: <A71F4C904C9343EB9DA2088AEF89D2E3@sisodomain.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 02 Feb 2010 08:05:24 +0200
Message-Id: <1265090724.2517.16.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, kyungmin.park@samsung.com,
	linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-01-19 at 09:58 +0530, Amul Kumar Saha wrote:
> JFFS2-Readpages patch makes use of the Read-While-Load support
> present on OneNAND variant devices. There is an increase
> in the read-speed by ~13% upon usage of the readpages patch.
> 
> Signed-off-by: Rajshekar Hanumantappa Payagond <rajshekar.hp@samsung.com>
> Signed-off-by: Amul Kumar Saha <amul.saha@samsung.com>
> ---
>  file.c     |   89 ++++++++++++++++
>  nodelist.h |    9 +
>  read.c     |  333 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 431 insertions(+)

Pushed your patch to my l2-mtd-2.6.git / dunno

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
