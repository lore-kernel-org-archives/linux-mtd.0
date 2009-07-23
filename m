Received: from oul111-200.netplaza.fi ([80.75.107.200] helo=gulp.u--3.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MU6D9-0002Ea-1p
	for linux-mtd@lists.infradead.org; Thu, 23 Jul 2009 21:52:27 +0000
Date: Thu, 23 Jul 2009 23:52:20 +0200
From: erno@gulp.u--3.com
To: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: UBIFS fails & crashes on SheevaPlug
Message-ID: <20090723215220.GA1792@gulp.u--3.com>
References: <20090723185928.GA1612@gulp.u--3.com> <4A68C329.5040808@nokia.com>
	<71cd59b00907231428w5b8b6190p2234d24bc59f0dbc@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71cd59b00907231428w5b8b6190p2234d24bc59f0dbc@mail.gmail.com>
Cc: "debian-arm@lists.debian.org" <debian-arm@lists.debian.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 23, 2009 at 11:28:01PM +0200, Corentin Chary wrote:
> Can you give us the exact commands you used ?

Straight copy-paste (except for the -r removal) from 
http://www.plugcomputer.org/plugwiki/index.php/Enabling_UBIFS - so:

   94  cd /var/tmp/
   95  mkfs.ubifs -m 2048 -e 129024 -c 4096 -o ubifs.img -x zlib
   96  /usr/local/usr/sbin/mkfs.ubifs -m 2048 -e 129024 -c 4096 -o 
ubifs.img -x zlib
   99  ubinize -o ubi.img -m 2048 -p 128KiB -s 512 ubi.cfg
  101  cat > ubi.cfg

  102  /usr/local/usr/sbin/ubinize -o ubi.img -m 2048 -p 128KiB -s 512 
ubi.cfg
  105  ubiformat /dev/mtd2 -s 512 -f ubi.img
  106  /usr/local/usr/sbin/ubiformat /dev/mtd2 -s 512 -f ubi.img
  107  /usr/local/usr/sbin/ubiattach /dev/ubi_ctrl -m 2

(funny paths courtesy of mtd-utils "make install")

ubi.cfg is

[ubifs]
mode=ubi
image=ubifs.img
vol_id=0
vol_size=256MiB
vol_type=dynamic
vol_name=rootfs
vol_flags=autoresize
