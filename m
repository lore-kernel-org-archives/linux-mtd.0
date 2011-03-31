Subject: Re: [PATCH 5/7] add GPMI support for imx28
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
In-Reply-To: <1300240521-4344-6-git-send-email-b32955@freescale.com>
References: <1300240521-4344-1-git-send-email-b32955@freescale.com>
	<1300240521-4344-6-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 31 Mar 2011 12:49:57 +0300
Message-ID: <1301564997.2828.28.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux@arm.linux.org.uk, dwmw2@infradead.org,
	linux-arm-kernel@lists.infradead.org, David.Woodhouse@intel.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-03-16 at 09:55 +0800, Huang Shijie wrote:
> +       .description               = "Single-chip boot area, "
> +                                               "block mark swapping
> supported", 

Because you love tabs so much, you have to do this strange splitting of
strings. Just use normal spaces and you'll fit many things in one line.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
