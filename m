Received: from a82-92-55-37.adsl.xs4all.nl ([82.92.55.37] helo=dicker.nl)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BlwvO-00027T-7g
	for linux-mtd@lists.infradead.org; Sat, 17 Jul 2004 17:40:55 -0400
Received: from wxpedwin (wxpedwin [10.1.1.2])
	by dicker.nl (8.12.11/8.12.11) with SMTP id i6HLeptE021376
	for <linux-mtd@lists.infradead.org>; Sat, 17 Jul 2004 23:40:51 +0200
Message-ID: <003801c46c46$b80d5ad0$0201010a@wxpedwin>
From: "Edwin Dicker" <edwin@dicker.nl>
To: "mtdlinux" <linux-mtd@lists.infradead.org>
Date: Sat, 17 Jul 2004 23:40:46 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: DOC2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

Could someone help a DOC newbie?
I have made me an ISA card to mount a DOC on it. The card works well with a
MD2800-D8
I've been able to dformat the DOC with dfromat /win:c800
/s:doc514.exb....the doc formats fine and i can access it as drive D:

Now I have another DOC md2200-D16 which I wish to use in the same board (
they are pincompatible as I've read ) But this one is bothering me. I
formatted the device ( dformat /win:c800 /s:doc514.exb ) since it was not
formatted according to Dinfo.
After the format I had to reboot but the system BIOS did not recognize the
DOC. When querying with Dinfo it still said Unformatted ???
Now I have done a dformat /win:c800 /s:doc514.exb /noformat and the firmware
got written to the DOC but after a reboot still no recognizing the DOC by
the BIOS.
Doing a dformat /win:c800 came up with :

can't mount FAT volume
Status code is 27 (flSectorNotFDound) received from flMountVolume
format failed


What can be wrong with this DOC .......or is it me ?

Thanks in advance
Edwin
