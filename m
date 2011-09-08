Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R1ebu-0005Kp-OV
	for linux-mtd@lists.infradead.org; Thu, 08 Sep 2011 13:25:43 +0000
Received: by yxi11 with SMTP id 11so644326yxi.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 08 Sep 2011 06:25:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110907191741.GO32018@logfs.org>
References: <CAMjNe_fdRw=5-MjOii8aGfEvejPo-dR6Rpf1=JQf_gMJ3U9jfQ@mail.gmail.com>
	<20110907065621.GL32018@logfs.org>
	<CAMjNe_fd8S08SG45kOASDkUFPMuT0WoOHZ1cGnTqk5pKj7DxgA@mail.gmail.com>
	<20110907191741.GO32018@logfs.org>
Date: Thu, 8 Sep 2011 18:55:40 +0530
Message-ID: <CAMjNe_fpTTTrvrVnVQgw2VZsnt-Mv26i6Cu_0iysQS-vwsb3WA@mail.gmail.com>
Subject: Re: logfs: max 4K writepage size
From: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>,
	linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 8, 2011 at 12:47 AM, J=F6rn Engel <joern@logfs.org> wrote:

> You can use mtd0 instead of /dev/mtd0, similar to jffs2.

With logfs, I am a bit confused about when ultimately the data is
written to the flash and in what units it is written as.
The mtd_write() function in dev_mtd.c does writes in units of 4096 bytes.
With Nand flash writepagesize >4K, using "mklogfs mtd0 & mount mtd0" ,
won't logfs  pass non-flashpage aligned writes to the nand flash
driver?.

thanks,
mugunthan
