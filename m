Subject: Re: [PATCH v4] mtdchar: fix mmap() for MTD RAM/ROM char devices
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Anatolij Gustschin <agust@denx.de>
In-Reply-To: <1276587015-13506-1-git-send-email-agust@denx.de>
References: <1276371338-14253-1-git-send-email-agust@denx.de>
	<1276587015-13506-1-git-send-email-agust@denx.de>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 07 Jul 2010 17:02:58 +0300
Message-ID: <1278511378.12733.14.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Detlev Zundel <dzu@denx.de>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-06-15 at 09:30 +0200, Anatolij Gustschin wrote:
> For no-mmu systems mmap() on RAM/ROM devices already works
> but for systems with mmu it probably was not tested and
> doesn't work.
> 
> This patch allows using mmap() on MTD RAM/ROM devices on systems
> with MMU. It has been tested on mpc5121e based platform with
> MR0A16A MRAM device attached over LocalBus.
> 
> Signed-off-by: Anatolij Gustschin <agust@denx.de>

Pushed to l2-mtd-2.6.git / dunno

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
