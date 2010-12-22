Received: from mail.grid-net.com ([97.65.115.2])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PVRgf-0006Dx-TR
	for linux-mtd@lists.infradead.org; Wed, 22 Dec 2010 16:37:14 +0000
Message-ID: <4D12293F.3090008@grid-net.com>
Date: Wed, 22 Dec 2010 08:37:19 -0800
From: Steve Iribarne <siribarne@grid-net.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: UBIFS reboots issue
References: <39A4B204C321D34DA3490E3B119D5A6C68BF77673F@SBS2008.wellsense.local>
In-Reply-To: <39A4B204C321D34DA3490E3B119D5A6C68BF77673F@SBS2008.wellsense.local>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/22/2010 06:36 AM, Boaz Ben-David wrote:
> Hi all,
>
> We have an embedded system using a Samsung 2GB MLC NAND and are using
> UBIFS as the file system on it.
> I have a question regarding UBIFS and hard reboots.
> After some work with the flash (doing reads and writes to it), some
> times one of our partitions would fail to mount.
> I suspected this has something to do with a reboot which happens during
> a write to the flash.
> In order to test this I created a simple script which copies a file from
> to the partition, syncs, then deletes it and does this repeatedly until
> a hard reboot occurs (using the watch dog to cause the boot).
> This process repeats itself until the partition fails to mount.
> When I performed the test mentioned above, after about 3-4 times the
> partition would fail.
> I am not sure if this behaviour is normal or not.
> Did someone encounter similiar behaviour?

What is the error when it tries to remount?
