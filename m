From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
In-Reply-To: <41596471.5020108@yandex.ru>
References: <41595913.4040007@yandex.ru>
	<1096375038.30942.30.camel@hades.cambridge.redhat.com>
	<41596471.5020108@yandex.ru>
Content-Type: text/plain
Message-Id: <1096377761.30942.58.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 28 Sep 2004 14:22:42 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 an nodes checking
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-09-28 at 17:17 +0400, Artem B. Bityuckiy wrote:
> Ok. But what if we check only last node (with the highest version) and 
> if it is OK, don't check anything more? If it is bad, check previous, 
> and so on. It seems for me, these checks are enough. We cover the 
> situation with unexpected power losses.

There's no reason to presume that the only node with broken CRC will be
the _latest_ node, especially on NAND flash.

-- 
dwmw2
