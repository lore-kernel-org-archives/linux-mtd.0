Message-ID: <1363172741.11441.19.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 00/10] mtd: remove dead map drivers
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Date: Wed, 13 Mar 2013 13:05:41 +0200
In-Reply-To: <1363086855-2847-1-git-send-email-dedekind1@gmail.com>
References: <1363086855-2847-1-git-send-email-dedekind1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-m68k@lists.linux-m68k.org, linux-pcmcia@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2013-03-12 at 13:14 +0200, Artem Bityutskiy wrote:
> This patch-set removes a bunch of dean MTD map drivers. The way I judged
> whether a driver is dead or not was looking at driver's dependencies in the
> Kconfig file. Whenever I saw a driver depending on a Kconfig symbol which is
> not defined anywhere, I treated the driver as dead.
> 
> The motivation for this patch-set is to clean up the MTD subsystem a little and
> lessen the maintenance burden. Indeed, the less drivers we have, the easier it
> is to do MTD framework refactoring.

Pushed to l2-mtd.git, if there are objections, I can remove the
patch(es) in question.

-- 
Best Regards,
Artem Bityutskiy
