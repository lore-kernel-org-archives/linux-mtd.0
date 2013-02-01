Date: Fri, 1 Feb 2013 14:05:10 -0800
From: Tony Lindgren <tony@atomide.com>
To: Philip Avinash <avinashphilip@ti.com>
Subject: Re: [PATCH 1/4] arch: arm: gpmc: gpmc migration support
Message-ID: <20130201220510.GY22517@atomide.com>
References: <1358933176-12409-1-git-send-email-avinashphilip@ti.com>
 <1358933176-12409-2-git-send-email-avinashphilip@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1358933176-12409-2-git-send-email-avinashphilip@ti.com>
Cc: khilman@ti.com, afzal@ti.com, linux@arm.linux.org.uk, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, gururaja.hebbar@ti.com,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Philip Avinash <avinashphilip@ti.com> [130123 01:28]:
> With recent GPMC driver conversion, usage of gpmc_save/restore_context
> can done from gpmc driver itself. Hence removes the usage from pm34xx.c.
> Also removes the conditional compilation primitives ARCH_OMAP3 for
> gpmc_save/restore_context.

Hmm I think this will break GPMC for deeper idle modes. Note that we
need to save and restore the context every time hitting off-idle, not
just for suspend and resume. Or am I missing something here?

Regards,

Tony
