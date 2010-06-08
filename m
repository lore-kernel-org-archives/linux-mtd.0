Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OLvCu-0004tJ-8B
	for linux-mtd@lists.infradead.org; Tue, 08 Jun 2010 09:34:52 +0000
Subject: Re: [PATCH] ubi : generate random image_seq when attaching empty
	MTD device
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <4C07B8C3.7080304@parrot.com>
References: <4C07B8C3.7080304@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 08 Jun 2010 11:45:30 +0300
Message-ID: <1275986730.4535.0.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-06-03 at 16:14 +0200, Matthieu CASTET wrote:
> generate random image_seq when attaching empty MTD device (kernel do the 
> ubi formating).

Your patch did not apply to the ubi-2.6.git master, because it
conflicted with my latest changes. But I amended it and pushed, but you
should probably check.

Thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
