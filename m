Subject: Re: [PATCH] Magic Panel (SH3-DSP board) MTD mapping
From: David Woodhouse <dwmw2@infradead.org>
To: Markus Brunner <super.firetwister@googlemail.com>
In-Reply-To: <200708200837.08856.super.firetwister@gmail.com>
References: <200708200837.08856.super.firetwister@gmail.com>
Content-Type: text/plain
Date: Mon, 20 Aug 2007 08:35:26 +0100
Message-Id: <1187595327.3137.3.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Mark Jonas <toertel@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-08-20 at 08:37 +0200, Markus Brunner wrote:
> this adds a MTD mapping for the onboard NOR flash on the Magic Panel
> R2. The mapping module is based on the solutionengine mapping module.
> 
> How are the chances for inclusion in 2.6.24? 

Looks like you should be able to use a platform_device for this.

-- 
dwmw2
