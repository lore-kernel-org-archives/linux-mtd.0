Received: from qw-out-1920.google.com ([74.125.92.146])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M6MJQ-0001Gn-Jq
	for linux-mtd@lists.infradead.org; Tue, 19 May 2009 10:13:10 +0000
Received: by qw-out-1920.google.com with SMTP id 4so2417357qwk.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 May 2009 03:12:23 -0700 (PDT)
Subject: Re: [PATCH] cfi_cmdset_0001.c: quirk for PF38F4476.
From: Daniel Ribeiro <drwyrm@gmail.com>
To: dedekind@infradead.org
In-Reply-To: <1242713035.15206.2.camel@localhost.localdomain>
References: <1242558137.26769.7.camel@brutus>
	<1242713035.15206.2.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 19 May 2009 07:12:08 -0300
Message-Id: <1242727928.6142.30.camel@brutus>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Nicolas Pitre <nico@cam.org>,
	openezx-devel <openezx-devel@lists.openezx.org>,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Em Ter, 2009-05-19 às 09:03 +0300, Artem Bityutskiy escreveu:
> On Sun, 2009-05-17 at 08:02 -0300, Daniel Ribeiro wrote:
> > This chip reports CFI 1.3, but the CFI PRI is like CFI 1.1. Add a quirk
> > to pass probe on this chip.
> > (This patch depends on "cfi_cmdset_0001.c: CFI 1.0 and CFI 1.1")
> > (sent again with CC to Nicolas Pitre)
> > 
> > Signed-off-by: Daniel Ribeiro <drwyrm@gmail.com>
> 
> I've pushed both to l2-mtd-2.6.git. The patches did not cleanly apply,
> probably because they were against an older linux code-base. Please,
> verify:
> 
> http://git.infradead.org/users/dedekind/l2-mtd-2.6.git
> 

Thanks Artem.

Patches were based on 2.6.30-rc4, last commit was "cfi_cmdset_0001.c:
Fix a bug in inval_cache_and_wait_for_operation()." (6ac15e), my guess
is that you had problems applying because you applied the "CFI: quirk
for PF38F4476." first. Next time I will send the patches as a series.

I verified the patches on your gitweb and they look ok.

-- 
Daniel Ribeiro
