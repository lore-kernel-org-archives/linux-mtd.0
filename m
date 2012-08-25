Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5Cfo-000523-R6
 for linux-mtd@lists.infradead.org; Sat, 25 Aug 2012 09:28:57 +0000
Received: by wgbdt14 with SMTP id dt14so738953wgb.18
 for <linux-mtd@lists.infradead.org>; Sat, 25 Aug 2012 02:28:55 -0700 (PDT)
Date: Sat, 25 Aug 2012 12:31:49 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Huang Shijie <shijie8@gmail.com>, dedekind1@gmail.com
Subject: Re: [PATCH v2] mtd: cmdlinepart: fix the wrong check condition
Message-ID: <20120825123149.3fafa4f4@halley>
In-Reply-To: <1345925210-7500-1-git-send-email-shijie8@gmail.com>
References: <1345925210-7500-1-git-send-email-shijie8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang, Artem,

On Sat, 25 Aug 2012 16:06:50 -0400 Huang Shijie <shijie8@gmail.com> wrote:
> diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
> index fc960a3..216d751 100644
> --- a/drivers/mtd/cmdlinepart.c
> +++ b/drivers/mtd/cmdlinepart.c
> @@ -322,13 +322,16 @@ static int parse_cmdline_partitions(struct mtd_info *master,
>  	struct cmdline_mtd_partition *part;
>  	const char *mtd_id = master->name;
>  
> +	if (!mtd_id)
> +		return 0;
> +
>  	/* parse command line */
>  	if (!cmdline_parsed)
>  		mtdpart_setup_real(cmdline);
>  
>  	for(part = partitions; part; part = part->next)
>  	{
> -		if ((!mtd_id) || (!strcmp(part->mtd_id, mtd_id)))
> +		if (!strcmp(part->mtd_id, mtd_id))
>  		{
>  			for(i = 0, offset = 0; i < part->num_parts; i++)
>  			{

This changes the behavior of cmdling parsing, which might affect users
expecting the old behavior.

According to the remark above 'parse_cmdline_partitions':

 * It returns partitions for the requested mtd device, or
 * the first one in the chain if a NULL mtd_id is passed in.

I think the purpose of a NULL 'mtd_id' was to support simple systems
where there's a single driver and a single chip.
The driver could be dumb, not specifying its 'mtd_info->name'
(thus, a NULL mtd_id is passed).

In this case, since the system is simply configured (one driver, one
chip), 'parse_cmdline_partitions' simply disregards the "mtd-id" name
specified in the cmdline string, allowing the user to present some
arbitrary string there.

I quite remember seeing this pattern somewhere in the past, I don't know
if it's still used, though.

Obviously if you have many drivers (and many chips) in a system, that
won't work; the drivers must initialize 'mtd_info->name' and the user
should present a cmdline that has explicit 'mtd-id's.

So question is, would we like to prohibit NULL mtd-id?

If so, we must make sure all drivers are properly assigning their
'mtd_info->name', and all users correctly specifying 'mtd-id' in their
"mtdparts" cmdline strings.

Regards,
Shmulik
