Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17JddV-00015f-00
	for <linux-mtd@lists.infradead.org>; Sun, 16 Jun 2002 18:16:21 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3D0CC4F6.3060106@elphel.com> 
References: <3D0CC4F6.3060106@elphel.com>  <3D0CC18A.8080002@elphel.com> 
To: Andrey Filippov <andrey@elphel.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [Fwd: cfi_cmdset_0001.c: do_write_buffer bug] 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 16 Jun 2002 18:16:05 +0100
Message-ID: <25659.1024247765@redhat.com>
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

andrey@elphel.com said:
> Working with Intel TE28F640J3A and Axis ETRAX100LX processor I ran
> over a bug in cfi_cmdset_0001.c: do_write_buffer. It checks ready
> state 20 times but does not resend  Write-to-Buffer command (E8)
> before new checks. So if it was not ready first time it will never be
> ready later.

Fixed in CVS. thanks. 

--
dwmw2
