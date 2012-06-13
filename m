From: "Changming Chen (changmingche)" <changmingche@micron.com>
To: "linux-mtd-owner@lists.infradead.org"
 <linux-mtd-owner@lists.infradead.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Patch MTD: increase time out value for buffer program
Date: Wed, 13 Jun 2012 04:29:39 +0000
Message-ID: <6ACDE3A4C2F7E94C8DBB6FCC0D06A0873DA88046@NTXBOIMBX05.micron.com>
References: <mailman.0.1338988276.11201.linux-mtd@lists.infradead.org>
In-Reply-To: <mailman.0.1338988276.11201.linux-mtd@lists.infradead.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "Youxin He \(youxinhe\)" <youxinhe@micron.com>,
 "Frank Liu \(frankliu\)" <frankliu@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The time out value(1ms:typical HZ defined smaller than 1000) defined for fu=
nction "do_write_buffer" in "cfi_cmdset_0002.c" is not enough. Because the =
enlargement of buffer size, much time will cost for buffer program. It's ha=
s risk that time out will be triggered before buffer program finished and m=
ake misjudge for buffer program. we suggest that 4ms is more appropriate co=
mpare to 1ms. This change has no impact of program performance.

diff --git a/a/drivers/mtd/chips/cfi_cmdset_0002.c b/b/drivers/mtd/chips/cf=
i_cmd
index 9d93c45..7da8fca 100755
--- a/a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1312,7 +1312,7 @@ static int __xipram do_write_buffer(struct map_info *=
map,=20
         struct cfi_private *cfi =3D map->fldrv_priv;
         unsigned long timeo =3D jiffies + HZ;
         /* see comments in do_write_oneword() regarding uWriteTimeo. */
-        unsigned long uWriteTimeout =3D ( HZ / 1000 ) + 1;
+        unsigned long uWriteTimeout =3D ( HZ / 1000 ) + 4;
         int ret =3D -EIO;
         unsigned long cmd_adr;
         int z, words;

Best Regards!
chenchangming

Tel:+86-21-3899-7193
E-Mail:changmingche@micron.com
