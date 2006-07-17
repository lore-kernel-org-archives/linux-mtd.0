Received: from mx1.myoutlookonline.com ([69.25.74.59])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G2WUx-0007xj-5T
	for linux-mtd@lists.infradead.org; Mon, 17 Jul 2006 13:03:15 -0400
From: "Raj Kumar Yadav" <ryadav@neomagic.com>
To: <linux-mtd@lists.infradead.org>
Subject: RE: nandwrite problem
Date: Mon, 17 Jul 2006 22:31:49 +0530
Message-ID: <004e01c6a9c2$b330d7b0$491fa8c0@pcryadav>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <625fc13d0607170804i745f2566k8173ba5d85cad662@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Also for mtdblock/5 the character node will be mtd10  "mknod /dev/mtd10 c 90
10".

With mtd character interface every partition is accessed through pair of two
char device node.
First with  read-write permission. Second with read-only permission.

It is like
/dev/mtdblock/0   b 31 0
/dev/mtd0		c 90 0 (Read-write)
/dev/mtd1		c 90 1 (read only)

/dev/mtdblock/1   b 31 1
/dev/mtd2		c 90 2 (Read-write)
/dev/mtd3		c 90 3 (read only)

...

/dev/mtdblock/5   b 31 5
/dev/mtd10		c 90 10 (Read-write)
/dev/mtd11		c 90 11 (read only)


Raj Kumar Yadav

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Josh Boyer
Sent: Monday, July 17, 2006 8:35 PM
To: Davide CASCONE
Cc: linux-mtd@lists.infradead.org
Subject: Re: nandwrite problem

On 7/17/06, Davide CASCONE <davide.cascone@st.com> wrote:
>
> I have a NAND device related to MTD block 5. The NAND device is correctly
probing during the kernel boot phase.
> If I run the following commands
>
> #mkdir /dev/mtdblock/5 b 31 5
> #mount -t jffs2 /dev/mtdblock/5 /nand/
>
> the JFFS2 file system is correctly mounting on the /nand/ directory.
> But, if I run the following command
>
> #./nandwrite -j /dev/mtdblock/5 filesys.jffs2_nand

nandwrite needs a character device, not a block device.  Use /dev/mtd5
instead.

josh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
