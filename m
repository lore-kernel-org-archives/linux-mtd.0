Subject: Re: [PATCH] mtd: Blackfin NFC: localize MMR bit masks
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1268150748-27499-1-git-send-email-vapier@gentoo.org>
References: <1268150748-27499-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 06 Apr 2010 11:41:10 +0300
Message-ID: <1270543270.6754.9.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-03-09 at 11:05 -0500, Mike Frysinger wrote:
> Convert all magic numbers into appropriate defines, and move the defines
> out of the global namespace and into this one driver.  No other driver
> needs to care about the MMR layout anyways.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed to my l2-mtd-2.6.git / master, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
