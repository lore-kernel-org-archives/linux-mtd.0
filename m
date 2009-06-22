Received: from mail-gx0-f211.google.com ([209.85.217.211])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MIqh6-0001rV-1X
	for linux-mtd@lists.infradead.org; Mon, 22 Jun 2009 21:05:07 +0000
Received: by gxk7 with SMTP id 7so5303149gxk.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Jun 2009 14:04:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4A3FEE98.60700@harris.com>
References: <4A3FEE98.60700@harris.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Mon, 22 Jun 2009 17:04:22 -0400
Message-ID: <8bd0f97a0906221404x7536c6e0m822436dfb61714dc@mail.gmail.com>
Subject: Re: [Question] m25p80 driver versus spi clock rate
To: "Steven A. Falco" <sfalco@harris.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 22, 2009 at 16:50, Steven A. Falco wrote:
> I am trying to figure out how the mtd/devices/m25p80.c driver is supposed
> to set the spi clock speed. =C2=A0(Perhaps I'm making a bad assuption eve=
n to
> think that it _should_ set the clock speed. =C2=A0If so, please say so.)

it shouldnt.  this is done in the board resources via the speed_hz
field of the spi_board_info struct on a per-spi device setting.
-mike
