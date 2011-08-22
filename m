Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QvP7U-0000l8-Eg
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2011 07:40:29 +0000
Received: by gyh20 with SMTP id 20so4165216gyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Aug 2011 00:40:26 -0700 (PDT)
Subject: Re: [PATCHv3] UBI: new module ubiblk: block layer on top of UBI
From: Artem Bityutskiy <dedekind1@gmail.com>
To: david.wagner@free-electrons.com
Date: Mon, 22 Aug 2011 10:42:13 +0300
In-Reply-To: <1313587042-30846-1-git-send-email-david.wagner@free-electrons.com>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
	<1313587042-30846-1-git-send-email-david.wagner@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1313998939.2644.52.camel@sauron>
Mime-Version: 1.0
Cc: linux-embedded <linux-embedded@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, lkml <linux-kernel@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>, Tim Bird <tim.bird@am.sony.com>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-08-17 at 15:17 +0200, david.wagner@free-electrons.com
wrote:
> Questions:
> ==========
> I wasn't sure what magic ioctl number to use, so I settled to use the same one
> as a part of UBI: 'O', which was so far only used by UBI but on a higher range
> and leaving some room for UBI to add ioctls (for nw, it uses 'O'/0x00-0x06 and
> ubiblk uses 'O'/0x10-0x11).  Is it ok or should ubiblk use a different
> number/range ?

I think this is OK to share them between UBI and ubiblk, as long as this
is documented. But I always CC Arnd when it comes to ioctl-related
questions.

P.S. Arnd, you can always find the initial post in lkml, if needed.

-- 
Best Regards,
Artem Bityutskiy
