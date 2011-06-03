Subject: Re: [PATCH 2/2] mtd: drop ceiva map driver
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <1307015648-17505-2-git-send-email-dbaryshkov@gmail.com>
References: <1307015648-17505-1-git-send-email-dbaryshkov@gmail.com>
	<1307015648-17505-2-git-send-email-dbaryshkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Jun 2011 18:49:19 +0300
Message-ID: <1307116159.3069.22.camel@localhost>
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
> The same functionality is provided by physmap flash driver,
> drivers/mtd/maps/ceiva.c didn't receive any functional changes since
> the start of current git history, so drop it.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

How about this: I take this patch to l2-mtd-2.6, but not taking the
first patch. If someone complains that he needs ceiva, we'll add you
first patch. Otherwise, you should kill all the other ceiva bits. Is
this OK?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
