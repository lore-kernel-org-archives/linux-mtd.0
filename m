Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fhYlX-0005nq-Na
 for linux-mtd@lists.infradead.org; Mon, 23 Jul 2018 11:12:37 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Richard Weinberger <richard@nod.at>, "richard.weinberger@gmail.com"
 <richard.weinberger@gmail.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: UBIFS file has zeroes at the end after an unclean reboot
Date: Mon, 23 Jul 2018 11:12:09 +0000
Message-ID: <8f54ca9aee0947d49e7e99dd11f33a74@SIWEX5A.sing.micron.com>
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

Hi, Richard
Do you have good suggestions about how to prevent this condiciton: http://w=
ww.linux-mtd.infradead.org/faq/ubifs.html#L_end_hole ?
Do you know How about usig direct I/O? and set the flush cache with higher =
frequecy?

I don't know If it is possible for currently UBIFS  to firstly program data=
 inode and then program its metadata assocated. If yes, it is necessary/fea=
sible to acchive it?
Thanks.

//beanhuo
