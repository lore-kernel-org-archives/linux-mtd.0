From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501261821340.5399@phoenix.infradead.org>
References: <Pine.LNX.4.58.0501260841380.3222@phoenix.infradead.org>
	<1106730647.6480.190.camel@localhost.localdomain>
	<Pine.LNX.4.58.0501261534050.3222@phoenix.infradead.org>
	<1106759204.6955.43.camel@weaponx.rchland.ibm.com>
	<Pine.LNX.4.58.0501261710570.3222@phoenix.infradead.org>
	<1106763322.19262.19.camel@hades.cambridge.redhat.com>
	<Pine.LNX.4.58.0501261821340.5399@phoenix.infradead.org>
Content-Type: text/plain
Date: Wed, 26 Jan 2005 18:55:03 +0000
Message-Id: <1106765704.19262.28.camel@hades.cambridge.redhat.com>
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

On Wed, 2005-01-26 at 18:33 +0000, Artem B. Bityuckiy wrote:
> Ok, we need to select how many pages will we have at one node. I
> suppose 4-8 pages is enough. What digit do you imagine? 

I think we relax the spec so that it's unlimited. I was imagining 4 or
8; we can see what works best.

-- 
dwmw2
