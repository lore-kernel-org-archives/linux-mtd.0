Received: from mail2.br-automation.com ([213.33.116.61])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XAd8D-0002x1-Se
 for linux-mtd@lists.infradead.org; Fri, 25 Jul 2014 10:53:46 +0000
In-Reply-To: <1406284444-16733-4-git-send-email-pekon@ti.com>
References: <1406284444-16733-1-git-send-email-pekon@ti.com>
 <1406284444-16733-4-git-send-email-pekon@ti.com>
To: Pekon Gupta <pekon@ti.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/3] ARM: dts: am335x-bone: add support for beaglebone
 LCD4 cape
Message-ID: <OF7172B336.27CEF409-ONC1257D20.003BCA0E-C1257D20.003BD1C2@br-automation.com>
From: Hannes Petermaier <Hannes.Petermaier@br-automation.com>
Date: Fri, 25 Jul 2014 12:53:23 +0200
Content-Type: text/plain; charset="US-ASCII"
Cc: Tony Lindgren <tony@atomide.com>, linux-omap-owner@vger.kernel.org,
 linux-mtd <linux-mtd@lists.infradead.org>, Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Javier Martinez Canillas <javier@dowhile0.org>,
 linux-omap <linux-omap@vger.kernel.org>, Roger Quadros <rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

sorry - send it again, because i'm not sure about mailinglist-server takes 
"Antwort: ..." within the subject.

Hi Pekon,

i've a question about your display timings:

> +      display-timings {
> +         native-mode = <&timing0>;
> +         /* www.newhavendisplay.com/app_notes/OTA5180A.pdf */
> +         timing0: 480x272 {
> +            clock-frequency = <92000000>;

did you ever test this ? clock frequency is here defined with 92MHz, 
datasheet from the link above says to setup 9MHz. Is there eventually one 
zero much ?

best regards,
Hannes
