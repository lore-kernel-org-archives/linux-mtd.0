From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501261710570.3222@phoenix.infradead.org>
References: <Pine.LNX.4.58.0501260841380.3222@phoenix.infradead.org>
	<1106730647.6480.190.camel@localhost.localdomain>
	<Pine.LNX.4.58.0501261534050.3222@phoenix.infradead.org>
	<1106759204.6955.43.camel@weaponx.rchland.ibm.com>
	<Pine.LNX.4.58.0501261710570.3222@phoenix.infradead.org>
Content-Type: text/plain
Date: Wed, 26 Jan 2005 18:15:21 +0000
Message-Id: <1106763322.19262.19.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 memory consumption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-01-26 at 17:11 +0000, Artem B. Bityuckiy wrote:
> > If you use larger "chunks" you'll get better overall compression.  E.g. 
> > a 64KiB node should compress better than a 4KiB node.  This is partially
> > how squashfs achieves better compression that cramfs.

> Surely, but how about read degradation?

See what zisofs does. If you populate adjacent pages when decompressing,
rather than just throwing away the extra data you had to decompress
anyway, then it's not so bad.

-- 
dwmw2
