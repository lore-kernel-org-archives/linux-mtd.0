Received: from nbd.name ([46.4.11.11])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QPtJC-0000zt-Kx
	for linux-mtd@lists.infradead.org; Fri, 27 May 2011 09:26:19 +0000
Message-ID: <4DDF6E94.3020203@openwrt.org>
Date: Fri, 27 May 2011 11:27:48 +0200
From: John Crispin <blogic@openwrt.org>
MIME-Version: 1.0
To: Jamie Iles <jamie@jamieiles.com>
Subject: Re: [PATCH 60/62] mtd/lantiq: convert to mtd_device_register()
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
	<1306142623-24952-61-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1306142623-24952-61-git-send-email-jamie@jamieiles.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 23/05/11 11:23, Jamie Iles wrote:
> Convert to mtd_device_register() and remove the CONFIG_MTD_PARTITIONS
> preprocessor conditionals as partitioning is always available.
>
> Cc: John Crispin <blogic@openwrt.org>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Artem Bityutskiy <dedekind1@gmail.com>
> Signed-off-by: Jamie Iles <jamie@jamieiles.com>
> ---
>  drivers/mtd/maps/lantiq-flash.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
>   

Acked-by: John Crispin <blogic@openwrt.org>
