Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PwWIS-0007Qq-Dh
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2011 09:00:10 +0000
Received: by wyf23 with SMTP id 23so4157622wyf.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 07 Mar 2011 01:00:06 -0800 (PST)
Subject: Re: [PATCH V2 06/10] MIPS: lantiq: add NOR flash support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: John Crispin <blogic@openwrt.org>
In-Reply-To: <1298996006-15960-7-git-send-email-blogic@openwrt.org>
References: <1298996006-15960-1-git-send-email-blogic@openwrt.org>
	<1298996006-15960-7-git-send-email-blogic@openwrt.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 07 Mar 2011 10:58:40 +0200
Message-ID: <1299488320.2746.5.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>,
	Ralph Hempel <ralph.hempel@lantiq.com>, linux-mtd@lists.infradead.org,
	Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-03-01 at 17:13 +0100, John Crispin wrote:
> NOR flash is attached to the same EBU (External Bus Unit) as PCI. As described
> in the PCI patch, the EBU is a little buggy, resulting in the upper and lower
> 16 bit of the data on a 32 bit read are swapped. (essentially we have a addr^=2)
> 
> To work around this we do a addr^=2 during the probe. Once probed we adapt
> cfi->addr_unlock1 and cfi->addr_unlock2 to represent the endianess bug.
> 
> Changes in V2
> * handle the endianess bug inside the map code and not in the generic cfi code
> * remove the addr swizzle patch
> 
> Signed-off-by: John Crispin <blogic@openwrt.org>
> Signed-off-by: Ralph Hempel <ralph.hempel@lantiq.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>
> Cc: linux-mips@linux-mips.org
> Cc: linux-mtd@lists.infradead.org

There are a couple checkpatch.pl warnings, would you please address them
and resend?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
