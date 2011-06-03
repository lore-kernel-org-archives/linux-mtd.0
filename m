Subject: Re: [PATCH 1/2] clps711x/ceiva: port to use physmap flash
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <1307015648-17505-1-git-send-email-dbaryshkov@gmail.com>
References: <1307015648-17505-1-git-send-email-dbaryshkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Jun 2011 07:38:25 +0300
Message-ID: <1307075905.4405.130.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Russell King <linux@arm.linux.org.uk>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-06-02 at 15:54 +0400, Dmitry Eremin-Solenikov wrote:
> Port ceiva machine to use physmap flash instead of custom mapping driver
> (which even can't compile cleanly with current kernels). All info
> is gathered from drivers/mtd/maps/ceiva.c. Compile tested only.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  arch/arm/mach-clps711x/ceiva.c |   60 ++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 60 insertions(+), 0 deletions(-)

Is ceiva used and not dead? May be we could kill it completely?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
