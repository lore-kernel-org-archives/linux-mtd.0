From: David Woodhouse <dwmw2@infradead.org>
To: Martin Chan <martinc@milliontech.com>
In-Reply-To: <3FD6D5C3.4000507@milliontech.com>
References: <3FD6D5C3.4000507@milliontech.com>
Content-Type: text/plain
Message-Id: <1071048770.5712.19.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 10 Dec 2003 09:32:51 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: can't mount DOC2000 with jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-12-10 at 16:13 +0800, Martin Chan wrote:
> I have tried a whole day but still can't mount the DOC2000 "MD2202-D64"
> with jffs2. Please advise.

Use drivers/mtd/nand/diskonchip.c not drivers/mtd/devices/doc2000.c

-- 
dwmw2
