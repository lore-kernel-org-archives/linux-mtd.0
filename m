Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YV1Qh-0006KV-4J
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2015 17:25:24 +0000
Received: by wibbs8 with SMTP id bs8so23119321wib.0
 for <linux-mtd@lists.infradead.org>; Mon, 09 Mar 2015 10:25:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150309165242.GK3739@saruman.tx.rr.com>
References: <1425560442-13367-1-git-send-email-valentinrothberg@gmail.com>
 <1425565425-12604-1-git-send-email-valentinrothberg@gmail.com>
 <20150309165242.GK3739@saruman.tx.rr.com>
From: Valentin Rothberg <valentinrothberg@gmail.com>
Date: Mon, 9 Mar 2015 18:24:29 +0100
Message-ID: <CAD3Xx4JCL7Gt9SEoumiKSvmQOL-JQmg0Qth5wRE7COFZ-Oap8g@mail.gmail.com>
Subject: Re: [PATCH v2] Remove deprecated IRQF_DISABLED flag entirely
To: balbi@ti.com
Content-Type: text/plain; charset=UTF-8
Cc: Nishanth Menon <nm@ti.com>, linux-mips@linux-mips.org,
 Jiri Kosina <jkosina@suse.cz>, Tony Lindgren <tony@atomide.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Huacai Chen <chenhc@lemote.com>, Christoph Hellwig <hch@lst.de>,
 iss_storagedev@hp.com, Jonathan Corbet <corbet@lwn.net>,
 Quentin Lambert <lambert.quentin@gmail.com>, Ewan Milne <emilne@redhat.com>,
 Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, Afzal Mohammed <afzal@ti.com>,
 Arnd Bergmann <arnd@arndb.de>, Eyal Perry <eyalpe@mellanox.com>,
 Hannes Reinecke <hare@suse.de>, Thomas Gleixner <tglx@linutronix.de>,
 Paul Bolle <pebolle@tiscali.nl>, Keerthy <j-keerthy@ti.com>,
 linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 Zhou Wang <wangzhou1@hisilicon.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hongliang Tao <taohl@lemote.com>, akpm@linux-foundation.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 9, 2015 at 5:52 PM, Felipe Balbi <balbi@ti.com> wrote:
> Hi,
>
> On Thu, Mar 05, 2015 at 03:23:08PM +0100, Valentin Rothberg wrote:
>> The IRQF_DISABLED is a NOOP and has been scheduled for removal since
>> Linux v2.6.36 by commit 6932bf37bed4 ("genirq: Remove IRQF_DISABLED from
>> core code").
>>
>> According to commit e58aa3d2d0cc ("genirq: Run irq handlers with
>> interrupts disabled") running IRQ handlers with interrupts enabled can
>> cause stack overflows when the interrupt line of the issuing device is
>> still active.
>>
>> This patch ends the grace period for IRQF_DISABLED (i.e., SA_INTERRUPT
>> in older versions of Linux) and removes the definition and all remaining
>> usages of this flag.
>>
>> Signed-off-by: Valentin Rothberg <valentinrothberg@gmail.com>
>> ---
>> The bigger hunk in Documentation/scsi/ncr53c8xx.txt is removed entirely
>> as IRQF_DISABLED is gone now; the usage in older kernel versions
>> (including the old SA_INTERRUPT flag) should be discouraged.  The
>> trouble of using IRQF_SHARED is a general problem and not specific to
>> any driver.
>>
>> I left the reference in Documentation/PCI/MSI-HOWTO.txt untouched since
>> it has already been removed in linux-next by commit b0e1ee8e1405
>> ("MSI-HOWTO.txt: remove reference on IRQF_DISABLED").
>>
>> All remaining references are changelogs that I suggest to keep.
>>
>> Changelog
>>
>> v2: Correct previous change to drivers/mtd/nand/hisi504_nand.c that
>> broke compilation.  Reported by Dan Carpenter.
>> ---
>>  drivers/usb/isp1760/isp1760-core.c   |  3 +--
>>  drivers/usb/isp1760/isp1760-udc.c    |  4 ++--
>
> I have a commit in my tree for isp1760:
>
> https://git.kernel.org/cgit/linux/kernel/git/balbi/usb.git/commit/?h=testing/fixes&id=80b4a0f8feeb6ee7fa4430a2b4ae1155ed923bd2

I am sorry, but I did not receive an email that it has been applied.
Andrew asked me to do this patch, so I replied to the one you
mentioned to avoid this conflict:

http://comments.gmane.org/gmane.linux.kernel/1896211

Kind regards,
 Valentin
