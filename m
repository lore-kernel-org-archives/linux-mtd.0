Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1Elkxv-0005Cu-Pi
	for linux-mtd@lists.infradead.org; Mon, 12 Dec 2005 05:31:34 -0500
Message-ID: <439D5159.4030704@yandex.ru>
Date: Mon, 12 Dec 2005 13:30:49 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: "zhao, forrest" <forrest.zhao@intel.com>
References: <439C33D2.506@yandex.ru>
	<1134367675.3152.9.camel@localhost.localdomain>
In-Reply-To: <1134367675.3152.9.camel@localhost.localdomain>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: EBH question 1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

zhao, forrest wrote:
> Yes, it can work. I have tested before checking in the patch.
> In particular it handled the eraseblocks with cleanmarker by
> the old way and cleanmarker is replaced by EBH after an erase
> operation happened to an eraseblock.
> 
Now it doesn't work :-(

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
