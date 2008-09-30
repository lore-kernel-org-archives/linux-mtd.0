Received: from yx-out-1718.google.com ([74.125.44.157])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kkdvw-0002Tn-IA
	for linux-mtd@lists.infradead.org; Tue, 30 Sep 2008 12:02:29 +0000
Received: by yx-out-1718.google.com with SMTP id 3so1326817yxi.72
	for <linux-mtd@lists.infradead.org>;
	Tue, 30 Sep 2008 05:02:25 -0700 (PDT)
Message-ID: <c384c5ea0809300502h48915058r78a6586968c1ac1a@mail.gmail.com>
Date: Tue, 30 Sep 2008 14:02:25 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: "Haavard Skinnemoen" <haavard.skinnemoen@atmel.com>
Subject: Re: [PATCH] mtd: AT49BV6416 has swapped erase regions
In-Reply-To: <1222775733-6690-1-git-send-email-haavard.skinnemoen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1222775733-6690-1-git-send-email-haavard.skinnemoen@atmel.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Haavard,

On Tue, Sep 30, 2008 at 1:55 PM, Haavard Skinnemoen
<haavard.skinnemoen@atmel.com> wrote:
> The CFI information read from AT49BV6416 lists the erase regions in the
> wrong order, causing problems when trying to erase or update the first
> or last 64K block.
>
Are there other Atmel designs with this bug or only the chip with this CFI ID?

I ask, because the check in u-boot is too generic; I found u-boot
wrongly assumes wrong order for another Atmel part, not checking on a
specific CFI ID.

(Need to lookup the part numbers later at home).

Regards,
-- 
Leon
