Subject: Re: reboot problem with jffs2
From: David Woodhouse <dwmw2@infradead.org>
To: Jianlin Zeng <jianlinz_2000@yahoo.com>
In-Reply-To: <319457.62342.qm@web56706.mail.re3.yahoo.com>
References: <319457.62342.qm@web56706.mail.re3.yahoo.com>
Content-Type: text/plain
Date: Sun, 10 Dec 2006 11:54:42 +0000
Message-Id: <1165751682.5253.488.camel@pmac.infradead.org>
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

On Fri, 2006-12-08 at 16:24 -0800, Jianlin Zeng wrote:
> I have a MPC8248 based board running linux 2.6.11. I
> mounted jffs2 FS on a NOR flash partition. The jffs2
> FS works fine. But if I modify any files in the jffs2
> FS and then soft reboot the board, the reboot hangs.
> If I don't modify any files in jffs2 FS and just do
> flashcp to a MTD char device, the soft reboot works
> fine. 

Check you hardware. I suspect the flash chip isn't being properly reset
when the CPU restarts.

-- 
dwmw2
