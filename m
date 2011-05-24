Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOm13-0005mW-3I
	for linux-mtd@lists.infradead.org; Tue, 24 May 2011 07:26:58 +0000
Received: by ewy3 with SMTP id 3so2365398ewy.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 May 2011 00:26:54 -0700 (PDT)
Subject: Re: [PATCH] mtd: Add DiskOnChip G3 support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
In-Reply-To: <1306074869-5533-1-git-send-email-robert.jarzmik@free.fr>
References: <1306074869-5533-1-git-send-email-robert.jarzmik@free.fr>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 May 2011 10:22:36 +0300
Message-ID: <1306221756.2785.51.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: joern@lazybastard.org, dwmw2@infradead.org,
	Robert Jarzmik <robert.jarzmik@atosorigin.com>,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2011-05-22 at 16:34 +0200, Robert Jarzmik wrote:
> From: Robert Jarzmik <robert.jarzmik@atosorigin.com>
> 
> Add support for DiskOnChip G3 chips. The support is quite
> limited yet :
>  - no flash writes/erases are implemented
>  - ECC fixes are not implemented
>  - powerdown is not implemented
>  - IPL handling is not yet done
> 
> On the brighter side, the chip reading does work.
> 
> Signed-off-by: Robert Jarzmik <robert.jarzmik@atosorigin.com>

Hi,

the driver looks neat from the first glance, but I did not review it. We
have just changed mtd partitions API, today. You'll need to amend the
driver and re-send.

The partitions API changes have not reached the mtd tree, though, they
are sitting in my l2-mtd-2.6.git tree:

http://git.infradead.org/users/dedekind/l2-mtd-2.6.git

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
