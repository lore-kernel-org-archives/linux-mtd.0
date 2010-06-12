Subject: Re: [PATCH] MTD: remove redundant dependency checks in Kconfig files
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kyle Spaans <kspaans@uwaterloo.ca>
In-Reply-To: <20100608134822.GA18437@caffeine.csclub.uwaterloo.ca>
References: <20100608134822.GA18437@caffeine.csclub.uwaterloo.ca>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 12 Jun 2010 17:32:09 +0300
Message-ID: <1276353129.19028.124.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-06-08 at 09:48 -0400, Kyle Spaans wrote:
> Look for dependency checks for "FOO" when inside of an "if FOO" block and remove them.
> 
> Signed-off-by: Kyle Spaans <kspaans@uwaterloo.ca>
> Reviewed-by: Robert P. J. Day <rpjday@crashcourse.ca>

Pushed to l2-mtd-2.6.git / master, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
