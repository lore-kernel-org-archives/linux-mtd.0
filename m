From: David Woodhouse <dwmw2@infradead.org>
To: Simon Haynes <simon@baydel.com>
In-Reply-To: <403DD3A0.4494.196896@localhost>
References: <403C6FC3.1941.DDC08@localhost> <403DD3A0.4494.196896@localhost>
Content-Type: text/plain
Message-Id: <1078327901.4619.21.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 03 Mar 2004 15:31:41 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Corruption.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-02-26 at 11:08 +0000, Simon Haynes wrote:
> Beyond that I don't really know what I am looking for in the log. I can mail it to you 
> personally but as I said it's 4Mb compressed.

(for the benefit of the peanut gallery...)

The CRC error was harmless. It was a node being garbage-collected, which
we didn't bother to finish writing because it contained only a redundant
copy of data which existed elsewhere on the flash already. 

We could try to be slightly quieter about such things, but then we might
actually miss something which _is_ a problem. Better to be concerned
when there isn't a problem, than to be blissfully unaware when there
_is_ one. Perhaps.


-- 
dwmw2
