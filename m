Received: from viefep16-int.chello.at ([213.46.255.17])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16SnFn-0006cj-00
	for <linux-mtd@lists.infradead.org>; Mon, 21 Jan 2002 22:49:27 +0000
Message-ID: <3C4C9AA6.92B91D59@softsys.co.at>
Date: Mon, 21 Jan 2002 23:48:06 +0100
From: Erwin Authried <eauth@softsys.co.at>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: Steve Kranz <skranz@ridgerun.com>,
 	linux-mtd@lists.infradead.org
Subject: Re: MTD on linux 2.0.38?
References: <3C4C91CD.D9574F9B@ridgerun.com> <4784.1011652929@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

I have switched to uClinux-2.4.x a couple of months ago, and I'm afraid
that I'll not spend any time on 2.0.38 anymore. I got  really sick on
backporting all the 2.4 stuff, not only MTD. I have written a small
README for patching uClinux-2.0.38 , it's in the MTD folder at
http://uclinux.home.at/. There aren't many differences with the "full"
2.0.38 kernel, I hope.

-Erwin

David Woodhouse schrieb:
> 
> skranz@ridgerun.com said:
> >   As of many months ago it was my understanding that
> >   MTD had never been back-ported to the 2.0.38 kernel.
> >   Is this still the case?
> 
> There are periodic screams of anguish when I break the 2.0 build, and I try
> not to - it ought to work without too much pain. Erwin?
> 
> --
> dwmw2
