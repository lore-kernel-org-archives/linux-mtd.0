Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ZneW-00048F-NP
	for <linux-mtd@lists.infradead.org>; Tue, 08 Jul 2003 09:16:45 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Chris AtLee <chris@atlee.ca>
In-Reply-To: <1057642854.847.27.camel@geb>
References: <1057642854.847.27.camel@geb>
Message-Id: <1057652214.28965.97.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Tue, 08 Jul 2003 09:16:54 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: Teeny patch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-07-08 at 06:40, Chris AtLee wrote:
> My compiler (gcc 2.95.3) complains about "int ret = ..." on line 385 of
> mtd_blkdevs-24.c
> 
> Or should I be using a newer compiler? :)

No, gcc 2.95.3 is fine if I don't introduce accidental C99'isms. 

Patch applied; thanks.

-- 
dwmw2
