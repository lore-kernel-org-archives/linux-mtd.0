From: David Woodhouse <dwmw2@infradead.org>
To: Selwyn Tang <selwyn@hectrix.com>
In-Reply-To: <3F83E3E6.3070308@hectrix.com>
References: <Law15-F74mSknvh7wFI000062b3@hotmail.com>
	 <3F7CD9CA.5090805@hectrix.com>
	 <1065160480.16088.0.camel@imladris.demon.co.uk>
	 <3F7D31B7.7020400@hectrix.com>
	 <1065171167.22491.53.camel@hades.cambridge.redhat.com>
	 <3F83DCED.8090206@hectrix.com>
	 <1065607132.22298.88.camel@hades.cambridge.redhat.com>
	 <3F83E3E6.3070308@hectrix.com>
Content-Type: text/plain
Message-Id: <1065608571.22298.92.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 08 Oct 2003 11:22:52 +0100
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: high cpu usage using nftl for DOC2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-10-08 at 18:16 +0800, Selwyn Tang wrote:
> I will try my best to do that later.

Thanks.

> What do you mean by -onoatime? Should I change "defaults" to "noatime"?

man 8 mount

       noatime
              Access timestamps are not updated when a file is read.
 
With atime enabled, every _read_ of a file or directory causes a write
to the flash, because the 'access timestamp' is updated.

On flash, this is a Bad Thing(tm).

-- 
dwmw2
