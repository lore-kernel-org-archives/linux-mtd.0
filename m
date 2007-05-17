Subject: Re: Priority inversion when using MTD
From: David Woodhouse <dwmw2@infradead.org>
To: Sekhar Nori <nori.sekhar@gmail.com>
In-Reply-To: <93840d070705170620x4a61007ap537ce877acfab488@mail.gmail.com>
References: <93840d070705170620x4a61007ap537ce877acfab488@mail.gmail.com>
Content-Type: text/plain
Date: Thu, 17 May 2007 21:52:09 +0800
Message-Id: <1179409930.2859.495.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-05-17 at 18:50 +0530, Sekhar Nori wrote:
> I have a high priority SCHED_FIFO task which runs out of a squashfs file system.
> When this process needs to fetch a page from the flash (due to demand paging),
> it is sometimes made to wait for another low priority SCHED_NORMAL
> task which is doing an erase on some other mtd partition.
 ...
> Is there any way to avoid this scenario? Any help/pointers would be appreciated.

mlockall(2)

-- 
dwmw2
