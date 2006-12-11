Subject: Re: reboot problem with jffs2
From: David Woodhouse <dwmw2@infradead.org>
To: Jianlin Zeng <jianlinz_2000@yahoo.com>
In-Reply-To: <753100.94917.qm@web56701.mail.re3.yahoo.com>
References: <753100.94917.qm@web56701.mail.re3.yahoo.com>
Content-Type: text/plain
Date: Mon, 11 Dec 2006 19:58:02 +0000
Message-Id: <1165867082.5253.602.camel@pmac.infradead.org>
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

On Mon, 2006-12-11 at 10:52 -0800, Jianlin Zeng wrote:
> Thanks for your information! It appears that I need to
> set all flash sectors to read mode before reboot,
> otherwise the CPU won't be able to read any boot code
> from the flash after reboot. Don't know the reason
> behind it but once I did that the reboot works fine.

I told you the reason behind it. Your hardware is broken -- make sure
the reset line to the flash gets hooked up so it's waggled when the CPU
restarts.

-- 
dwmw2
