Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPU9C-0000Sv-O9
 for linux-mtd@lists.infradead.org; Tue, 19 Jul 2016 12:29:15 +0000
Subject: Re: [PATCH for-4.8] ubifs: silence early error messages if MS_SILENT
 is set
To: Daniel Golle <daniel@makrotopia.org>
References: <20160718222649.GA17394@makrotopia.org> <578DBCD4.6070305@nod.at>
 <20160719122000.GA1716@makrotopia.org>
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <578E1D02.3000109@nod.at>
Date: Tue, 19 Jul 2016 14:28:50 +0200
MIME-Version: 1.0
In-Reply-To: <20160719122000.GA1716@makrotopia.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Daniel,

Am 19.07.2016 um 14:20 schrieb Daniel Golle:
> Hi Richard,
> 
> thanks for reviewing my patch!
> 
> On Tue, Jul 19, 2016 at 07:38:28AM +0200, Richard Weinberger wrote:
>> Am 19.07.2016 um 00:26 schrieb Daniel Golle:
>>> Probe-mounting a volume too small for UBIFS results in kernel log
>>> polution which might irritate users.
>>> Address this by silencing errors which may happen during boot if the
>>> rootfs is e.g. squashfs (and thus rather small) stored on a UBI volume.
>>> This commit should be seen in context with
>>> commit 65fb47721925628bf85ec08c4302ac5e7224a66a
>>> and
>>> commit 90bea5a3f0bf680b87b90516f3c231997f4b8f3b
>>
>> The diff makes sense but not the commit message.
> 
> More brief? Less reasoning? Please elaborate, so I know what to
> improve.

It confused me a bit. :-)

>> Why would you mount a squashfs on top of UBI as UBIFS?
>> We have rootfstype= for this.
> 
> However, in OpenWrt/LEDE users may choose the fstype (UBIFS and
> squashfs) used for rootfs and the kernel should auto-probe just like
> it does for block or MTD devices (we support JFFS2 and squashfs
> on NOR and SPI flashes). In the case of squashfs being a read-only
> filesystem, an overlayfs is automatically created and used.
> Changing kernel command line parameters or anything which would
> require bootloader access is not an option for most of our users, due
> to the bootloaders being locked or because not everyone is into hooking
> up a serial console.
> Also, many stock bootloaders append stuff to the cmdline unwanted
> when using vanilla or OpenWrt's kernel. Thus, we often times ignore
> the bootloader's bootargs.
> The strategy of probe-mounting is working well as filesystems can
> easily be identified. The reason for this patch is that some users are
> getting confused about lines in in their bootlog indicating an error
> eventhough there wasn't anything bad happening.

Ah that kind of kludges again...

Anyway, patch looks good to me.

BTW: We should rename ubifs_errc(), commit 235c362bd (UBIFS: extend debug/message capabilities)
added the UBIFS context object to all logging functions.

Thanks,
//richard
