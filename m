Subject: Re: [PATCH 1/3] eLBC NAND: increase bus timeout to maximum
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Scott Wood <scottwood@freescale.com>
In-Reply-To: <20091113201216.GA8313@loki.buserror.net>
References: <20091113201216.GA8313@loki.buserror.net>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 Nov 2009 16:36:31 +0200
Message-Id: <1258986991.18407.14.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linuxppc-dev@ozlabs.org, dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-11-13 at 14:12 -0600, Scott Wood wrote:
> When a NAND operation is in progress, all other localbus operations
> (including NOR flash) will have to wait for access to the bus.  However, the
> NAND operation may take longer to complete than the default timeout.  Thus,
> if NOR is accessed while a NAND operation is in progress, the NAND operation
> will fail.
> 
> Signed-off-by: Scott Wood <scottwood@freescale.com>

Taken the patches to my l2-mtd-2.6 tree.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
