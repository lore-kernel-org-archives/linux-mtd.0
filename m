Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Rwmd-0000zv-VG
	for <linux-mtd@lists.infradead.org>; Mon, 16 Jun 2003 17:24:39 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: f.callaghan@ieee.org
In-Reply-To: <200306161206.06488.f.callaghan@ieee.org>
References: <OOEOKBMECIFAEPIMFOGIMEPICBAA.sgluckman@omnitech.com>
	 <200306140052.38541.tglx@linutronix.de>
	 <200306131854.00636.f.callaghan@ieee.org>
	 <200306161206.06488.f.callaghan@ieee.org>
Message-Id: <1055780708.2233.18.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 16 Jun 2003 17:25:08 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Please Help, problem mounting jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-06-16 at 17:06, Frank R Callaghan wrote:
> Hi All,
> 
> I methodically removed code from my usrland programs until I'm left with
> 
> int main()
> {
>     while(1) {
>     //  sleep(1);
>     }
> }
> 
> With no RTAI modules loaded, the gc thread still stalls.
> With the sleep(1) works fine !
> 
> Does this mean that the gc thread has such a low priority that it never runs ?

No, it looks like your userspace prograem has such a _high_ priority
that the GC thread never runs. A subtle difference :)

> What should I do/try next ?

This is an RTAI-specific issue. I suspect your test program above has
its priority set such that when it's eating 100% CPU time in a tight
loop, nothing else gets to run. Have you asked on the RTAI mailing
lists?

-- 
dwmw2
