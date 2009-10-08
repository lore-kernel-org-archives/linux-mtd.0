Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mvoj8-0007hD-4Z
	for linux-mtd@lists.infradead.org; Thu, 08 Oct 2009 08:52:02 +0000
Message-ID: <4ACDA825.2020206@nokia.com>
Date: Thu, 08 Oct 2009 11:51:49 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Tobias_Wahlstr=F6m?= <tobias.tanke@gmail.com>
Subject: Re: mkfs.ubifs / ubiformat: Bad UBI magic
References: <29001ab20910060400j76167eg138df17d57727231@mail.gmail.com>
In-Reply-To: <29001ab20910060400j76167eg138df17d57727231@mail.gmail.com>
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "Bityutskiy Artem \(Nokia-M/Helsinki\)" <Artem.Bityutskiy@nokia.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tobias Wahlström wrote:
> Hi!
> 
> This is my first post at this list - I hope it makes (at least) some
> sense anyway. I have looked through the mailing archive and searched
> using google without finding anything useful on the topic. I hope I
> provided the information you need - if not, just tell me what you are
> missing!
> 
> I'm working on a project where we would like to use ubi and ubifs as
> root filesystem since it seems to be the best choise in many ways. But
> I have a problem which I can't find anything about either the mail
> archive nor using google etc. I currently use linux 2.6.26 with some
> patches. My target is the freescale imx255 pdk board. My build system
> is Ubuntu 9.04 (run within vmware).
> 
> I have cloned the mtd-utils.git (today 2009-09-05) and compiled the
> tools both for my build system and my target (both without xattr
> support). Then I created a ubifs image using mkfs.ubifs on my build
> system and tried to flash it to the nand using ubiformat. The commands
> I used was:
> 
> build> mkfs.ubifs -m 2048 -e 256KiB -c 384 -U --root rootfs -o rootfs.ubifs

Try making the -e option the leb-size not the peb-size i.e. probably 252KiB

> target> flash_eraseall /dev/mtd2
> target> ubiformat /dev/mtd2 -s 2048 -v -f rootfs.ubifs
> 
> The output from ubiformat is:
> 
> ubiformat: mtd2 (nand), size 100663296 bytes (96.0 MiB), 384
> eraseblocks of 262144 bytes (256.0 KiB), min. I/O size 2048 bytes
> libscan: start scanning eraseblocks 0-384
> libscan: scanning eraseblock 0: empty
> [...]
> libscan: scanning eraseblock 383: empty
> libscan: finished, mean EC 0, 0 OK, 0 corrupted, 384 empty, 0 alien, bad 0
> ubiformat: 384 eraseblocks are supposedly empty
> ubiformat: will write 13 eraseblocks
> ubiformat: eraseblock 0: erase, change EC to 0ubiformat: error!: bad
> UBI magic 0x31181006, should be 0x55424923
> ubiformat: error!: bad EC header at eraseblock 0 of "/rootfs.ubifs"
> 
> If I look into the source code I see that UBI_EC_HDR_MAGIC is defined
> twice in the source both in include/mtd/ubi-media.h and seems to be
> used by all tools except for mkfs.ubifs. The command mkfs.ubifs use
> UBIFS_NODE_MAGIC in mkfs.ubifs/ubifs-media.h. The values do not match
> at all. And it also seems like mkfs.ubifs use little endian to encode
> the magic number and the other tools use big endian... Strange!
> 
> /Tobias
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
