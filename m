Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Dp3Dm-0002QB-AU
	for linux-mtd@lists.infradead.org; Sun, 03 Jul 2005 08:05:15 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Amit Sharma <amitsharma91@gmail.com>
In-Reply-To: <9185a3fa0507021947cdf3081@mail.gmail.com>
References: <9185a3fa0507021947cdf3081@mail.gmail.com>
Content-Type: text/plain
Date: Sun, 03 Jul 2005 16:04:40 +0400
Message-Id: <1120392280.16978.30.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: (no subject)
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2005-07-03 at 11:47 +0900, Amit Sharma wrote:
> Hi 
> I have problem in MTD driver with jFFS2 mounting on NAND device.During 
> Cp -f /tmp/jffs2.image /dev/mtd/o
> I get error
> "page not aligned "
> 
Don't use cp with NAND flash. Read the FAQ for more details.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
