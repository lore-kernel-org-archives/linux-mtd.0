Subject: Re: [PATCH 1/2] MTD: pxa3xx_nand: fix nand detection issue
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Lei Wen <leiwen@marvell.com>
In-Reply-To: <1307440867-18993-1-git-send-email-leiwen@marvell.com>
References: <1307440867-18993-1-git-send-email-leiwen@marvell.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jun 2011 15:33:30 +0300
Message-ID: <1307450010.11104.81.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <David.Woodhouse@intel.com>,
	Haojian Zhuang <haojian.zhuang@marvell.com>,
	Daniel Mack <zonque@gmail.com>, linux-mtd@lists.infradead.org,
	adrian.wenl@gmail.com, linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-06-07 at 03:01 -0700, Lei Wen wrote:
> When keep_config is set, the detection would goes different routine.
> That the driver would read out the setting which is set previously
> by bootloader. While most bootloader keep the irq mask as off, and
> current driver need all irq default open, keep_config behavior would
> lead to no irq at all.
> 
> Signed-off-by: Lei Wen <leiwen@marvell.com>
> Tested-by: Daniel Mack <zonque@gmail.com>
> Cc: stable@kernel.org

Pushed both patches to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
