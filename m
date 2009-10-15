Date: Thu, 15 Oct 2009 20:53:20 +0400
From: Anton Vorontsov <cbouatmailru@gmail.com>
To: Dmitry Artamonow <mad_soft@inbox.ru>
Subject: Re: [RESEND][PATCH] mtd: maps: remove obsolete ipaq-flash driver
Message-ID: <20091015165320.GA24086@oksana.dev.rtsoft.ru>
References: <1255433694-26471-1-git-send-email-mad_soft@inbox.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1255433694-26471-1-git-send-email-mad_soft@inbox.ru>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Eric Miao <eric.y.miao@gmail.com>, linux-kernel@vger.kernel.org,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	linux-mtd@lists.infradead.org, Anton Vorontsov <cbouatmailru@gmail.com>,
	Russell King <linux@arm.linux.org.uk>,
	David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Reply-To: cbouatmailru@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 13, 2009 at 03:34:54PM +0400, Dmitry Artamonow wrote:
> This driver seems to be obsolete and broken for a long time.
> It depends on CONFIG_IPAQ_HANDHELD that simply doesn't exists
> anywhere in kernel. Also, it seems that none of machines it
> claims to support have any use of it:
>  SA11xx-based iPAQs (h3100/h3600) use sa1100-flash
>  iPAQ h5000 uses physmap-flash
>  Jornada 720 uses sa1100-flash
>  Jornada 560 and iPAQ h1910 are not in mainline
> 
> Signed-off-by: Dmitry Artamonow <mad_soft@inbox.ru>

Acked-by: Anton Vorontsov <cbouatmailru@gmail.com>

Thanks!

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
