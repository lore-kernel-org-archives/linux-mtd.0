Received: from wproxy.gmail.com ([64.233.184.203])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FDiPP-0007n3-Ue
	for linux-mtd@lists.infradead.org; Mon, 27 Feb 2006 08:27:29 -0500
Received: by wproxy.gmail.com with SMTP id i23so834232wra
	for <linux-mtd@lists.infradead.org>;
	Mon, 27 Feb 2006 05:27:23 -0800 (PST)
Message-ID: <625fc13d0602270527k39b18cabv5762c008bb1e2b73@mail.gmail.com>
Date: Mon, 27 Feb 2006 07:27:23 -0600
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
In-Reply-To: <44004666.8030805@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <43EB96DC.3030900@eptar.com> <43F74BF1.1080307@ru.mvista.com>
	<1140337326.2480.674.camel@localhost.localdomain>
	<200602210942.38302.manningc2@actrix.gen.nz>
	<1140471467.2480.793.camel@localhost.localdomain>
	<43FB00B4.9040706@yandex.ru>
	<1140523614.2480.931.camel@localhost.localdomain>
	<44004666.8030805@yandex.ru>
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org
Subject: Re: [Yaffs] bit error rates --> a vendor speaks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2/25/06, Artem B. Bityutskiy <dedekind@yandex.ru> wrote:
> BTW, talking about generalization, that mtd->eraseregions stuff is as
> bad as OOB. IMO, it is better to treat different regions as different
> partitions or as different MTD devices.

Why is that?

Often times the eraseregions have no practical use for the software
involved.  Take the Intel P30 for example.  It has a few eraseblocks
at either the top or bottom of the chip that are different eraseblock
size.  Some software may want to use this feature, but by having the
MTD layer abstract them away it makes a lot of things simpler.

If you have different eraseregions show up as different MTD devices
(or partitions which are essentially the same thing in this
discussion), then you have to manually concatenate them back into a
single device.  It takes a) more RAM overhead and b) more layers of
complexity to do that.

josh
