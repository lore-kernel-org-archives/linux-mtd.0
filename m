From: David Woodhouse <dwmw2@infradead.org>
To: Axel Ludszuweit <alu@keymile.com>
In-Reply-To: <3FD5B1EF.4060905@keymile.com>
References: <3FD5B1EF.4060905@keymile.com>
Content-Type: text/plain
Message-Id: <1070969584.31993.123.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 09 Dec 2003 11:33:04 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: question about mtdchar.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-12-09 at 12:28 +0100, Axel Ludszuweit wrote:
>         case MEMGETINFO:
> -               if (copy_to_user((struct mtd_info *)arg, mtd,
> +               if (copy_to_user((struct mtd_info_user *)arg, mtd,
>                                  sizeof(struct mtd_info_user)))
>                         return -EFAULT;

You're right -- thanks. But note that it's cosmetic; the type of the
pointer is irrelevant and the length is correct.

-- 
dwmw2
