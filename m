Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FYMXH-0000qp-AN
	for linux-mtd@lists.infradead.org; Tue, 25 Apr 2006 08:21:04 -0400
Message-ID: <444E1435.4030208@ru.mvista.com>
Date: Tue, 25 Apr 2006 16:21:09 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Anil Gupta <anilgupta9@hotmail.com>
References: <BAY19-F25626592BB956CC2B586828BBF0@phx.gbl>
In-Reply-To: <BAY19-F25626592BB956CC2B586828BBF0@phx.gbl>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: squashfs and NAND flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Anil Gupta wrote:
> Hi,
> We have an embedded system with a squashfs rootfs in NAND flash. The
> rootfs is mounted using the RO mtdblock device. The rootfs is
> occasionally upgraded, writing the entire squashfs
> image into flash using nandwrite.
>
> We found that if the NAND flash has a bad sector, the bad sector is
> correctly skipped when the image is written but fs access errors occur
> when the fs is mounted. Some debugging shows that the filesystem is
> off by 1 when reading flash sectors beyond the bad sector.
>
> We are using squashfs-2.1, kernel 2.4.31, mtd snapshot 20051003.
>
> Should mtd handle bad blocks when using squashfs?
Please see 
http://lists.infradead.org/pipermail/linux-mtd/2004-May/009695.html.
It's outdated, but I don't think it's hard to make it up-to-date.
if it's of interest to many people, I can even do that :)

Vitaly
