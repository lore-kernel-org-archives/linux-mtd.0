Received: from rproxy.gmail.com ([64.233.170.201])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DXdE7-0007iR-2r
	for linux-mtd@lists.infradead.org; Mon, 16 May 2005 06:53:36 -0400
Received: by rproxy.gmail.com with SMTP id y7so616595rne
	for <linux-mtd@lists.infradead.org>;
	Mon, 16 May 2005 03:53:40 -0700 (PDT)
Message-ID: <f6d0cd0605051603533fa9fbd1@mail.gmail.com>
Date: Mon, 16 May 2005 16:23:40 +0530
From: Niraj Maheshwari <niraj.maheshwari@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: JFFS2 error while Copying
Reply-To: Niraj Maheshwari <niraj.maheshwari@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am using Linux Kernel 2.6.10 and applied the latest MTD patch from
website. We are using Intel Strata L18 flash.

After booting the kernel, we mount the JFFS2 partition by using below comma=
nd.

mount -t jffs2 /dev/mtdblock0 /disc

Then we try to copy a directory frm Ramdisk by using following command.

cp -a bin/ disc/

Then it gives below error/warning just once and then copies the data.

Node totlen on flash (0x00800080) !=3D totlen from node ref (0x0000000c).

This problem doesn't come on Intel W18 flash.=20

Is this really a problem ? If yes, then how can we overcome this ?

Let me know if you need further information in this regard.

Thanks
Niraj
