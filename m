Received: from mail-ig0-x235.google.com ([2607:f8b0:4001:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aNSG6-0007Ye-B7
 for linux-mtd@lists.infradead.org; Sun, 24 Jan 2016 21:31:42 +0000
Received: by mail-ig0-x235.google.com with SMTP id z14so22911459igp.0
 for <linux-mtd@lists.infradead.org>; Sun, 24 Jan 2016 13:31:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.00.1601242020330.5958@tp.orcam.me.uk>
References: <1444813494-14985-1-git-send-email-javier@osg.samsung.com>
 <CACna6rwjMfTT4UgbyO=VmLaPic4xGcPxoMEL5yRmLW7hhvhXJQ@mail.gmail.com>
 <20151104185341.GN7274@google.com>
 <alpine.LFD.2.20.1601072006170.29879@eddie.linux-mips.org>
 <20160107230513.GL109450@google.com>
 <CACna6rw6Q=zaSo91ZK26zgjQ+0j+7=b6C_fPYngaKhnw0OmWeQ@mail.gmail.com>
 <alpine.LFD.2.20.1601081358300.29879@eddie.linux-mips.org>
 <20160108185120.GQ109450@google.com>
 <alpine.LFD.2.20.1601090058430.29879@eddie.linux-mips.org>
 <CACna6rwAfXQxX8o0+DxroB6vOGZax70VVdPOAjeoGGUsDjdNhA@mail.gmail.com>
 <20160123214918.GC24744@localhost>
 <alpine.DEB.2.00.1601242020330.5958@tp.orcam.me.uk>
Date: Sun, 24 Jan 2016 22:31:21 +0100
Message-ID: <CACna6rx26JEWSvckzzNdZ=XVySW9R6jbH-mkbc2JPxTrwJZWzg@mail.gmail.com>
Subject: Re: [PATCH] mtd: bcm47xxsflash: use devm_ioremap_nocache() instead of
 KSEG0ADDR()
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: "Maciej W. Rozycki" <macro@imgtec.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Ralf Baechle <ralf@linux-mips.org>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fengguang Wu <fengguang.wu@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Luis de Bethencourt <luisbg@osg.samsung.com>, Jeremy Kerr <jk@ozlabs.org>,
 Neelesh Gupta <neelegup@linux.vnet.ibm.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Cyril Bur <cyrilbur@gmail.com>, "Maciej W. Rozycki" <macro@linux-mips.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 24 January 2016 at 21:26, Maciej W. Rozycki <macro@imgtec.com> wrote:
> On Sat, 23 Jan 2016, Brian Norris wrote:
>
>> IIUC, this could be solved by:
>> (a) using an uncached mapping or
>> (b) explicitly invalidating the relevant region after doing flash writes
>> or erasures
>
>  Flash writes are usually much, much less frequent than reads, so
> optimising for reads is IMO the right direction.  So a cached mapping is =
a
> good choice, however invalidation must then be done after a write.

Can you give me some hint where to look at for cache invalidation?

--=20
Rafa=C5=82
