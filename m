Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FeRZF-0001fZ-3H
	for linux-mtd@lists.infradead.org; Fri, 12 May 2006 02:56:10 -0400
Message-ID: <4464315F.1060802@yandex.ru>
Date: Fri, 12 May 2006 10:55:27 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Husam <husamsenussi@gmail.com>
References: <200605120206.13047.husamsenussi@gmail.com>
In-Reply-To: <200605120206.13047.husamsenussi@gmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Writting to NAND flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Husam wrote:
> Hi,
> 
> If I want to update data in page, do I have to erase the block first then 
> write or can just write to the page.
Unfortunatelly, you have to erase the whole eraseblock first. Flashes 
are not block devices. If they were, we our life would be much easier.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
