Subject: Re: [PATCH] mtd: maps/sa1100: fix section mismatch
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Artamonow <mad_soft@inbox.ru>
In-Reply-To: <1255076329-15065-1-git-send-email-mad_soft@inbox.ru>
References: <1255076329-15065-1-git-send-email-mad_soft@inbox.ru>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 11 Oct 2009 16:41:46 +0300
Message-Id: <1255268506.16942.77.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Russell King <linux@arm.linux.org.uk>, Nicolas Pitre <nico@fluxnic.net>,
	linux-mtd@lists.infradead.org,
	Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-10-09 at 12:18 +0400, Dmitry Artamonow wrote:
> Commit f0b1e589 changed sa1100_mtd_probe from __init to __devinit,
> but missed to correct sa1100_setup_mtd definition accordingly, which
> causes following warning:
> 
> WARNING: vmlinux.o(.devinit.text+0xf4): Section mismatch in reference from
>  the function sa1100_mtd_probe() to the function .init.text:sa1100_setup_mtd()
> The function __devinit sa1100_mtd_probe() references
> a function __init sa1100_setup_mtd().
> If sa1100_setup_mtd is only used by sa1100_mtd_probe then
> annotate sa1100_setup_mtd with a matching annotation.
> 
> Signed-off-by: Dmitry Artamonow <mad_soft@inbox.ru>

Added to my l2-mtd-2.6.git tree:

http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commit/232216ec8d423a222ae113bd15691d66a1e6d957

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
