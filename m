Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19JyeP-0001kP-HH
	for <linux-mtd@lists.infradead.org>; Sun, 25 May 2003 17:47:14 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: kusdogan@boun.edu.tr
In-Reply-To: <1053891017.3ed119c966818@webmail.boun.edu.tr>
References: <1053811251.3ecfe23346059@webmail.boun.edu.tr>
	 <1053855854.2082.3.camel@passion.cambridge.redhat.com>
	 <1053887191.3ed10ad7ea7cf@webmail.boun.edu.tr>
	 <1053876687.17182.1.camel@imladris.demon.co.uk>
	 <1053891017.3ed119c966818@webmail.boun.edu.tr>
Message-Id: <1053881278.17182.4.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Sun, 25 May 2003 17:47:58 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Oops ERROR : Unable to handle kernel NULL pointer
 dereference	at virtual address 00000000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2003-05-25 at 20:30, kusdogan@boun.edu.tr wrote:
> It's still at the same line in add_mtd_device()

Why do you say that? It doesn't _look_ like it is...

> >>EIP; c0089200 <add_mtd_blktrans_dev+74/2b0>   <=====

Please show the backtrace.

-- 
dwmw2
