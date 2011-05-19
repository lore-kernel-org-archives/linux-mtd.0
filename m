Subject: Re: [PATCH v6 0/8] Switch ARM platforms from integrator-flash to
	physmap
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marc Zyngier <marc.zyngier@arm.com>
In-Reply-To: <1305637877-24436-1-git-send-email-marc.zyngier@arm.com>
References: <1305637877-24436-1-git-send-email-marc.zyngier@arm.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 19 May 2011 14:19:06 +0300
Message-ID: <1305803946.2630.69.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
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
> As the integrator-flash driver is mostly a duplicate of physmap,
> move all users of this driver to physmap and get rid of the
> then unused driver.
> 
> Also change the set_vpp() method in physmap to pass the
> platform_device instead of the map_info. This allows for a substantial
> cleanup in drivers/mtd/maps/pismo.c
> 
> This patch set has been ok'ed by RMK, who is willing to take it
> through his tree. This requires an ACK from the MTD maintainers. David
> Woodhouse cc-ed on the whole patch set in case he'd prefer to merge it
> via the MTD tree.

I assume the whole series will go in via some subsystem arm tree?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
