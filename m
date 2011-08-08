Received: from antispam01.maxim-ic.com ([205.153.101.182])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QqL2H-0001qA-L0
	for linux-mtd@lists.infradead.org; Mon, 08 Aug 2011 08:18:10 +0000
From: Brian Foster <brian.foster@maxim-ic.com>
To: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [BUG] mtdinfo -a: Tries to open NULL pointer for NOR with
	Eraseblock Regions
Date: Mon, 8 Aug 2011 10:16:54 +0200
References: <201107251148.51262.brian.foster@maxim-ic.com>
	<CAN8TOE--96V6ZruB8+VvAz2kqxqMq4nc4d5=6SGsUt0eu7og0g@mail.gmail.com>
	<CAMjpGUcTPR=EVOtfju5_S4Zu_h-rmqnCii4R0j7yFX8JTD81uA@mail.gmail.com>
In-Reply-To: <CAMjpGUcTPR=EVOtfju5_S4Zu_h-rmqnCii4R0j7yFX8JTD81uA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-ID: <201108081016.54075.brian.foster@maxim-ic.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 06 August 2011 03:18:53 Mike Frysinger wrote:
>[...]
> alternatively, we punt --all and just make users run
> `mtdinfo /dev/mtd?`.  i'm fine with that too.

 Alternatively, --all only prints what it can get,
 and --help warns there _may_ be additional data not
 printed by --all (and to use =E2=80=98mtdinfo /dev/mtd<N>=E2=80=99).

cheers!
	-blf-
=2D-=20
Brian FOSTER
Principal MTS, Software
Maxim Integrated Products (Microcontroller BU), formerly Innova Card
Web    : http://www.maxim-ic.com/
