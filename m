Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Aj4nv-00085k-Gy
	for linux-mtd@lists.infradead.org; Tue, 20 Jan 2004 22:57:03 +0000
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Dan Post <djp.mtd@onemyth.net>
In-Reply-To: <20040120215050.M62159@onemyth.net>
References: <20040120215050.M62159@onemyth.net>
Content-Type: text/plain
Message-Id: <1074638447.17320.183.camel@tubarao>
Mime-Version: 1.0
Date: 20 Jan 2004 15:40:47 -0700
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Intel flash and cfi_probe.c
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-01-20 at 14:50, Dan Post wrote:

> What would happen if we issued an 0xF0;0xFF to an AMD chip?  Or 0xFF;0xF0? 
> Any AMD chip-heads care to answer?  It looks like it will "work" on Intel chips...

This is what jedec_probe.c v1.44 does:


static inline void jedec_reset(u32 base, struct map_info *map, 
	struct cfi_private *cfi)
{
	/* Reset */
	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
	/* Some misdesigned intel chips do not respond for 0xF0 for a reset,
	 * so ensure we're in read mode.  Send both the Intel and the AMD command
	 * for this.  Intel uses 0xff for this, AMD uses 0xff for NOP, so
	 * this should be safe.
	 */ 
	cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
	/* FIXME - should have reset delay before continuing */
}


-- 
Thayne Harbaugh
Linux Networx
