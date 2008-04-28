Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JqOLK-0005oO-2d
	for linux-mtd@lists.infradead.org; Mon, 28 Apr 2008 08:04:10 +0000
Message-ID: <481583CD.1060804@nokia.com>
Date: Mon, 28 Apr 2008 10:59:09 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: ext Nancy <nancydreaming@gmail.com>
Subject: Re: UBI: badblock management confusion!
References: <bae050c10804242354s722c9a58r1ed4e1ad1afaff90@mail.gmail.com>	
	<4811B6BF.9020200@nokia.com>	
	<bae050c10804250508g68df553qcce03bb6551aa5c5@mail.gmail.com>
	<bae050c10804250512g1393b6afu54809e90db2807a6@mail.gmail.com>
In-Reply-To: <bae050c10804250512g1393b6afu54809e90db2807a6@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Nancy wrote:
>  > > # modprobe ubi mtd=5
>  > > UBI: physical eraseblock size:   262144 bytes (256 KiB)
>  > > UBI: logical eraseblock size:    258048 bytes
>  > > UBI: smallest flash I/O unit:    2048
>  > > UBI: VID header offset:          2048 (aligned 2048)
>  > > UBI: data offset:                4096
>  > > UBI warning: ubi_eba_init_scan: cannot reserve enough PEBs for bad PEB
>  > > handling, reserved 19, need 20
>  > > UBI: attached mtd5 to ubi0
>  > > UBI: MTD device name:            "NAND VFAT partition"
>  > > UBI: MTD device size:            512 MiB
>  > > UBI: number of good PEBs:        2044
>  > > UBI: number of bad PEBs:         4
>  > > UBI: max. allowed volumes:       128
>  > > UBI: wear-leveling threshold:    256
>  > > UBI: number of internal volumes: 1
>  > > UBI: number of user volumes:     1
>  > > UBI: available PEBs:             0
>  > > UBI: total number of reserved PEBs: 2044
>  > > UBI: number of PEBs reserved for bad PEB handling: 19
>  > > UBI: max/mean erase counter: 39/24
>  > > UBI: background thread "ubi_bgt0d" started, PID 263
> 
> pls:
>  > > UBI: available PEBs:             0
>  > > UBI: total number of reserved PEBs: 2044
> Quite wrong displaying messages.
> 
> 

There are no available PEBs so no more volumes can be created.

The number of reserved PEBs includes all existing volumes.
