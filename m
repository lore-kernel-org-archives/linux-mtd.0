Received: from mail-gw1-out.broadcom.com ([216.31.210.62])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xu9SS-00059f-Rf
 for linux-mtd@lists.infradead.org; Fri, 28 Nov 2014 00:30:49 +0000
Message-ID: <5477C215.7040905@broadcom.com>
Date: Thu, 27 Nov 2014 16:30:13 -0800
From: Scott Branden <sbranden@broadcom.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: added nand_shutdown
References: <sbranden@broadcom.com>
 <1416511085-3930-1-git-send-email-sbranden@broadcom.com>
 <20141126091015.GR3212@norris-Latitude-E6410>
In-Reply-To: <20141126091015.GR3212@norris-Latitude-E6410>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Corneliu Doban <cdoban@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 14-11-26 01:10 AM, Brian Norris wrote:
> +	mtd->_reboot = nand_shutdown;
Ah, I see you added this here.  This is great.  We'll try out your 
patchset on our driver and remove the reboot notifier from it.
