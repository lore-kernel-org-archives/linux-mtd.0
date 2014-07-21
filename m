Received: from nm7-vm10.bullet.mail.sg3.yahoo.com ([106.10.148.185])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9Ieu-0000bq-DV
 for linux-mtd@lists.infradead.org; Mon, 21 Jul 2014 18:50:01 +0000
References: <1405519230-48409-1-git-send-email-samarthp@ymail.com> 
Message-ID: <1405968570.83800.YahooMailNeo@web192501.mail.sg3.yahoo.com>
Date: Tue, 22 Jul 2014 02:49:30 +0800
From: Samarth Parikh <samarthp@ymail.com>
Reply-To: Samarth Parikh <samarthp@ymail.com>
Subject: [PATCH] Drivers: MTD: Fixed checkpatch seq_printf warnings
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
In-Reply-To: <1405519230-48409-1-git-send-email-samarthp@ymail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fixed checkpatch warnings: "WARNING: Prefer seq_puts to seq_printf"=0A=0A=
=0A=0A=0AThis patch is created with reference to the ongoing lkml thread=0A=
https://lkml.org/lkml/2014/7/15/646=0Awhere Andrew Morton wrote:=0A=0A"=0A-=
 puts is presumably faster=0A=0A- puts doesn't go rogue if you accidentally=
 pass it a "%".=0A=0A- this patch would actually make compiled object files=
 few bytes smaller.=0A=A0 Perhaps because seq_printf() is a varargs functio=
n, forcing the=0A=A0 caller to pass args on the stack instead of in registe=
rs.=0A"=0A=0ASigned-off-by: Samarth Parikh <samarthp@ymail.com>=0A---=0Adri=
vers/mtd/devices/docg3.c | 26 +++++++++++++-------------=0Adrivers/mtd/mtds=
wap.c=A0 =A0 =A0=A0=A0|=A0 4 ++--=0A2 files changed, 15 insertions(+), 15 d=
eletions(-)=0A=0Adiff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/dev=
ices/docg3.c=0Aindex 91a169c..21cc4b6 100644=0A--- a/drivers/mtd/devices/do=
cg3.c=0A+++ b/drivers/mtd/devices/docg3.c=0A@@ -1697,16 +1697,16 @@ static =
int dbg_asicmode_show(struct seq_file *s, void *p)=0A=0A=A0=A0=A0 switch (m=
ode) {=0A=A0=A0=A0 case DOC_ASICMODE_RESET:=0A-=A0=A0=A0 =A0=A0=A0 pos +=3D=
 seq_printf(s, "reset");=0A+=A0=A0=A0 =A0=A0=A0 pos +=3D seq_puts(s, "reset=
");=0A=A0=A0=A0 =A0=A0=A0 break;=0A=A0=A0=A0 case DOC_ASICMODE_NORMAL:=0A-=
=A0=A0=A0 =A0=A0=A0 pos +=3D seq_printf(s, "normal");=0A+=A0=A0=A0 =A0=A0=
=A0 pos +=3D seq_puts(s, "normal");=0A=A0=A0=A0 =A0=A0=A0 break;=0A=A0=A0=
=A0 case DOC_ASICMODE_POWERDOWN:=0A-=A0=A0=A0 =A0=A0=A0 pos +=3D seq_printf=
(s, "powerdown");=0A+=A0=A0=A0 =A0=A0=A0 pos +=3D seq_puts(s, "powerdown");=
=0A=A0=A0=A0 =A0=A0=A0 break;=0A=A0=A0=A0 }=0A-=A0=A0=A0 pos +=3D seq_print=
f(s, ")\n");=0A+=A0=A0=A0 pos +=3D seq_puts(s, ")\n");=0A=A0=A0=A0 return p=
os;=0A}=0ADEBUGFS_RO_ATTR(asic_mode, dbg_asicmode_show);=0A@@ -1745,22 +174=
5,22 @@ static int dbg_protection_show(struct seq_file *s, void *p)=0A=A0=
=A0=A0 pos +=3D seq_printf(s, "Protection =3D 0x%02x (",=0A=A0=A0=A0 =A0=A0=
=A0 =A0=A0=A0=A0=A0protect);=0A=A0=A0=A0 if (protect & DOC_PROTECT_FOUNDRY_=
OTP_LOCK)=0A-=A0=A0=A0 =A0=A0=A0 pos +=3D seq_printf(s, "FOUNDRY_OTP_LOCK,"=
);=0A+=A0=A0=A0 =A0=A0=A0 pos +=3D seq_puts(s, "FOUNDRY_OTP_LOCK,");=0A=A0=
=A0=A0 if (protect & DOC_PROTECT_CUSTOMER_OTP_LOCK)=0A-=A0=A0=A0 =A0=A0=A0 =
pos +=3D seq_printf(s, "CUSTOMER_OTP_LOCK,");=0A+=A0=A0=A0 =A0=A0=A0 pos +=
=3D seq_puts(s, "CUSTOMER_OTP_LOCK,");=0A=A0=A0=A0 if (protect & DOC_PROTEC=
T_LOCK_INPUT)=0A-=A0=A0=A0 =A0=A0=A0 pos +=3D seq_printf(s, "LOCK_INPUT,");=
=0A+=A0=A0=A0 =A0=A0=A0 pos +=3D seq_puts(s, "LOCK_INPUT,");=0A=A0=A0=A0 if=
 (protect & DOC_PROTECT_STICKY_LOCK)=0A-=A0=A0=A0 =A0=A0=A0 pos +=3D seq_pr=
intf(s, "STICKY_LOCK,");=0A+=A0=A0=A0 =A0=A0=A0 pos +=3D seq_puts(s, "STICK=
Y_LOCK,");=0A=A0=A0=A0 if (protect & DOC_PROTECT_PROTECTION_ENABLED)=0A-=A0=
=A0=A0 =A0=A0=A0 pos +=3D seq_printf(s, "PROTECTION ON,");=0A+=A0=A0=A0 =A0=
=A0=A0 pos +=3D seq_puts(s, "PROTECTION ON,");=0A=A0=A0=A0 if (protect & DO=
C_PROTECT_IPL_DOWNLOAD_LOCK)=0A-=A0=A0=A0 =A0=A0=A0 pos +=3D seq_printf(s, =
"IPL_DOWNLOAD_LOCK,");=0A+=A0=A0=A0 =A0=A0=A0 pos +=3D seq_puts(s, "IPL_DOW=
NLOAD_LOCK,");=0A=A0=A0=A0 if (protect & DOC_PROTECT_PROTECTION_ERROR)=0A-=
=A0=A0=A0 =A0=A0=A0 pos +=3D seq_printf(s, "PROTECT_ERR,");=0A+=A0=A0=A0 =
=A0=A0=A0 pos +=3D seq_puts(s, "PROTECT_ERR,");=0A=A0=A0=A0 else=0A-=A0=A0=
=A0 =A0=A0=A0 pos +=3D seq_printf(s, "NO_PROTECT_ERR");=0A-=A0=A0=A0 pos +=
=3D seq_printf(s, ")\n");=0A+=A0=A0=A0 =A0=A0=A0 pos +=3D seq_puts(s, "NO_P=
ROTECT_ERR");=0A+=A0=A0=A0 pos +=3D seq_puts(s, ")\n");=0A=0A=A0=A0=A0 pos =
+=3D seq_printf(s, "DPS0 =3D 0x%02x : "=0A=A0=A0=A0 =A0=A0=A0 =A0=A0=A0=A0=
=A0"Protected area [0x%x - 0x%x] : OTP=3D%d, READ=3D%d, "=0Adiff --git a/dr=
ivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c=0Aindex 8b33b26..0ec96cd 100644=
=0A--- a/drivers/mtd/mtdswap.c=0A+++ b/drivers/mtd/mtdswap.c=0A@@ -1287,7 +=
1287,7 @@ static int mtdswap_show(struct seq_file *s, void *data)=0A=0A=A0=
=A0=A0 seq_printf(s, "total erasures: %lu\n", sum);=0A=0A-=A0=A0=A0 seq_pri=
ntf(s, "\n");=0A+=A0=A0=A0 seq_puts(s, "\n");=0A=0A=A0=A0=A0 seq_printf(s, =
"mtdswap_readsect count: %llu\n", d->sect_read_count);=0A=A0=A0=A0 seq_prin=
tf(s, "mtdswap_writesect count: %llu\n", d->sect_write_count);=0A@@ -1296,7=
 +1296,7 @@ static int mtdswap_show(struct seq_file *s, void *data)=0A=A0=
=A0=A0 seq_printf(s, "mtd write count: %llu\n", d->mtd_write_count);=0A=A0=
=A0=A0 seq_printf(s, "discarded pages count: %llu\n", d->discard_page_count=
);=0A=0A-=A0=A0=A0 seq_printf(s, "\n");=0A+=A0=A0=A0 seq_puts(s, "\n");=0A=
=A0=A0=A0 seq_printf(s, "total pages: %u\n", pages);=0A=A0=A0=A0 seq_printf=
(s, "pages mapped: %u\n", mapped);=0A=0A--=0A1.9.1
