Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19JsZe-0001s3-8d
	for <linux-mtd@lists.infradead.org>; Sun, 25 May 2003 11:17:54 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: kusdogan@boun.edu.tr
In-Reply-To: <1053811251.3ecfe23346059@webmail.boun.edu.tr>
References: <1053811251.3ecfe23346059@webmail.boun.edu.tr>
Message-Id: <1053857920.2082.25.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Sun, 25 May 2003 11:18:41 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Oops ERROR : Unable to handle kernel NULL pointer dereference
 at virtual address 00000000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2003-05-24 at 22:20, kusdogan@boun.edu.tr wrote:
> Backtrace: no frame pointer

That's going to render the information given by the BUG() I just added
quite useless. Build with -mapcs-frame in your CFLAGS



-- 
dwmw2
