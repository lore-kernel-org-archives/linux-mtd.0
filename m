Subject: Re: [ PATCH V2  3/7] MTD : add the database for the NANDs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
In-Reply-To: <4D8FEBC2.2030004@freescale.com>
References: <1301048581-21321-1-git-send-email-b32955@freescale.com>
	<1301048581-21321-4-git-send-email-b32955@freescale.com>
	<201103251134.44731.ffainelli@freebox.fr>
	<4D8FEBC2.2030004@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 31 Mar 2011 13:00:49 +0300
Message-ID: <1301565649.2828.33.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <ffainelli@freebox.fr>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-03-28 at 10:00 +0800, Huang Shijie wrote:
> These nands are only a example. I have other nands to add in future.
> I will fix nand_get_flash_type() in future, not now. thanks
> 
> Btw : I forget to add  the `busw` field in my nand_device_info{}. 

I think you should consider this as a merge criteria - I do not think we
can allow people to have their own NAND data-bases, even "for now".

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
