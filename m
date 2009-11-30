Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NF5jT-0006Fc-UX
	for linux-mtd@lists.infradead.org; Mon, 30 Nov 2009 12:52:04 +0000
Subject: Re: [RFC / PATCH] mtd/ubi: flush wl before clearing update marker
From: Artem Bityutskiy <dedekind@infradead.org>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
In-Reply-To: <20091129184602.GB30617@Chamillionaire.breakpoint.cc>
References: <20091129184602.GB30617@Chamillionaire.breakpoint.cc>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Nov 2009 14:51:37 +0200
Message-Id: <1259585497.7518.108.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2009-11-29 at 19:46 +0100, Sebastian Andrzej Siewior wrote:
> ubiupdatevol -t does the following:
> - ubi_start_update()
>   - set_update_marker()
>   - for all LEBs ubi_eba_unmap_leb()
>   - clear_update_marker()
>   - ubi_wl_flush()
> 
> ubi_wl_flush() physically erases all PEB, once it returns all PEBs are
> empty. clear_update_marker() has the update marker written after return.
> If there is a power cut between the last two functions then the UBI
> volume has no longer the "update" marker set and may have some valid
> LEBs while some of them may be gone.
> If that volume in question happens to be a UBIFS volume, then mount
> will fail with

This bug fix deserves being sent to Linus now, but it is now so late
that I'm really not sure I should do this, because if this causes any
regression, it will be too late to fix it for 2.6.32. So I think I'll
merge it to 2.6.33, is this OK with you?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
