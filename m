Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 192oHa-0000qk-30
	for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2003 09:16:42 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Steven Scholz <steven.scholz@imc-berlin.de>
In-Reply-To: <3E92732C.90000@imc-berlin.de>
References: <3E92732C.90000@imc-berlin.de>
Message-Id: <1049789802.18045.83.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 08 Apr 2003 09:16:42 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: MTD <linux-mtd@lists.infradead.org>
Subject: Re: unknown conversion type character `z'
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-04-08 at 07:58, Steven Scholz wrote:
> nodemgmt.c:533: warning: unknown conversion type character `z' in format

> I am using ppc_8xx-gcc version 2.95.4. (Could that be the problem?)

Yes. It's too old to know about the C99 way of printing size_t. Should
be harmless though.

-- 
dwmw2
