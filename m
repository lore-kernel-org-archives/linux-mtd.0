Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16T4dw-0007iz-00
	for <linux-mtd@lists.infradead.org>; Tue, 22 Jan 2002 17:23:32 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <176701c1a36a$be8df600$1900000a@v.vmanage.com> 
References: <176701c1a36a$be8df600$1900000a@v.vmanage.com>  <173a01c1a356$e3ed01c0$1900000a@v.vmanage.com> <16324.1011718407@redhat.com> 
To: "Gad Hayisraeli" <gad@syete.co.il>
Cc: "Linux-mtd List" <linux-mtd@lists.infradead.org>
Subject: Re: BSE MediaEngine - booting from flash problems 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 22 Jan 2002 17:34:26 +0000
Message-ID: <20638.1011720866@redhat.com>
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

gad@syete.co.il said:
> could you please add more details , and examples ? i never did this
> map before ...

drivers/mtd/maps/*.c

The Ocelot one, for example, probes and registers two ranges.

--
dwmw2
