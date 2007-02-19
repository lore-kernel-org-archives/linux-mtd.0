Subject: Re: jffs2 Erase Block Summary overhead
From: David Woodhouse <dwmw2@infradead.org>
To: Matthieu CASTET <matthieu.castet@parrot.fr>
In-Reply-To: <45D47C92.8080908@parrot.fr>
References: <45D47C92.8080908@parrot.fr>
Content-Type: text/plain
Date: Mon, 19 Feb 2007 10:05:37 +0000
Message-Id: <1171879537.7600.5.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-02-15 at 16:30 +0100, Matthieu CASTET wrote:
> after doing some test on a 64MB nand flash, we see that only 50 MB can 
> be stored on the filesystem [1]. The extra 10 MB are taken by jffs2 summary.
> If we disable jffs2 sumary in the kernel, the 10MB become available.
> 
> Is there a way to reduce this overhead ?
> 20 % seems really big.

There's a lot of redundant information in the summary; I think we could
halve it fairly easily. I don't believe your 20% figure though -- that's
too high. You really can't rely on the output of df.

-- 
dwmw2
