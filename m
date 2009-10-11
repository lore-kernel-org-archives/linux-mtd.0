Subject: Re: [PATCH] mtd: cleanup mtd_oobtest
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Akinobu Mita <akinobu.mita@gmail.com>
In-Reply-To: <1255081432-22080-1-git-send-email-akinobu.mita@gmail.com>
References: <>  <1255081432-22080-1-git-send-email-akinobu.mita@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 11 Oct 2009 16:41:21 +0300
Message-Id: <1255268481.16942.76.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-10-09 at 18:43 +0900, Akinobu Mita wrote:
> - Remove unnecessary memset for bbt
> 
>   All entries will be initialized at a few lines below
> 
> - Remove unnecessary initialization for mtd->erasesize
> 
> - Use write_whole_device()
> 
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>

I've added this patch to my l2-mtd-2.6.git tree:
http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commit/152bd342f1c36cde54e52565947527a70c6b4afb

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
