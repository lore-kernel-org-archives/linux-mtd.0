Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OMhwn-0007Rs-7e
	for linux-mtd@lists.infradead.org; Thu, 10 Jun 2010 13:37:29 +0000
Message-ID: <4C10EA92.5020505@parrot.com>
Date: Thu, 10 Jun 2010 15:37:22 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: [PATCH] ubi : generate random image_seq when attaching empty
	MTD device
References: <4C07B8C3.7080304@parrot.com> <1275986730.4535.0.camel@localhost>
In-Reply-To: <1275986730.4535.0.camel@localhost>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy a écrit :
> On Thu, 2010-06-03 at 16:14 +0200, Matthieu CASTET wrote:
>> generate random image_seq when attaching empty MTD device (kernel do the 
>> ubi formating).
> 
> Your patch did not apply to the ubi-2.6.git master, because it
> conflicted with my latest changes. But I amended it and pushed, but you
> should probably check.
> 
It looks fine.

Thanks.
