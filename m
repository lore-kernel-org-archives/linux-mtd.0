Subject: Re: mtd: fix hang-up in cfi erase and read contention
From: David Woodhouse <dwmw2@infradead.org>
To: Tadashi Abe <tabe@mvista.com>
Date: Wed, 25 May 2011 02:08:57 +0100
In-Reply-To: <4DD4BF87.6030107@mvista.com>
References: <4DD4BF87.6030107@mvista.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1306285741.7218.96.camel@i7.infradead.org>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-05-19 at 15:58 +0900, Tadashi Abe wrote:
> @@ -812,12 +812,9 @@ static int chip_ready (struct map_info *map, struct flchip *chip, unsigned long
>  			        break;
>  
>  			if (time_after(jiffies, timeo)) {
> -				/* Urgh. Resume and pretend we weren't here.  */
> -				map_write(map, CMD(0xd0), adr);
> -				/* Make sure we're in 'read status' mode if it had finished */
> -				map_write(map, CMD(0x70), adr);
> -				chip->state = FL_ERASING;
> -				chip->oldstate = FL_READY;
> +				/* Urgh. Resume and pretend we weren't here.
> +				 * Make sure we're in 'read status' mode if it had finished */
> +				put_chip(map, chip, adr);

I'm confused. You've removed the code which ensures that the chip is in
a known state.... why?

-- 
dwmw2
