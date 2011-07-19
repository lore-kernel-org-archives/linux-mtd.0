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
Date: Tue, 19 Jul 2011 14:23:26 -0400
Subject: [RFC][PATCH -mmotm 0/4] Improvement of pstore/kmsg_dump in
	kexec/panic path
Message-ID: <5C4C569E8A4B9B42A84A977CF070A35B2C199C64C2@USINDEVS01.corp.hds.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
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

[Upstream status]
   Discussion about kmsg_dump() in kdump path:=20
    - Eric and Vivek are worried about reliability of existing kmsg_dump().
    - Especially, Vivek would like to remove a RCU  function call chain in =
kdump path
=1B$B!!!!!!=1B(B which kernel modules can register their function calls fre=
ely.=20

   Discussion about pstore in nmi_hander.
    - Don Zickus found an issue of pstore in nmi_handler due to its mutex_l=
ock.
   =20

[Build Status]
  Built this patch on 3.0.0-rc6-mm1 in x86_64.

[Patch Description]

 For meeting Eric/Vivek's requirements and solving an issue of pstore in nm=
i_hander due to mutex_lock,
 I propose following patches.

  [RFC][PATCH -mmotm 1/4] Add static function calls of pstore to kexec path

        Some people who are not familiar with kexec may add function calls =
getting=20
        spin_lock/mutex_lock in kexec path. These function calls causes fai=
lure of kexec.=20
        So, I suggest replace a call chain with static function calls so th=
at we can keep=20
        reliability of kexec.

        APEI storage backend will work well in kexec path by applying this =
patch.

        Summary of this patch:
        - Call pstore_kmsg_dump_in_interrupt() directly in kexec path
        - Remove mutex_lock in pstore_dump() of kexec path

  [RFC][PATCH -mmotm 2/4] Remove mutex_lock from pstore in panic path

        Pstore must not take mutex_lock in panic path as well as kexec path=
=20
        because panic() is called in interrupt context like nmi_handler.
        APEI storage backend will work well in panic path with this patch.

        Summary of this patch:
        - Remove kmsg_dump(KMSG_DUMP_PANIC)
        - Call pstore_kmsg_dump_in_interrupt() directly in panic path
        - Remove mutex_lock in pstore_dump() of panic path

  [RFC][PATCH -mmotm 3/4] pstore: mtdoops support

        - Pstore can support mtdoops with this patch.

  [RFC][PATCH -mmotm 4/4] pstore: ramoops support

        - Pstore can support ramoops with this patch.
