From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
In-Reply-To: <41596913.6080207@yandex.ru>
References: <41595913.4040007@yandex.ru>
	<1096375038.30942.30.camel@hades.cambridge.redhat.com>
	<41596471.5020108@yandex.ru>
	<1096377761.30942.58.camel@hades.cambridge.redhat.com>
	<41596913.6080207@yandex.ru>
Content-Type: text/plain
Message-Id: <1096379132.30942.66.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 28 Sep 2004 14:45:32 +0100
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

On Tue, 2004-09-28 at 17:37 +0400, Artem B. Bityuckiy wrote:
> If this isn't last node, the reason is media errors. 

No. What about an unclean reboot followed by more valid writes? You end
up with the broken node in the middle.

> Another possibility is to teach the GC not to delete obsolete nodes for 
> not yet checked inodes. 

The GC already doesn't delete _anything_ until all inodes have been
checked. In fact I suppose it _could_ proceed, checking each inode only
as and when it encounters a node belonging to that inode... but that
would generally screw up the accounting totals and make my head hurt so
it wasn't done that way.

-- 
dwmw2
