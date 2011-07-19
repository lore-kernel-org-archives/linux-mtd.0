Date: Tue, 19 Jul 2011 14:47:59 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Seiji Aguchi <seiji.aguchi@hds.com>
Subject: Re: [RFC][PATCH -mmotm 0/4] Improvement of pstore/kmsg_dump in
	kexec/panic path
Message-ID: <20110719184759.GC7001@redhat.com>
References: <5C4C569E8A4B9B42A84A977CF070A35B2C199C64C2@USINDEVS01.corp.hds.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5C4C569E8A4B9B42A84A977CF070A35B2C199C64C2@USINDEVS01.corp.hds.com>
Cc: "dzickus@redhat.com" <dzickus@redhat.com>,
	Satoru Moriya <satoru.moriya@hds.com>,
	"dle-develop@lists.sourceforge.net" <dle-develop@lists.sourceforge.net>,
	"tony.luck@intel.com" <tony.luck@intel.com>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"kexec@lists.infradead.org" <kexec@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>,
	Jarod Wilson <jwilson@redhat.com>, Americo Wang <xiyou.wangcong@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>, Matthew Garrett <mjg@redhat.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 19, 2011 at 02:23:26PM -0400, Seiji Aguchi wrote:
> Hi,
> 
> [Upstream status]
>    Discussion about kmsg_dump() in kdump path: 
>     - Eric and Vivek are worried about reliability of existing kmsg_dump().
>     - Especially, Vivek would like to remove a RCU  function call chain in kdump path
> 　　　 which kernel modules can register their function calls freely. 
> 
>    Discussion about pstore in nmi_hander.
>     - Don Zickus found an issue of pstore in nmi_handler due to its mutex_lock.

You did not answer my questions in the last posting mail thread and gone
ahead with the new posting. How are we supposed to discuss something. This
has been a problem on this mail thread since the beginneing. There is
little open discussion. 

So if you want to make any progress in this direction, what will help
is open discussion.

Locking is going to be a problem. So atleast we can remove kmsg_dump()
infrastructure from reboot path. Why can't we log something in user
space when user initiates a reboot, let it get logged in /var/log/messages
and then umount the file root and go ahead with reboot. Why does kernel
need to capture that info in NVRAM.

If we can get rid of all the logging thing on reboot path, then at least
it does not need to be lock protected with crash path.

Thanks
Vivek
