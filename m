From: David Woodhouse <dwmw2@infradead.org>
To: Martin Chan <martinc@milliontech.com>
In-Reply-To: <3FD5B024.5050808@milliontech.com>
References: <3FD5B024.5050808@milliontech.com>
Content-Type: text/plain
Message-Id: <1070969637.31993.125.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 09 Dec 2003 11:33:58 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: IPL block is bad on DiskOnChip 2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-12-09 at 19:21 +0800, Martin Chan wrote:
> Dear all,
> 
> I have successfully DFORMATted my MD2202-D64 today, and try to install a
> jffs2 file system to it.

Assuming you have no bad blocks on your DiskOnChip, you need to erase it
with 'eraseall' first.

Really, you shouldn't be doing this before we properly sort out the bad
block management on these devices.

-- 
dwmw2
