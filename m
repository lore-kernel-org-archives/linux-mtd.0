Subject: Re: [PATCH 00/34] Make kernel build deterministic
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Michal Marek <mmarek@suse.cz>
In-Reply-To: <4D9C2D56.70700@suse.cz>
References: <1302015561-21047-1-git-send-email-mmarek@suse.cz>
	<20110405154918.GA31337@suse.de> <1302031447.2608.41.camel@koala>
	<4D9C2D56.70700@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 06 Apr 2011 12:25:28 +0300
Message-ID: <1302081928.2742.40.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: anil_ravindranath@pmc-sierra.com, mchehab@redhat.com,
	benh@kernel.crashing.org, mac@melware.de, aacraid@adaptec.com,
	linux-mtd@lists.infradead.org, allan.stephens@windriver.com,
	hpa@zytor.com, t.sailer@alumni.ethz.ch, gwingerde@gmail.com,
	x86@kernel.org, elf@buici.com, cluster-devel@redhat.com,
	ccaulfie@redhat.com, mingo@redhat.com, dougthompson@xmission.com,
	tipc-discussion@lists.sourceforge.net, dwmw2@infradead.org,
	linux-media@vger.kernel.org, arnaud.giersch@free.fr,
	linux-kbuild@vger.kernel.org, IvDoorn@gmail.com,
	teigland@redhat.com, tony.olech@elandigitalsystems.com,
	apw@canonical.com, linux-hams@vger.kernel.org,
	tglx@linutronix.de, swhiteho@redhat.com,
	linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
	jon.maloy@ericsson.com, linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org, Greg KH <gregkh@suse.de>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	davem@davemloft.net, linux-usb@vger.kernel.org,
	James.Bottomley@suse.de, chuanxiao.dong@intel.com,
	paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
	bluesmoke-devel@lists.sourceforge.net
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-04-06 at 11:07 +0200, Michal Marek wrote:
> > So additionally, I'd suggest:
> > 1. Instrument checkpatch.pl and make it err or warn on timestamps.
> 
> This is patch 34/34 in this series: https://lkml.org/lkml/2011/4/5/198

Yeah, great, did not notice, thanks!

> > 2. Probably instrument linux-next to rise a warning when people break
> >    this.
> 
> I'm not sure if Stephen has that much spare time, and I don't think it
> is necessary. I think the checkpatch check is sufficient and I'll check
> myself occasionally.

Yes, that's fine, I just wanted to speak this out - there is a
probability that someone gets excited and creates some instrumentation
to kbuild to automatically detect bad things and then Stephen could
easily use that.

WRT "not necessary" - well, I think it is always better to cut bad
things before they are merged, rather than afterwards.

But anyway, let's forget about this.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
