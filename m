Received: from mail-yh0-f50.google.com ([209.85.213.50])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WzSH8-0005P2-Mf
 for linux-mtd@lists.infradead.org; Tue, 24 Jun 2014 15:04:50 +0000
Received: by mail-yh0-f50.google.com with SMTP id t59so268599yho.9
 for <linux-mtd@lists.infradead.org>; Tue, 24 Jun 2014 08:04:23 -0700 (PDT)
Date: Tue, 24 Jun 2014 12:03:37 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v1 3/3] ARM: dts: am335x-bone: add support for beaglebone
 LCD4 cape
Message-ID: <20140624150336.GA10041@arch.cereza>
References: <1403612666-31197-1-git-send-email-pekon@ti.com>
 <1403612666-31197-4-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1403612666-31197-4-git-send-email-pekon@ti.com>
Cc: Tony Lindgren <tony@atomide.com>, Jason Kridner <jkridner@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 Robert Nelson <robertcnelson@gmail.com>,
 Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Pekon,

On 24 Jun 05:54 PM, Pekon Gupta wrote:
> This patch adds support for LCD4 cape as advertised on
>   http://elinux.org/CircuitCo:BeagleBone_LCD4
> 
> This cape has:
> * 480x272 TFT-LCD panel
>  - LCD panel datasheet and timing information are sourced from [1]
>  - LCD backlight is connected to 'EHRPWM1A' on cape board, but its used for
>    enabling backlight power-supply. So 'gpio-backlight' driver is used instead
>    of 'pwm-backlight' driver (Kconfig: BACKLIGHT_GPIO=y).
> 

I'm confused about this, can you clarify why you are not using pwm-backlight?

-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
