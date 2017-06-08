Date: Thu, 8 Jun 2017 16:43:16 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: xiaolei.li@mediatek.com
Cc: boris.brezillon@free-electrons.com, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mtd: subpagetest: fix wrong written check in function
 write_eraseblock2
Message-ID: <20170608234316.GJ102137@google.com>
References: <1496307679-16245-1-git-send-email-xiaolei.li@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1496307679-16245-1-git-send-email-xiaolei.li@mediatek.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 01, 2017 at 05:01:19PM +0800, xiaolei.li@mediatek.com wrote:
> From: Xiaolei Li <xiaolei.li@mediatek.com>
> 
> Write size in function write_eraseblock2 is subpgsize * k.
> It is wrong to check whether written is equal to subpgsize after each
> mtd_write.
> 
> Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>

Applied to l2-mtd.git
