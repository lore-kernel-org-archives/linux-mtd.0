Received: from mail.renesas.com ([202.234.163.13] helo=mail02.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KrmeC-0001El-0G
	for linux-mtd@lists.infradead.org; Mon, 20 Oct 2008 04:45:40 +0000
Date: Mon, 20 Oct 2008 13:45:26 +0900
From: Yoshihiro Shimoda <shimoda.yoshihiro@renesas.com>
Subject: Re: [RESEND][PATCH v2] mtd: sh_flctl: add support for Renesas SuperH
	FLCTL
In-reply-to: <20081020024821.GB19540@linux-sh.org>
Sender: shimoda.yoshihiro@renesas.com
To: Paul Mundt <lethal@linux-sh.org>, dwmw2@infradead.org
Message-id: <48FC0CE6.7040307@renesas.com>
MIME-version: 1.0
Content-type: text/plain; charset=windows-1252
Content-transfer-encoding: 7bit
References: <48F48F3E.3080806@renesas.com>
	<20081020024701.GA19540@linux-sh.org>
	<20081020024821.GB19540@linux-sh.org>
Cc: linux-mtd@lists.infradead.org, linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Paul Mundt wrote:
> On Mon, Oct 20, 2008 at 11:47:01AM +0900, Paul Mundt wrote:
>> On Tue, Oct 14, 2008 at 09:23:26PM +0900, Yoshihiro Shimoda wrote:
>>> Several Renesas SuperH CPU has FLCTL. The FLCTL support NAND Flash.
>>> This driver support SH7723.
>>>
>>> Signed-off-by: Yoshihiro Shimoda <shimoda.yoshihiro@renesas.com>
>>> Acked-by: Paul Mundt <lethal@linux-sh.org>
>> Please CC Andrew on this, as no one on the MTD side of things seems to be
>> awake.
> 
> Scratch that, I see this version has been applied to the MTD git.
> 

Thank you for checking.
Although I also checked, the imperfect code has been taken into git
because the patch had broken. In such a case, should the whole patch
be resent?

Thanks,
Yoshihiro Shimoda
