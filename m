Received: from service87.mimecast.com ([91.220.42.44])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V47y2-0002sg-JS
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 11:19:51 +0000
Message-ID: <1375183165.2272.1.camel@hornet>
Subject: Re: [PATCH v2 4/4] mtd: nand: gpio: Add support for multichip devices
From: Pawel Moll <pawel.moll@arm.com>
To: Alexander Shiyan <shc_work@mail.ru>
Date: Tue, 30 Jul 2013 12:19:25 +0100
In-Reply-To: <1375182325-30003-2-git-send-email-shc_work@mail.ru>
References: <1375182325-30003-1-git-send-email-shc_work@mail.ru>
 <1375182325-30003-2-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Ian Campbell <ian.campbell@citrix.com>, Stephen Warren <swarren@wwwdotorg.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Rob Herring <rob.herring@calxeda.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2013-07-30 at 15:05 +0400, Alexander Shiyan wrote:
> +- gpio-ale : specifies the ALE gpio pin.
> +- gpio-cle : specifies the CLE gpio pin.
> +- gpio-nwp : specifies the NWP gpio pin (Optional).
> +- gpios-nce : specifies the NCE gpio pin or several NCE GPIOs for multic=
hip NAND.
> +- gpios-rdy : specifies the RDY gpio pin or several RDY GPIOs for multic=
hip NAND.

Let me quote Documentation/devicetree/bindings/gpio/gpio.txt:

=09GPIO properties should be named "[<name>-]gpios"

So I believe it should rather be: "ale-gpios", "cle-gpios", "nwp-gpios",
"nce-gpios", "rdy-gpios"...

Pawel
