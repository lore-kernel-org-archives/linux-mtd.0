Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15qqVc-0007m2-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Oct 2001 07:36:56 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <m3y9mljsin.fsf@DLT.linuxnetworx.com> 
References: <m3y9mljsin.fsf@DLT.linuxnetworx.com> 
To: ebiederman@lnxi.com (Eric W. Biederman)
Cc: linux-mtd@lists.infradead.org
Subject: Re: Q: Probing for devices > buswidth??? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 09 Oct 2001 07:45:59 +0100
Message-ID: <29886.1002609959@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

ebiederman@lnxi.com said:
> Trying to understand some anomolous results I discovered that
> gen_probe_newchip is looking for: 16 bit devices on an 8 bit bus. byte
> interleaved 16 bit devices on a 16 bit bus. And some really bizare
> things for a 32 bit bus.

> Is there any good reason for doing it that way?

What it's probing for is a 16-bit device in 8-bit mode. This is _different_ 
to an 8-bit device :)


--
dwmw2
