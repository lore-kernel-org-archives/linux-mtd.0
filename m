From: David Woodhouse <dwmw2@infradead.org>
To: rick@efn.org
In-Reply-To: <E1DqvgV-000275-00@amazonia.client.comcast.net>
References: <E1DqvgV-000275-00@amazonia.client.comcast.net>
Content-Type: text/plain
Date: Mon, 11 Jul 2005 15:55:52 +0100
Message-Id: <1121093753.27264.117.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: infinite loop in jffs2_flush_wbuf_gc()?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-07-08 at 09:26 -0700, Rick Bronson wrote:
>   I seem to encounter an infinite loop in in jffs2_flush_wbuf_gc() in
> wbuf.c starting at: 
> 
>         } else while (old_wbuf_len &&
>                       old_wbuf_ofs == c->wbuf_ofs) {
> 
>   Once it gets in this loop, I don't see how it ever gets out if
> c->wbuf_ofs doesn't change.

If we call the garbage collector and it doesn't make progress, then it
will return an error. In the error case we break out of the loop.

If the garbage collector _does_ make progress, then (as soon as it's
finished CRC-checking inodes) c->wbuf_ofs will be changing.

-- 
dwmw2
