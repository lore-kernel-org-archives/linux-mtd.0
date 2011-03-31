Subject: Re: [PATCH 3/7] add the database for the NANDs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
In-Reply-To: <1300240521-4344-4-git-send-email-b32955@freescale.com>
References: <1300240521-4344-1-git-send-email-b32955@freescale.com>
	<1300240521-4344-4-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 31 Mar 2011 12:54:02 +0300
Message-ID: <1301565242.2828.32.camel@localhost>
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
> This is a database for the NANDs which is now supported by imx23 and imx28.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>

I agree GPMI is a great and powerful controller. But it is not the only
cotroller out there, and we obviously should not have NAND device data
bases for each nice NAND controller, righ? So we obviously have to have
only one single data-base.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
