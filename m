From: David Woodhouse <dwmw2@infradead.org>
To: Armin <armin@melware.de>
In-Reply-To: <Pine.LNX.4.31.0401271230320.5586-100000@phoenix.one.melware.de>
References: <Pine.LNX.4.31.0401271230320.5586-100000@phoenix.one.melware.de>
Content-Type: text/plain
Message-Id: <1075209322.1633.50.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 27 Jan 2004 13:15:23 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: fix jffs2 data errors ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-01-27 at 12:42 +0100, Armin wrote:
> Now I tried to remove the "broken" file2, which worked, but
> after umount/mount, the file2 was here again. So I was not
> able to remove this file.

If this is reproduceable, please do so with CONFIG_JFFS2_FS_DEBUG=1,
logging all messages over a serial console. Show the output (you may
need to boot with 'debug' on the command line) while the file system is
mounted, the offending file unlinked, and then capture the output while
the file system is mounted a second time. If possible, take snapshots of
the flash before each mount attempt.

Thanks.

-- 
dwmw2
