From: Seiji Aguchi <seiji.aguchi@hds.com>
To: "kexec@lists.infradead.org" <kexec@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Eric W.
	Biederman" <ebiederm@xmission.com>, Vivek Goyal <vgoyal@redhat.com>, KOSAKI
	Motohiro <kosaki.motohiro@jp.fujitsu.com>, Americo Wang
	<xiyou.wangcong@gmail.com>, Matthew Garrett <mjg@redhat.com>,
	"tony.luck@intel.com" <tony.luck@intel.com>, Andrew Morton
	<akpm@linux-foundation.org>,
	Jarod Wilson <jwilson@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>,
	"dzickus@redhat.com" <dzickus@redhat.com>
Date: Tue, 19 Jul 2011 14:25:38 -0400
Subject: [RFC][PATCH -mmotm 2/4] Remove mutex_lock from pstore in panic path
Message-ID: <5C4C569E8A4B9B42A84A977CF070A35B2C199C64C6@USINDEVS01.corp.hds.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "dle-develop@lists.sourceforge.net" <dle-develop@lists.sourceforge.net>,
	Satoru Moriya <satoru.moriya@hds.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
=20
This patch removes a function call chain of kmsg_dump and mutex_lock of pst=
ore from panic path=20
 so that both pstore and APEI storage backend can work reliably in panic pa=
th.

 kernel/kexec.c
   - Move kmsg_dump(KMSG_DUMP_PANIC) behind machine_crash_shutdown() so tha=
t pstore can
     work with one cpu.

 fs/pstore/platform.c
   pstore_dump()
   - Remove mutex_lock from panic path

 kernel/printk.c
   - Add spin_lock_init(&logbuf) for avoiding dead lock in panic path

TODO:
  APEI storage backend will work with this patch.
  However, I don't have any access to servers capable of APEI storage backe=
nd.
  Please help to test my patch.

 Signed-off-by: Seiji Aguchi <seiji.aguchi@hds.com>

---
 fs/pstore/platform.c |    3 ++-
 kernel/panic.c       |    4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c index 85e0a9c..061=
911c 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -75,6 +75,7 @@ static void pstore_dump(struct kmsg_dumper *dumper,
 		why =3D "Unknown";
=20
 	switch (reason) {
+	case KMSG_DUMP_PANIC:
 	case KMSG_DUMP_KEXEC:
 		/* Skip if there is no driver or there is a driver calling
 		   pstore_register() */
@@ -114,7 +115,7 @@ static void pstore_dump(struct kmsg_dumper *dumper,
 		total +=3D l1_cpy + l2_cpy;
 	}
=20
-	if (reason !=3D KMSG_DUMP_KEXEC)
+	if (reason !=3D KMSG_DUMP_PANIC && reason !=3D KMSG_DUMP_KEXEC)
 		mutex_unlock(&psinfo->buf_mutex);
 }
=20
diff --git a/kernel/panic.c b/kernel/panic.c index 6923167..a9dce52 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -11,6 +11,7 @@
 #include <linux/debug_locks.h>
 #include <linux/interrupt.h>
 #include <linux/kmsg_dump.h>
+#include <linux/pstore.h>
 #include <linux/kallsyms.h>
 #include <linux/notifier.h>
 #include <linux/module.h>
@@ -88,14 +89,13 @@ NORET_TYPE void panic(const char * fmt, ...)
 	 */
 	crash_kexec(NULL);
=20
-	kmsg_dump(KMSG_DUMP_PANIC);
-
 	/*
 	 * Note smp_send_stop is the usual smp shutdown function, which
 	 * unfortunately means it may not be hardened to work in a panic
 	 * situation.
 	 */
 	smp_send_stop();
+	pstore_kmsg_dump_in_interrupt(KMSG_DUMP_PANIC);
=20
 	atomic_notifier_call_chain(&panic_notifier_list, 0, buf);
=20
--
1.7.1
