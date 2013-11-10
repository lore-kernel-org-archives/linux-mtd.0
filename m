Date: Sun, 10 Nov 2013 15:17:24 -0500
From: Huang Shijie <shijie8@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH bugfix] mtd: gpmi: serialize all the dma operations
Message-ID: <20131110201722.GA32547@gmail.com>
References: <1383728007-15564-1-git-send-email-b32955@freescale.com>
 <20131107211229.GY20061@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131107211229.GY20061@ld-irv-0074.broadcom.com>
Cc: dedekind1@gmail.com, stable@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 07, 2013 at 01:12:29PM -0800, Brian Norris wrote:
> sufficiently well described, and I'm not sure this is the right
> solution. But please, educate me.
I find a better way to synchronize the two DMA operations.
I will send out the new patch after i test it.

thanks
Huang Shijie
