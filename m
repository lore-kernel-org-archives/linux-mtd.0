Received: from [2002:c1ed:8229::1] (helo=imladris.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AHeo1-0005JF-NJ
	for <linux-mtd@lists.infradead.org>; Thu, 06 Nov 2003 07:43:50 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Jim Duchek <jduchek@genaero.com>
In-Reply-To: <3FA99B92.3030102@blueridge.net>
References: <3FA9315E.2090508@genaero.com>
	 <1068078256.11685.6.camel@imladris.demon.co.uk>
	 <3FA99B92.3030102@blueridge.net>
Message-Id: <1068104406.13268.0.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Thu, 06 Nov 2003 07:40:06 +0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: DOC2000 + PPM-TX166 (PATCH)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-11-05 at 18:53 -0600, Jim Duchek wrote:
> I'll take a look at getting you that backtrace -- I don't think we have 
> one of our boxes with a keyboard/video on it right now, but next time I 
> get the opportunity I'll get you that.  

Thanks.

> We did try the latest CVS code (perhaps two weeks ago) and saw no 
> difference, so reverted back to the 2.4.22 released version. 

This routine was changed yesterday, to make it conform with the
recommendations in the programming documentation... :)

-- 
dwmw2
