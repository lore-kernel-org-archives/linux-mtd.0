From: David Woodhouse <dwmw2@infradead.org>
To: Mark Richards <markr@massmicro.com>
In-Reply-To: <000d01c3df7f$e8685c60$6e01a8c0@solarwave>
References: <000d01c3df7f$e8685c60$6e01a8c0@solarwave>
Content-Type: text/plain
Message-Id: <1074622256.7885.12.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 20 Jan 2004 18:10:57 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: RE: MTD - DOC 2000 freezes on umount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-01-20 at 13:04 -0500, Mark Richards wrote:
> drivers/mtd/chips/Config.in: 14: unknown command

Try 'make oldconfig' instead.

-- 
dwmw2
