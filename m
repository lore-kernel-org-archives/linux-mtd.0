Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c0XvU-0005HT-2C
 for linux-mtd@lists.infradead.org; Sat, 29 Oct 2016 18:00:18 +0000
Received: by mail-wm0-x235.google.com with SMTP id e69so164337681wmg.0
 for <linux-mtd@lists.infradead.org>; Sat, 29 Oct 2016 10:59:54 -0700 (PDT)
Subject: Re: [PATCH RESEND v3] mtd: spi-nor: fix flags for s25fl128s
To: Heiner Kallweit <hkallweit1@gmail.com>
References: <4d3db993-d030-3659-2f62-94c373f57038@gmail.com>
 <808bf727-f562-79d4-a60f-5e437cc15da6@gmail.com>
 <514b12c9-447b-1688-29d3-aac839de08ac@gmail.com>
Cc: Jagan Teki <jteki@openedev.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 MTD Mailing List <linux-mtd@lists.infradead.org>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <5d633567-ca28-abe6-2789-ba9291e4eaf1@gmail.com>
Date: Sat, 29 Oct 2016 19:54:40 +0200
MIME-Version: 1.0
In-Reply-To: <514b12c9-447b-1688-29d3-aac839de08ac@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/27/2016 11:13 PM, Heiner Kallweit wrote:
> The Spansion S25FL128S also supports dual read mode.
> In addition remove flag SECT_4K. 4K erases are supported,
> but not uniformly.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> Reviewed-by: Jagan Teki <jteki@openedev.com>

Acked-by: Marek Vasut <marek.vasut@gmail.com>

-- 
Best regards,
Marek Vasut
