From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
In-Reply-To: <41597985.3080803@yandex.ru>
References: <41595913.4040007@yandex.ru>
	<1096375038.30942.30.camel@hades.cambridge.redhat.com>
	<41596471.5020108@yandex.ru>
	<1096377761.30942.58.camel@hades.cambridge.redhat.com>
	<41596913.6080207@yandex.ru>
	<1096379132.30942.66.camel@hades.cambridge.redhat.com>
	<41596DDC.3000506@yandex.ru>
	<1096380254.30942.77.camel@hades.cambridge.redhat.com>
	<1096381863.17956.12.camel@weaponx.rchland.ibm.com>
	<41597985.3080803@yandex.ru>
Content-Type: text/plain
Message-Id: <1096383492.30942.83.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 28 Sep 2004 15:58:13 +0100
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

On Tue, 2004-09-28 at 18:47 +0400, Artem B. Bityuckiy wrote:
> > I'm thinking of fifos here too...
> 
> I suppose you don't mean the Unix FIFO file type (like block device, 
> socket, etc).

Yes, he does. The problem is that each time you access a FIFO you update
its ctime and mtime on the flash... which leads to a _lot_ of nodes,
only one of which is non-obsolete. That's a problem on NAND flash.

-- 
dwmw2
