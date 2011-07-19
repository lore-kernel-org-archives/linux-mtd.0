Date: Tue, 19 Jul 2011 14:54:11 -0400
From: Don Zickus <dzickus@redhat.com>
To: Seiji Aguchi <seiji.aguchi@hds.com>
Subject: Re: [RFC][PATCH -mmotm 1/4] Add static function calls of pstore to
	kexec path
Message-ID: <20110719185411.GA3400@redhat.com>
References: <5C4C569E8A4B9B42A84A977CF070A35B2C199C64C3@USINDEVS01.corp.hds.com>
	<20110719183506.GA23770@srcf.ucam.org>
	<5C4C569E8A4B9B42A84A977CF070A35B2C199C64D6@USINDEVS01.corp.hds.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5C4C569E8A4B9B42A84A977CF070A35B2C199C64D6@USINDEVS01.corp.hds.com>
Cc: Satoru Moriya <satoru.moriya@hds.com>,
	"dle-develop@lists.sourceforge.net" <dle-develop@lists.sourceforge.net>,
	"tony.luck@intel.com" <tony.luck@intel.com>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"kexec@lists.infradead.org" <kexec@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>,
	Jarod Wilson <jwilson@redhat.com>, Americo Wang <xiyou.wangcong@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>, Vivek Goyal <vgoyal@redhat.com>,
	Matthew Garrett <mjg@redhat.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 19, 2011 at 02:48:22PM -0400, Seiji Aguchi wrote:
> >How is this safe? What happens if there's a pstore access in process
> >when you hit this codepath?
> 
> This will never happen because pstore_kmsg_dump_in_interrupt() is called after machine_crash_shutdown().
> 
> Panicked cpu sends NMI to all other cpus in machine_crash_shutdown() and they stop.
> 
> 
> @@ -1081,6 +1083,7 @@ void crash_kexec(struct pt_regs *regs)
>  			crash_setup_regs(&fixed_regs, regs);
>  			crash_save_vmcoreinfo();
>  			machine_crash_shutdown(&fixed_regs);
> +			pstore_kmsg_dump_in_interrupt(KMSG_DUMP_KEXEC);
> 
> Seiji

Another interesting question is do we need to log anything in the kdump
path?  Isn't kdump generating the same info?  What added value do we get
over kdump?

Cheers,
Don
