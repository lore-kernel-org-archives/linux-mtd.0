Subject: Re: jffs2 memory usage and OOM killer
From: David Woodhouse <dwmw2@infradead.org>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <465D4B8A.3050701@parrot.com>
References: <465A89D6.2050708@parrot.com>  <465D4B8A.3050701@parrot.com>
Content-Type: text/plain
Date: Thu, 31 May 2007 13:05:07 +0100
Message-Id: <1180613107.26803.384.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-05-30 at 12:01 +0200, Matthieu CASTET wrote:
> > I know that jffs2 eats some memory, but I am impressed that it can
> > eat so much memory.
>
> Using git jffs2, allow to mount the fs without OOM. Now jfss2 eats
> 3MB. 

Yeah, that sucked. We fixed it.

-- 
dwmw2
