Received: from venus.billgatliff.com ([209.251.101.201])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KP1kg-0001dD-Pc
	for linux-mtd@lists.infradead.org; Fri, 01 Aug 2008 21:01:30 +0000
Message-ID: <489379A2.3060205@billgatliff.com>
Date: Fri, 01 Aug 2008 16:01:22 -0500
From: Bill Gatliff <bgat@billgatliff.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Node CRC failures in latest mainline git?
References: <48913EA3.9080603@billgatliff.com>	
	<4891431D.7030009@billgatliff.com>
	<1217624390.3719.32.camel@shinybook.infradead.org>
In-Reply-To: <1217624390.3719.32.camel@shinybook.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
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

David Woodhouse wrote:
> On Wed, 2008-07-30 at 23:44 -0500, Bill Gatliff wrote:
>> Bill Gatliff wrote:
>>> An older kernel (three or four weeks ago) continues to work fine on the same board.
>> I take that back--- a 2.6.24 kernel is issuing the same message, but it still
>> mounts the filesystem.  The latest git stuff won't.
> 
> Why doesn't it mount? It shouldn't be because of a single bad node
> CRC...

Well, it's a bazillion bad node CRCs, approximately.  But I don't know if that's
why it doesn't mount, or not.  I haven't managed to catch the message--- if
there is one.


b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
