Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OlkpL-0006Zh-B7
	for linux-mtd@lists.infradead.org; Wed, 18 Aug 2010 15:45:21 +0000
In-Reply-To: <201008181401.15328.florian@openwrt.org>
References: <201008181401.15328.florian@openwrt.org>
Subject: Re: [PATCH 3/4 v2] lib: add crc16_le helper
To: Florian Fainelli <florian@openwrt.org>
Message-ID: <OF455F8776.C288C2AE-ONC1257783.0055D496-C1257783.00566B4E@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Wed, 18 Aug 2010 17:43:55 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	linux-mtd@lists.infradead.org, Maxime Bizon <mbizon@freebox.fr>,
	David Woodhouse <dwmw2@infradead.org>, Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> This patch adds a crc16_le helper function to lib/crc16.c
>
> Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
> Signed-off-by: Florian Fainelli <ffainelli@freebox.fr>
> --
> diff --git a/include/linux/crc16.h b/include/linux/crc16.h
> index 9443c08..6c1c61f 100644
> --- a/include/linux/crc16.h
> +++ b/include/linux/crc16.h
> @@ -26,5 +26,7 @@ static inline u16 crc16_byte(u16 crc, const u8 data)
>     return (crc >> 8) ^ crc16_table[(crc ^ data) & 0xff];
>  }
>
> +extern u16 crc16_le(u16 crc, const u8 *buffer, size_t len);
> +
>  #endif /* __CRC16_H */
>
> diff --git a/lib/crc16.c b/lib/crc16.c
> index 8737b08..ec4a95c 100644
> --- a/lib/crc16.c
> +++ b/lib/crc16.c
> @@ -62,6 +62,18 @@ u16 crc16(u16 crc, u8 const *buffer, size_t len)
>  }
>  EXPORT_SYMBOL(crc16);
>
> +u16 crc16_le(u16 crc, u8 const *p, size_t len)
> +{
> +   int i;
> +   while (len--) {
> +      crc ^= *p++ << 8;
> +      for (i = 0; i < 8; i++)
> +         crc = (crc << 1) ^ ((crc & 0x8000) ? 0x8005 : 0);
> +   }
> +   return crc;
> +}
> +EXPORT_SYMBOL(crc16_le);
> +
>  MODULE_DESCRIPTION("CRC16 calculations");
>  MODULE_LICENSE("GPL");

Don't recall much of my earlier crc32 work but the above looks wrong.
crc & 0x8000 suggests this is a big endian crc. if so, 0x8005 looks
wrong too. see CRCPOLY_LE resp. CRCPOLY_BE for an idea.
What is this crc sum used for?

       Jocke
