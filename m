Message-ID: <1363590576.20738.8.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 6/6] mtd: remove h720x flash support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 18 Mar 2013 09:09:36 +0200
In-Reply-To: <1363299178-8241-7-git-send-email-arnd@arndb.de>
References: <1363299178-8241-1-git-send-email-arnd@arndb.de>
 <1363299178-8241-7-git-send-email-arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Thu, 2013-03-14 at 23:12 +0100, Arnd Bergmann wrote:
> The h720x platform support is going away in linux-3.10, so the
> MTD driver will also not be needed any more.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
