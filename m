From: David Woodhouse <dwmw2@infradead.org>
To: "Robert P. J. Day" <rpjday@mindspring.com>
In-Reply-To: <Pine.LNX.4.61.0501101703110.22288@localhost.localdomain>
References: <Pine.LNX.4.61.0501101246150.20261@localhost.localdomain>
	<1105380565.17584.4.camel@weaponx.rchland.ibm.com>
	<Pine.LNX.4.61.0501101703110.22288@localhost.localdomain>
Content-Type: text/plain
Date: Mon, 10 Jan 2005 22:21:12 +0000
Message-Id: <1105395672.15749.45.camel@baythorne.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: how to loopback mount a JFFS2 filesystem on my linux box?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-01-10 at 17:10 -0500, Robert P. J. Day wrote:
> 
>   is there something here i need to know about?  is there any reason i
> can't just build a JFFS2 filesystem on my linux host, copy it byte for
> byte to the unit, and mount it there?

None. As long as the erasesize and total size of the two devices match,
you can happily move your file system between them.

-- 
dwmw2
