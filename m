From: David Woodhouse <dwmw2@infradead.org>
To: Simon Haynes <simon@baydel.com>
In-Reply-To: <403DD3A0.4494.196896@localhost>
References: <403C6FC3.1941.DDC08@localhost> <403DD3A0.4494.196896@localhost>
Content-Type: text/plain
Message-Id: <1077796537.7826.1051.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 26 Feb 2004 11:55:38 +0000
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

Lemme see it. Although if there's a node at 0x000303f0 and no existence
of 000303f0 in the logfile, your logfile is missing bits.

Also take a dump of the offending file system.

-- 
dwmw2
