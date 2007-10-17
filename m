Received: from smtp2.linux-foundation.org ([207.189.120.14])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Ii3Fr-00077g-92
	for linux-mtd@lists.infradead.org; Wed, 17 Oct 2007 08:23:51 +0100
Date: Wed, 17 Oct 2007 00:23:17 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Subject: Re: [BUG] 2.6.23-rc9 kernel panic - simple_map_write+0x4e/0x75
Message-Id: <20071017002317.7ae2cbf4.akpm@linux-foundation.org>
In-Reply-To: <4715B5A5.9050005@linux.vnet.ibm.com>
References: <4710686C.8060603@linux.vnet.ibm.com>
	<20071016134620.7b3ce56f.akpm@linux-foundation.org>
	<4715B5A5.9050005@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 17 Oct 2007 12:41:33 +0530 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com> wrote:

> >> [  321.592882] Code: 83 f8 01 75 0a 03 7b 10 8b 45 d4 88 07 eb 35 83 f8 02 75 0c
> >> 0f b7 45 d4 03 7b 10 66 89 07 eb 24 83 f8 04 75 0a 03 7b 10 8b 45 d4 <89> 07 eb
> >> 15 7e 13 03 7b 10 89 c1 c1 e9 02 f3 a5 89 c1 83 e1 03 
> >> [  321.668990] EIP: [<c0d7e4e2>] simple_map_write+0x4e/0x75 SS:ESP 0068:c3ca8d6c
> >> [  321.695750] Kernel panic - not syncing: Attempted to kill init!
> > 
> > Would I be correct in assuming that the machine has no mtd devices, but
> > you happened to link that driver into your vmlinux?
> > 
> 
> Hi Andrew,
> 
> The machine do not have the mtd device, and the mtd is compiled into the vmlinuz.
> This configuration works fine for other kernels and is reproducible with
> 2.6.23-rc9 only.

So 2.6.23 is OK?
