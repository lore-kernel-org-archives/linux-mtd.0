Message-ID: <4DE53D52.4040508@ru.mvista.com>
Date: Tue, 31 May 2011 23:11:14 +0400
From: Sergei Shtylyov <sshtylyov@mvista.com>
MIME-Version: 1.0
To: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v6 1/8] MTD: Add integrator-flash feature to physmap
References: <1305637877-24436-1-git-send-email-marc.zyngier@arm.com>
	<1305637877-24436-2-git-send-email-marc.zyngier@arm.com>
In-Reply-To: <1305637877-24436-2-git-send-email-marc.zyngier@arm.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

Marc Zyngier wrote:

> In the process of moving platforms away from integrator-flash
> (aka armflash), add to physmap the few features that make
> armflash unique:

> - optionnal probing for the AFS partition type
> - init() and exit() methods, used by Integrator to control
>   write access to the various onboard programmable components

> Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
[...]

> diff --git a/include/linux/mtd/physmap.h b/include/linux/mtd/physmap.h
> index bcfd9f7..d37cca0 100644
> --- a/include/linux/mtd/physmap.h
> +++ b/include/linux/mtd/physmap.h
> @@ -22,6 +22,8 @@ struct map_info;
>  
>  struct physmap_flash_data {
>  	unsigned int		width;
> +	int			(*init)(struct platform_device *);
> +	void			(*exit)(struct platform_device *);

    How about a declaration for 'struct platform_device' beforehand? This breaks 
build on other platforms at least...

WBR, Sergei
