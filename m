Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUZbw-0001S8-I2
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 07:25:01 +0000
Received: by wyb28 with SMTP id 28so1222572wyb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 00:24:58 -0700 (PDT)
Subject: Re: [PATCH 01/43] mtd: add new API for handling MTD registration
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <1307549152-7085-2-git-send-email-dbaryshkov@gmail.com>
References: <1307549152-7085-1-git-send-email-dbaryshkov@gmail.com>
	<1307549152-7085-2-git-send-email-dbaryshkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 09 Jun 2011 10:20:39 +0300
Message-ID: <1307604039.7374.30.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Russell King <linux@arm.linux.org.uk>, linux-mtd@lists.infradead.org,
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

On Wed, 2011-06-08 at 20:05 +0400, Dmitry Eremin-Solenikov wrote:
> Lots (nearly all) mtd drivers contain nearly the similar code that
> calls parse_mtd_partitions, provides some platform-default values, if
> parsing fails, and registers  mtd device.
> 
> This is an aim to provide single implementation of this scenario:
> mtd_device_parse_register() which will handle all this parsing and
> defaults.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  drivers/mtd/mtdcore.c   |   60 +++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/mtd.h |    5 ++++
>  2 files changed, 65 insertions(+), 0 deletions(-)

I've re-formatted comments - removed no-so-nice-looking tabs, made lines
longer because (my vim can do this). And pushed, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
