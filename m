Received: from smtp4.nedap.com ([213.160.213.85] helo=smtp.nedap.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dxXE3-00067p-6l
 for linux-mtd@lists.infradead.org; Thu, 28 Sep 2017 11:43:33 +0000
From: Ryan Meulenkamp <Ryan.Meulenkamp@nedap.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Shrink UBIFS
Date: Thu, 28 Sep 2017 11:43:03 +0000
Message-ID: <1506598982834.31024@nedap.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
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

Hi,


I'm planning to write an ioctl for shrinking a UBIFS to be able to resize t=
he volume its on and create another

volume because it is essential for our upgrade/migration flow. Do you guys =
have any advice for me? The

hard part is that LEB's that would fall outside the new size should be move=
d inside the new size. From what

I read, the garbage collection code could be used to  accomplish this, but =
it is not really possible to define

which LEB's to put where.


Thanks in advance!


Ryan
