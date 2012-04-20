Received: from mail.grid-net.com ([97.65.115.2])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SLMng-00060C-Rn
 for linux-mtd@lists.infradead.org; Fri, 20 Apr 2012 22:59:37 +0000
Message-ID: <4F91EA56.50803@grid-net.com>
Date: Fri, 20 Apr 2012 15:59:34 -0700
From: Subodh Nijsure <snijsure@grid-net.com>
MIME-Version: 1.0
To: mtd <linux-mtd@lists.infradead.org>
Subject: Suggestion needed to set proper journal size
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I know general implications of changing journal size on UBIFS -- bigger 
the journal,
longer it may take to replay the journal, increasing time UBIFS takes to 
mount. Smaller
journal means more re-writes to flash.

We created 2 partitions 100MB and 45MB and we see that by default 
mkfs.ubifs is reserving 8MB for journal.

UBIFS: file system size:   101834752 bytes (99448 KiB, 97 MiB, 802 LEBs)
UBIFS: journal size:         9023488 bytes (8812 KiB, 8 MiB, 72 LEBs)

UBIFS: file system size:     47996928 bytes (46872 KiB, 45 MiB, 378 LEBs)
UBIFS: journal size:          9023488 bytes (8812 KiB, 8 MiB, 72 LEBs)

I know I can specify size of journal with -j option.

Should the journal size be scaled in some proportion of size of UBIFS 
partition?

Should the journal size depend on how often you expect file-system to be 
updated?

Has anyone done experiments with setting really small (1MB/2MB) journal 
size?
What side effects is one likely to encounter if the journal size is too 
small.

fwiw in my use case, file-system doesn't get updated that often, perhaps 
2K data in about 4 files once a week.

-Subodh
