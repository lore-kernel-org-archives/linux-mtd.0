Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CgpFD-00006w-5V
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 14:00:28 -0500
Message-ID: <41C872C2.4050003@mvista.com>
Date: Tue, 21 Dec 2004 11:00:18 -0800
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: jasmine@linuxgrrls.org
References: <a46577d50412131817139c1966@mail.gmail.com>	<1103632351.6111.67.camel@localhost.localdomain>
	<Pine.LNX.4.61.0412211235350.3342@hex.linuxgrrls.org>
In-Reply-To: <Pine.LNX.4.61.0412211235350.3342@hex.linuxgrrls.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Wang JinFeng <wangjinfeng@gmail.com>, linux-mtd@lists.infradead.org,
	uclinux-dev@uclinux.org
Subject: Re: Failed to implent MTD on uclinux(kernel version 2.4.20-uc0)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

jasmine@linuxgrrls.org wrote:

> Why the hell would you be running uClinux on an s3c2410 anyway?  It's an 
> ARM920T and has a real MMU.  It is very capable (and fast!) at running 
> real Linux.

Context switch time for processors with virtually indexed virtually 
tagged caches that require cache and TLB flushes at each context switch 
in Linux can be a good reason: 
http://opensrc.sec.samsung.com/document/uc-linux-04_sait.pdf

-- 
Todd
