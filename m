Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19NvwZ-0000Vl-E1
	for <linux-mtd@lists.infradead.org>; Thu, 05 Jun 2003 15:42:19 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: matsunaga <matsunaga_kazuhisa@yahoo.co.jp>
In-Reply-To: <000e01c32b6f$22d11d80$570486da@w0a3t0>
References: <000e01c32b6f$22d11d80$570486da@w0a3t0>
Message-Id: <1054824176.17921.1415.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 05 Jun 2003 15:42:56 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: PAD macro
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-06-05 at 15:31, matsunaga wrote:
> Hi 
> 
> This is really a trivial thing, 
> but there are places where PAD macro is not used for 4byte alignment.
> I think it would be better to be unified.

You're right. s/(\([a-z]*\)+3)&~3/PAD(\1)/ applied accordingly; thanks.


-- 
dwmw2
