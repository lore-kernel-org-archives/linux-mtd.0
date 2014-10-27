Received: from mail-ie0-x22f.google.com ([2607:f8b0:4001:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XillS-0003oh-BY
 for linux-mtd@lists.infradead.org; Mon, 27 Oct 2014 14:59:22 +0000
Received: by mail-ie0-f175.google.com with SMTP id at20so4347688iec.6
 for <linux-mtd@lists.infradead.org>; Mon, 27 Oct 2014 07:59:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <A765B125120D1346A63912DDE6D8B6315E8808@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6315E62CB@NTXXIAMBX02.xacn.micron.com>
 <201410150045.53976.marex@denx.de>
 <A765B125120D1346A63912DDE6D8B6315E6D82@NTXXIAMBX02.xacn.micron.com>
 <CACna6rxGzOVu+PKFxHeD7fnhG__3kcM-vY=q8OgtSVgZuQzGwA@mail.gmail.com>
 <A765B125120D1346A63912DDE6D8B6315E8808@NTXXIAMBX02.xacn.micron.com>
Date: Mon, 27 Oct 2014 15:59:00 +0100
Message-ID: <CACna6ryw_izq5n6esFZ2TipL7d6B6YnAJptJrW6za-+ySJN4pw@mail.gmail.com>
Subject: Re: [PATCH 1/1 v2] driver:mtd:spi-nor:fix spi_nor_scan overwrite
 platform ID point
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: bpqw <bpqw@micron.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Marek Vasut <marex@denx.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "grmoore@altera.com" <grmoore@altera.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "shijie8@gmail.com" <shijie8@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 27 October 2014 09:44, bpqw <bpqw@micron.com> wrote:
> Maybe this patch is not very reasonable.But for fix this case,I will deve=
lop a new  patch that
> is just used to add extended ID for micron spi nor in the spi_nor_ids[].

Great, I hope it will work on top of the
[PATCH] mtd: spi-nor: prefer more specific entries from chips database
, good luck :)

--=20
Rafa=C5=82
