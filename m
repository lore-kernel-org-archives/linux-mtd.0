From: David Woodhouse <dwmw2@infradead.org>
To: libber@deathgrab.com
In-Reply-To: <63072.65.37.112.188.1078528537.squirrel@mail.deathgrab.com>
References: <63072.65.37.112.188.1078528537.squirrel@mail.deathgrab.com>
Content-Type: text/plain
Message-Id: <1078530792.6971.1.camel@lapdancer.baythorne.internal>
Mime-Version: 1.0
Date: Fri, 05 Mar 2004 23:53:14 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: can only save empty files
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-03-05 at 14:15 -0900, libber@deathgrab.com wrote:
> Greetings, I am trying to get a read/write partition working for the
> linksys WRT54G. 

I believe the bus controller is set up wrong, and read of less than a
full buswidth are returning incorrect data.

IIRC the fix was to make copy_from() of an odd length in your particular
map driver copy the last word into a local buffer, then copy only the
required bytes from that.

That or find chip docs and fix up the bus controller setup. :)

-- 
dwmw2
