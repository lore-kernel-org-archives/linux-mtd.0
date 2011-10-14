Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1REdgy-0001FU-FN
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2011 09:04:36 +0000
Received: by wwg9 with SMTP id 9so560127wwg.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2011 02:04:34 -0700 (PDT)
Subject: Re: [PATCH V6] mtd: Add DiskOnChip G3 support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Fri, 14 Oct 2011 12:04:03 +0300
In-Reply-To: <1317820954-24902-1-git-send-email-robert.jarzmik@free.fr>
References: <1317820954-24902-1-git-send-email-robert.jarzmik@free.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1318583051.12351.75.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org, arnd@arndb.de
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-10-05 at 15:22 +0200, Robert Jarzmik wrote:
> Add support for DiskOnChip G3 chips. The support is quite
> limited yet :
>  - no flash writes/erases are implemented
>  - ECC fixes are not implemented
>  - powerdown is not implemented
>  - IPL handling is not yet done
> 
> On the brighter side, the chip reading does work.
> 
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
