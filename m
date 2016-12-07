Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEbW7-0005ak-Cc
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2016 12:40:12 +0000
Date: Wed, 7 Dec 2016 13:39:38 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Martin Townsend <mtownsend1973@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Retrieving number of free unused eraseblocks in a UBI filesystem
Message-ID: <20161207133938.39f2dd87@bbrezillon>
In-Reply-To: <CABatt_wrGTdp9Waw=1ysEUsDFtgT1zoq8YgFZSmkvpzUgov3Rw@mail.gmail.com>
References: <CABatt_wrGTdp9Waw=1ysEUsDFtgT1zoq8YgFZSmkvpzUgov3Rw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 7 Dec 2016 11:59:13 +0000
Martin Townsend <mtownsend1973@gmail.com> wrote:

> Hi,
> 
> I'm running a 4.1 Kernel and have a UBI Filesystem with 2 volumes
> taking up all the NAND.
> ubinfo -d 0
> ubi0
> Volumes count:                           2
> Logical eraseblock size:                 126976 bytes, 124.0 KiB
> Total amount of logical eraseblocks:     4016 (509935616 bytes, 486.3 MiB)
> Amount of available logical eraseblocks: 0 (0 bytes)
> Maximum count of volumes                 128
> Count of bad physical eraseblocks:       56
> Count of reserved physical eraseblocks:  24
> Current maximum erase counter value:     15
> Minimum input/output unit size:          2048 bytes
> Character device major/minor:            249:0
> Present volumes:                         0, 1
> 
> So I'm guessing that the Total amount of logical erase blocks is 0 as
> this is because I have 2 volumes of a fixed size that take up all the
> available eraseblocks of the /dev/ubi0 device.
> 
> Is there a way of getting, per volume preferably, the number of
> eraseblocks that aren't being used? Or conversely get the number of
> eraseblocks that are used as I can work it out from the total amount
> of logical eraseblocks.

cat /sys/class/ubi/ubiX_Y/reserved_ebs

where X is the UBI device id and Y is the volume id.

> 
> Many Thanks,
> Martin.
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
