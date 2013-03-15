Message-ID: <1363336652.11441.116.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/4] mtd: merge mtdchar module with mtdcore
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Date: Fri, 15 Mar 2013 10:37:32 +0200
In-Reply-To: <1363260463-10609-1-git-send-email-dedekind1@gmail.com>
References: <1363260463-10609-1-git-send-email-dedekind1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Russell King <linux@arm.linux.org.uk>, linux-cris-kernel@axis.com,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Mikael Starvik <starvik@axis.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
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

On Thu, 2013-03-14 at 13:27 +0200, Artem Bityutskiy wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> The MTD subsystem has historically tried to be as configurable as possible. The
> side-effect of this is that its configuration menu is rather large, and we are
> gradually shrinking it. For example, we recently merged partitions support with
> the mtdcore.
> 
> This patch does the next step - it merges the mtdchar module to mtdcore. And in
> this case this is not only about eliminating too fine-grained separation and
> simplifying the configuration menu. This is also about eliminating seemingly
> useless kernel module.

I've pushed the patch-set to the l2-mtd.git tree.

-- 
Best Regards,
Artem Bityutskiy
