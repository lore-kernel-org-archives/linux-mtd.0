Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1feyXs-00022n-Tg
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2018 08:07:51 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Bean Huo
 (beanhuo)" <beanhuo@micron.com>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 0/2] mtd: rawnand: micron: Fix on-die ECC
Date: Mon, 16 Jul 2018 08:07:02 +0000
Message-ID: <7cd10203b24b4d3aae6070e356604728@svr-chch-ex1.atlnz.lc>
References: <20180709210937.30150-1-boris.brezillon@bootlin.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/07/18 09:09, Boris Brezillon wrote:=0A=
> Chris, Bean,=0A=
> =0A=
> Here are 2 patches for you to review/test. The first one is fixing=0A=
> the layout definition, and unless I missed something it should be=0A=
> correct.=0A=
> =0A=
> The second one is just my understanding of how byte 5 of READ_ID works=0A=
> based on our experience with the 4bit/512 on-die ECC chip we have=0A=
> worked on and the other datasheet I had a look at.=0A=
> I'm not 100% sure this will work for all chips, but might work for the=0A=
> 2 chips we support right now.=0A=
> So please test and/or review it and let me know if this approach works.=
=0A=
> =0A=
=0A=
Hi Boris,=0A=
=0A=
I went to test this today and found that I could no-longer mount the =0A=
Micron MT29F1G08ABAFAWP-ITE chip. However it doesn't appear to these =0A=
changes but d73e5d29 ("mtd: rawnand: micron: Disable ECC earlier in the =0A=
read path").=0A=
=0A=
   [root@linuxbox ~]# ubiformat -q -y /dev/mtd0=0A=
   [root@linuxbox ~]# ubiattach -p /dev/mtd0=0A=
   ubi0: attaching mtd0=0A=
   ubi0: scanning is finished=0A=
   ubi0 error: ubi_read_volume_table: the layout volume was not found=0A=
   ubi0 error: ubi_attach_mtd_dev: failed to attach mtd0, error -22=0A=
   ubiattach: error!: cannot attach "/dev/mtd0"=0A=
              error 22 (Invalid argument)=0A=
   [root@linuxbox ~]# ubimkvol /dev/ubi0 -N user -m=0A=
   libubi: error!: cannot get information about "/dev/ubi0"=0A=
           error 2 (No such file or directory)=0A=
   ubimkvol: error!: error while probing "/dev/ubi0"=0A=
             error 2 (No such file or directory)=0A=
=0A=
I'll try juggling some of the nand/next patches around to see if I can =0A=
test these two without d73e5d29.=0A=
