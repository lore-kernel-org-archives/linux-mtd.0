Subject: Re: [PATCH] [MTD] Correct partition failed erase address
From: David Woodhouse <dwmw2@infradead.org>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
In-Reply-To: <1173349670.3461.398.camel@pmac.infradead.org>
References: <45EFE35C.70604@nokia.com>
	<1173349670.3461.398.camel@pmac.infradead.org>
Content-Type: text/plain
Date: Thu, 08 Mar 2007 10:33:09 +0000
Message-Id: <1173349989.3461.402.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-03-08 at 10:27 +0000, David Woodhouse wrote:
> 
> Erase isn't always synchronous. It can return success (i.e. erase queued
> successfully) and later call the callback with an indication of failure. 

... and mtd_erase_callback() already subtracts the necessary offset.

I really don't like our API very much, but it doesn't seem to be broken
in this particular way.

When we fix things to cope with flash larger than 4GiB, I think we
should make larger changes to the way that partitioning works as well as
reconsidering the read/write/erase API.

-- 
dwmw2
