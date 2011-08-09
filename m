Received: from mail-ey0-f171.google.com ([209.85.215.171])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QqqCp-0004iB-5j
	for linux-mtd@lists.infradead.org; Tue, 09 Aug 2011 17:35:09 +0000
Received: by eyg24 with SMTP id 24so332744eyg.30
	for <linux-mtd@lists.infradead.org>;
	Tue, 09 Aug 2011 10:35:03 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <CAN8TOE9p1v=mDUawRrnVAwDO4zz9LmXkqdNynLPCSCnBRMr9pw@mail.gmail.com>
References: <201107251148.51262.brian.foster@maxim-ic.com>
	<CAN8TOE8Uk09DPJ_OYXh4RjnKkXugEFLpZQ+hrA4Gw4oK2cQYOw@mail.gmail.com>
	<201107260921.44512.brian.foster@maxim-ic.com>
	<CAN8TOE847yECw3zeh42tf=6mC73O33Lr7Lzwpi0FrT-rB9ZYmg@mail.gmail.com>
	<CAMjpGUc1a4NR5PWt3A5Y+jv6ihsWjUgH3iVUpNc0dsvkEzx6pw@mail.gmail.com>
	<CAN8TOE--96V6ZruB8+VvAz2kqxqMq4nc4d5=6SGsUt0eu7og0g@mail.gmail.com>
	<CAMjpGUcTPR=EVOtfju5_S4Zu_h-rmqnCii4R0j7yFX8JTD81uA@mail.gmail.com>
	<CAN8TOE9p1v=mDUawRrnVAwDO4zz9LmXkqdNynLPCSCnBRMr9pw@mail.gmail.com>
From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 9 Aug 2011 13:34:42 -0400
Message-ID: <CAMjpGUcjhuc6MaH0y2vGdM5ru00BJEmVeBwMUebkbfoxDNY28g@mail.gmail.com>
Subject: Re: [BUG] mtdinfo -a: Tries to open NULL pointer for NOR with
	Eraseblock Regions
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Brian Foster <brian.foster@maxim-ic.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 8, 2011 at 19:19, Brian Norris wrote:
> "Alternatively, --all only prints what it can get,
> and --help warns there _may_ be additional data not
> printed by --all (and to use =E2=80=98mtdinfo /dev/mtd<N>=E2=80=99)."

that's really the only other option of the three.
1: add region_info to sysfs
2: add a warning --all that it could be incomplete
3: have --all use the legacy lookup func to get /dev/mtd#

i dont have a preference between any of these 3.  obviously removing
region_info support is not an option.
-mike
