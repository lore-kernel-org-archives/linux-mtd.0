Subject: Re: [PATCH v6 8/8] MTD: physmap: let set_vpp() pass a
	platform_device instead of a map_info
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marc Zyngier <marc.zyngier@arm.com>
In-Reply-To: <1305637877-24436-9-git-send-email-marc.zyngier@arm.com>
References: <1305637877-24436-1-git-send-email-marc.zyngier@arm.com>
	<1305637877-24436-9-git-send-email-marc.zyngier@arm.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 19 May 2011 14:17:38 +0300
Message-ID: <1305803858.2630.67.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Eric Miao <eric.y.miao@gmail.com>, Philipp Zabel <philipp.zabel@gmail.com>,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
	Nicolas Ferre <nicolas.ferre@atmel.com>,
	linux-mtd@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>,
	Russell King <linux@arm.linux.org.uk>,
	David Woodhouse <dwmw2@infradead.org>, Andrew Victor <linux@maxim.org.za>,
	linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-05-17 at 14:11 +0100, Marc Zyngier wrote:
> The set_vpp() method provided by physmap passes a map_info back to
> the platform code, which has little relevance as far as the platform
> is concerned (this parameter is completely unused).
> 
> Instead, pass the platform_device, which can be used in the pismo
> driver to retrieve some important information in a nicer way, instead
> of the hack that was in place.
> 
> The empty set_vpp function in board-at572d940hf_ek.c is left untouched,
> as the board/SoC is scheduled for removal.
> 
> Cc: Andrew Victor <linux@maxim.org.za>
> Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
> Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
> Cc: Russell King <linux@arm.linux.org.uk>
> Cc: Philipp Zabel <philipp.zabel@gmail.com>
> Cc: Eric Miao <eric.y.miao@gmail.com>
> Cc: Ben Dooks <ben-linux@fluff.org>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>

Acked-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
