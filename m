Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17wWUz-0001Xn-00
	for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2002 00:32:17 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3D9A1D2B.1040501@YottaYotta.com> 
References: <3D9A1D2B.1040501@YottaYotta.com> 
To: Chris Morrow <cmorrow@YottaYotta.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Memory management problem? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 02 Oct 2002 00:32:09 +0100
Message-ID: <24712.1033515129@passion.cambridge.redhat.com>
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

cmorrow@YottaYotta.com said:
> A CDB89712 based system with 16 Meg. sdram and 16 meg CFI flash.
> Linux-2.4.19-rmk1 with linux-2.4.19-pre10-shared-zlib patch. 

cmorrow@YottaYotta.com said:
>  There are some "deflateInit failed" warning messages during
> the run.

You shouldn't see that if you're actually using the shared zlib patch.


--
dwmw2
