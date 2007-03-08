Subject: Re: [PATCH] [MTD] Correct partition failed erase address
From: David Woodhouse <dwmw2@infradead.org>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
In-Reply-To: <45EFE727.5070509@nokia.com>
References: <45EFE35C.70604@nokia.com>
	<1173349670.3461.398.camel@pmac.infradead.org>
	<1173349989.3461.402.camel@pmac.infradead.org>
	<45EFE727.5070509@nokia.com>
Content-Type: text/plain
Date: Thu, 08 Mar 2007 10:43:13 +0000
Message-Id: <1173350593.3461.408.camel@pmac.infradead.org>
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

On Thu, 2007-03-08 at 12:36 +0200, Adrian Hunter wrote:
> ext David Woodhouse wrote:
> > On Thu, 2007-03-08 at 10:27 +0000, David Woodhouse wrote:
> >> Erase isn't always synchronous. It can return success (i.e. erase queued
> >> successfully) and later call the callback with an indication of failure. 
> > 
> > ... and mtd_erase_callback() already subtracts the necessary offset.
> > 
> > I really don't like our API very much, but it doesn't seem to be broken
> > in this particular way.
> 
> Yes it is broken. Both when the callback is not used at all, and when 
> an error occurs immediately and the callback is not called.

Ew, you're right -- and the API is worse than I thought.

Sorry (on both counts) :)

-- 
dwmw2
