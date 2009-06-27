Subject: Re: [PATCH][MTD][NAND]: fix omap2.c compile failure and warning
From: David Woodhouse <dwmw2@infradead.org>
To: vimal singh <vimalsingh@ti.com>
In-Reply-To: <63536.192.168.10.89.1246081026.squirrel@dbdmail.itg.ti.com>
References: <53729.192.168.10.89.1246035472.squirrel@dbdmail.itg.ti.com>
	<57946.192.168.10.89.1246035774.squirrel@dbdmail.itg.ti.com>
	<63536.192.168.10.89.1246081026.squirrel@dbdmail.itg.ti.com>
Content-Type: text/plain
Date: Sat, 27 Jun 2009 08:45:59 +0100
Message-Id: <1246088759.663.106.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "david-b@pacbell.net" <david-b@pacbell.net>,
	"tom.leiming@gmail.com" <tom.leiming@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2009-06-27 at 11:07 +0530, vimal singh wrote:
> > The 'status' you return in the case that you _have_ gone through the
> > loop is still wrong though, isn't it?
> Yes, I have corrected that in below patch. Its my bad, I did not fix it
> previously.
> 
> Signed-off-by: Vimal Singh <vimalsingh at ti.com>
> Signed-off-by: Ming Lei <tom.leiming at gmail.com>

Er, did he? And please put proper email addresses in. If you can't find
an @ sign on your keyboard, cut and paste it from elsewhere.

> @@ -558,6 +560,7 @@ static int omap_wait(struct mtd_info *mtd, struct nand_chip
>  		status = __raw_readb(this->IO_ADDR_R);
> -		if (!(status & 0x40))
> +		if (status & NAND_STATUS_READY)
>  			break;

Hm... now you're polling the PASS/FAIL bit in the status, not the
READY/BUSY bit. I suspect that's not going to work too well...

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
