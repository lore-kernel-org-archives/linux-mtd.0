Subject: Re: JFFS2 read Inode related issue
From: David Woodhouse <dwmw2@infradead.org>
To: "Mouawad, Tony" <Tony.Mouawad@christiedigital.com>
In-Reply-To: <AD98412A5373CC4AA643D9C021922A543A935E@cdskitexg01.cds.int>
References: <AD98412A5373CC4AA643D9C021922A543A935E@cdskitexg01.cds.int>
Content-Type: text/plain
Date: Thu, 13 Sep 2007 00:13:18 +0200
Message-Id: <1189635198.3570.62.camel@shinybook.infradead.org>
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

On Tue, 2007-09-11 at 09:59 -0400, Mouawad, Tony wrote:
> I'm using Linux 2.6.10 on Coldfire architecture and I seem to be
> experiencing very intermittent problems reading inodes.  It seems that
> the following case is being hit during a call to
> jffs2_do_read_inode():

Yeah, that'll be just one of the _numerous_ bugs we've fixed in the
three years since 2.6.10 was released. Far from being the worst one,
either.

Use a sensible kernel.

-- 
dwmw2
