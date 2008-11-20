Received: from wf-out-1314.google.com ([209.85.200.170])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L2yiL-0007rt-PN
	for linux-mtd@lists.infradead.org; Thu, 20 Nov 2008 01:52:14 +0000
Received: by wf-out-1314.google.com with SMTP id 28so227452wfa.27
	for <linux-mtd@lists.infradead.org>;
	Wed, 19 Nov 2008 17:52:12 -0800 (PST)
Message-ID: <8bd0f97a0811191752l69f5f93eg72692338ce2c6892@mail.gmail.com>
Date: Wed, 19 Nov 2008 20:52:11 -0500
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "Nicolas Pitre" <nico@cam.org>
Subject: Re: [PATCH mtd-utils] fix CFLAGS handling wrt cross compilation
In-Reply-To: <alpine.LFD.2.00.0811191321420.27509@xanadu.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <alpine.LFD.2.00.0811191321420.27509@xanadu.home>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 19, 2008 at 13:31, Nicolas Pitre wrote:
> Let's have the "new ubi-utils" makefile handle CFLAGS like the other
> makefiles.  This is important when cross compiling and CFLAGS is
> externally provided. Without this, local include files are not found due
> to the various -I arguments which are then lost.
>
> Signed-off-by: Nicolas Pitre <nico@marvell.com>

i dont think sticking CFLAGS into CPPFLAGS is right.  they're separate
on purpose.  you also break custom CPPFLAG injection here ... CPPFLAGS
should be treated just like CFLAGS: appended, not strictly set.
-mike
