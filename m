Received: from nbd.name ([46.4.11.11])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PcbTG-0002Dp-9E
	for linux-mtd@lists.infradead.org; Tue, 11 Jan 2011 10:29:00 +0000
Message-ID: <4D2C3120.80602@openwrt.org>
Date: Tue, 11 Jan 2011 11:29:52 +0100
From: John Crispin <blogic@openwrt.org>
MIME-Version: 1.0
To: Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>
Subject: Re: [PATCH 06/10] MIPS: lantiq: add NOR flash support
References: <1294257379-417-1-git-send-email-blogic@openwrt.org>
	<1294257379-417-7-git-send-email-blogic@openwrt.org>
	<4D2BC787.20002@gmail.com>
In-Reply-To: <4D2BC787.20002@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
	Ralph Hempel <ralph.hempel@lantiq.com>,
	David Woodhouse <dwmw2@infradead.org>, Ralf Baechle <ralf@linux-mips.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/01/11 03:59, Daniel Schwierzeck wrote:
> Hi John,
>
> the EBU doesn't allow unaligned read or write access thus Lantiq added
> this alignment hack directly in hardware. The addr^=2 is only needed
> during CFI probe because odd addresses are accessed. A simple solution
> is inside your patch.
>
> The spin_lock_irqsave(&ebu_lock, flags); is actually not needed
> because the EBU does access arbitration and protection already in
> hardware.
>
> Daniel
>
Hi Daniel,

thx, i will try it out later on and then merge it into v2 of the series.

John
