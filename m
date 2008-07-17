Received: from smtp6-g19.free.fr ([212.27.42.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KJQfF-0005R6-Ko
	for linux-mtd@lists.infradead.org; Thu, 17 Jul 2008 10:24:45 +0000
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <Uwe.Kleine-Koenig@digi.com>
Subject: Re: [PATCH] [MTD] physmap: only call suspend and resume callbacks if
	non-NULL
References: <20080715130316.GA1617@digi.com>
	<1216127652-2318-1-git-send-email-Uwe.Kleine-Koenig@digi.com>
From: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Thu, 17 Jul 2008 12:24:42 +0200
In-Reply-To: <1216127652-2318-1-git-send-email-Uwe.Kleine-Koenig@digi.com>
	("Uwe =?utf-8?Q?Kleine-K=C3=B6nig=22's?= message of "Tue\, 15 Jul 2008
	15\:14\:11 +0200")
Message-ID: <877ibkbyfp.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Uwe Kleine-K=C3=B6nig <Uwe.Kleine-Koenig@digi.com> writes:

> Signed-off-by: Uwe Kleine-K=C3=B6nig <Uwe.Kleine-Koenig@digi.com>
> ---
>  drivers/mtd/maps/physmap.c |   12 ++++++++----
>  1 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
> index 183255f..f04061f 100644
> --- a/drivers/mtd/maps/physmap.c
> +++ b/drivers/mtd/maps/physmap.c
> @@ -202,8 +202,10 @@ static int physmap_flash_suspend(struct platform_dev=
ice *dev, pm_message_t state
The same patch was submitted to this ML a while ago,
http://lists.infradead.org/pipermail/linux-mtd/2008-June/022023.html

It has not made it's way upstream, though ...

--
Robert
