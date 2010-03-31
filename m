Subject: Re: [PATCH v2 1/7] mtd: cfi_probe: enter Auto Select Mode after
	filling cfi->cfiq members
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Guillaume LECERF <glecerf@gmail.com>
In-Reply-To: <20100330133448.20107.1077.stgit@shiryu.yomgui.biz>
References: <20100330133448.20107.1077.stgit@shiryu.yomgui.biz>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 31 Mar 2010 16:28:13 +0300
Message-ID: <1270042093.15073.19.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-03-30 at 15:34 +0200, Guillaume LECERF wrote:
> Move the code to enter Auto Select Mode down to be able to use cfi->cfiq
> members to add support for chips using alternative sequence / unlock
> addresses.
> 
> Signed-off-by: Guillaume LECERF <glecerf@gmail.com>

Pushed the series to the "dunno" branch of my l2-mtd-2.6.git tree,
thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
