Received: from fish.redhat.com ([213.86.99.237]
	helo=executor.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19xlhN-0006Bp-PZ
	for <linux-mtd@lists.infradead.org>; Fri, 12 Sep 2003 12:02:45 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Junio C Hamano <junkio@twinsun.com>
In-Reply-To: <7vy8wvgnet.fsf@mae.twinsun.com>
References: <7vy8wvgnet.fsf@mae.twinsun.com>
Message-Id: <1063364525.23778.423.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 12 Sep 2003 12:02:06 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: TX49 NAND supported?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-09-11 at 12:01 -0700, Junio C Hamano wrote:
> Does anybody have a working tx4925 NAND driver that can be used
> with the latest mtd from infradead CVS?  I have located a copy
> of tx4925ndfmc.c with 2002 timestamp by Toshiba Corporation
> (GPLv2) but it appears to use an API incompatible with the
> current one.  

At the time I changed the API, I also updated every driver which had
been submitted to me and put in my CVS tree.

If there are drivers out there from people who couldn't be bothered to
do that, they broke.

Please complain to the author of the module in question and ask them why
they didn't let me have a copy.

-- 
dwmw2
