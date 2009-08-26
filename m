Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MgMiB-0005bC-Uy
	for linux-mtd@lists.infradead.org; Wed, 26 Aug 2009 17:55:12 +0000
Date: Wed, 26 Aug 2009 18:55:03 +0100
From: Jamie Lokier <jamie@shareable.org>
To: massimo cirillo <maxcir@gmail.com>
Subject: Re: [PATCH] [MTD] CHIPS: 0xFF intolerance for M29W128G
Message-ID: <20090826175503.GC25726@shareable.org>
References: <62cbdcd90908260842l66275d12na133bdb7cc4ac14@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62cbdcd90908260842l66275d12na133bdb7cc4ac14@mail.gmail.com>
Cc: augulis.darius@gmail.com, linux-mtd@lists.infradead.org,
	RichardRetanubun@ruggedcom.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

massimo cirillo wrote:
> From: Massimo Cirillo <maxcir@gmail.com>
> 
> The M29W128G Numonyx flash devices are intolerant to any 0xFF command:
> in the Cfi_util.c the function cfi_qry_mode_off() (that resets the device
> after the autoselect mode) must have a 0xF0 command after the 0xFF command.
> Intel-like devices are not influenced by a 0xF0 command.
> This fix solves also the cause of the fixup_M29W128G_write_buffer() fix,
> that can be commented out now.
> The following patch applies to 2.6.30 kernel.

This change was discussed 1 year ago:

   http://lists.infradead.org/pipermail/linux-mtd/2008-August/022497.html

The conclusion was that 0xf0 after 0xff might not be safe for some
chips ("early revisions of L30"), but nobody could confirm which
chips, so Alexey Korolov suggested staying safe and using fixup
functions.

I'm inclined to think a per-manufacturer (ignoring chip-id) reset
function would be better than the attempt to poke several different
commands at a chip all mixed together in a careful order, knowing that
some commands break some chips but later commands fix them again.

-- Jamie
