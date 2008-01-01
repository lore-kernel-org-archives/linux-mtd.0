Subject: Re: [2.6 patch] remove broken MTD drivers
From: David Woodhouse <dwmw2@infradead.org>
To: Adrian Bunk <bunk@kernel.org>
In-Reply-To: <20080101134839.GN2360@does.not.exist>
References: <20080101134839.GN2360@does.not.exist>
Content-Type: text/plain
Date: Tue, 01 Jan 2008 16:30:57 +0000
Message-Id: <1199205057.6315.67.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Thomas Gleixner <tglx@cruncher.tec.linutronix.de>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-01-01 at 15:48 +0200, Adrian Bunk wrote:
> This patch removes two MTD drivers that have been marked as
> BROKEN 19 months ago due to requiring nonexisting header files.
> 
> Signed-off-by: Adrian Bunk <bunk@kernel.org>

Any particular reason you didn't Cc the authors identified in the
drivers you're removing?

-- 
dwmw2
