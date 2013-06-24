Received: from mail-ve0-x232.google.com ([2607:f8b0:400c:c01::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UrF0V-0006TS-Gf
 for linux-mtd@lists.infradead.org; Mon, 24 Jun 2013 22:13:08 +0000
Received: by mail-ve0-f178.google.com with SMTP id pb11so9320383veb.37
 for <linux-mtd@lists.infradead.org>; Mon, 24 Jun 2013 15:12:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1531E53627F1F749B4FE809BF2A4EB67043D97FA@wetmex10>
References: <1531E53627F1F749B4FE809BF2A4EB67043D97FA@wetmex10>
Date: Mon, 24 Jun 2013 15:12:44 -0700
Message-ID: <CAN8TOE8m6VVDuNZwXqa7Rn9pBXoTXci_iyWN4nX-+S3cj422ew@mail.gmail.com>
Subject: Re: CFC - RW - power-donw ?
From: Brian Norris <computersforpeace@gmail.com>
To: "Vellemans, Noel" <Noel.Vellemans@visionbms.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Noel,

On Wed, Jun 19, 2013 at 11:55 PM, Vellemans, Noel
<Noel.Vellemans@visionbms.com> wrote:
> Hi all,
>
> I've a question regarding a PC that needs to boot from CFC (Compact
> Flash card), hope this is the correct place to ask.
>
> I would need a PC to boot from a CFC-card that has R/W enabled.
>
> At this time I have been testing it with EXT2/EXT3 but when POWERING
> down abruptly it seems that the CFC-ext2/ext3 file system gets
> corrupted, finally resulting in a NON bootable system.

That is somewhat expected. The FTLs for cards like Compact Flash are
not documented and are likely unsafe w.r.t. power cuts.

> At this time I have partitioned the CFC into 2 partitions 1-FAT16 (to
> store the kernel) and 1-ext2/ext3 partition that has the root-file
> system.
>
> What would be the correct file-system (and/or mount /build options) to
> put on a CFC ... so that it is able to survive abrupt-power downs ?
>
> Or is the somewhere a guide (URL) that explains me some more stuff
> regarding this.

The Linux MTD website has some information that is somewhat related,
regarding FTL (Flash Translation Layers) and MTDs. Note that CF cards
are not MTDs but are block devices with a simple built-in hardware
FTL. With that in mind, you might read:

http://www.linux-mtd.infradead.org/faq/general.html#L_mtd_what
http://www.linux-mtd.infradead.org/faq/general.html#L_mtd_vs_hdd
http://www.linux-mtd.infradead.org/faq/jffs2.html#L_hdd_jffs2
http://www.linux-mtd.infradead.org/faq/general.html#L_ext2_mtd

I don't have much personal experience with Compact Flash, but my bet
is that you are running into the perils of relying on cheap
proprietary hardware FTL.

And Google will tell you:

https://groups.google.com/forum/#!topic/comp.os.linux.embedded/0DYdL-PUZVY

The advice there seems reasonable and in line with my knowledge: that
CF cards are inherently prone to power-cut data loss.

Brian
