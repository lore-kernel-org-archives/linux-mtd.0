From: David Woodhouse <dwmw2@infradead.org>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <Pine.LNX.4.61.0502081255500.20042@localhost.localdomain>
References: <E1CyZQx-0005qR-9M@phoenix.infradead.org>
	<1107885259.19262.495.camel@hades.cambridge.redhat.com>
	<Pine.LNX.4.61.0502081255500.20042@localhost.localdomain>
Content-Type: text/plain
Date: Tue, 08 Feb 2005 18:02:51 +0000
Message-Id: <1107885772.19262.496.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Nicolas Pitre <nico@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: mtd/include/mtd mtd-abi.h,1.8,1.9
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-02-08 at 12:57 -0500, Nicolas Pitre wrote:
> 
> > No ints in ioctls please. Choose something with a fixed size.
> 
> Aren't ints fixed size?  I carefully avoided using a long for that 
> reason.

Yeah, I'm full of crap. Sorry.

-- 
dwmw2
