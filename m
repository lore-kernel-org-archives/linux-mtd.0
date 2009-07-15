Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MQz8c-00041x-2J
	for linux-mtd@lists.infradead.org; Wed, 15 Jul 2009 07:42:57 +0000
Subject: Re: [PATCH] mtdblock: introduce mtdblks_lock
From: Artem Bityutskiy <dedekind@infradead.org>
To: Matthias Kaehlcke <matthias@kaehlcke.net>
In-Reply-To: <20090714200429.GD18774@darwin>
References: <20090714200429.GD18774@darwin>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 15 Jul 2009 10:41:54 +0300
Message-Id: <1247643714.11353.11.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-07-14 at 22:04 +0200, Matthias Kaehlcke wrote:
> +static struct mutex mtdblks_lock;
> +
>  /*
>   * Cache stuff...
>   *
> @@ -270,6 +272,8 @@ static int mtdblock_open(struct mtd_blktrans_dev *mbd)
>  
>  	DEBUG(MTD_DEBUG_LEVEL1,"mtdblock_open\n");
>  
> +	mutex_lock(&mtdblks_lock);
> +
>  	if (mtdblks[dev]) {
>  		mtdblks[dev]->count++;
>  		return 0;

Now about unlocking the mutex here?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
