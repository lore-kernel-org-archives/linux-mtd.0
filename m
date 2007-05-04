Subject: Re: [PATCH 2/5] jffs2: Add LZO compression support to jffs2
From: David Woodhouse <dwmw2@infradead.org>
To: Richard Purdie <rpurdie@openedhand.com>
In-Reply-To: <1178278255.5839.47.camel@localhost.localdomain>
References: <1178278255.5839.47.camel@localhost.localdomain>
Content-Type: text/plain
Date: Fri, 04 May 2007 12:35:32 +0100
Message-Id: <1178278532.11120.274.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Randy Dunlap <randy.dunlap@oracle.com>,
	Satyam Sharma <satyam.sharma@gmail.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-05-04 at 12:30 +0100, Richard Purdie wrote:
> +config JFFS2_LZO
> +       bool "JFFS2 LZO compression support" if JFFS2_COMPRESSION_OPTIONS
> +       select LZO 

Please make it _depend_ on LZO instead. If you do that, I can merge the
JFFS2 bits in anticipation of the core LZO code going upstream.

-- 
dwmw2
