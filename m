Received: from goliath.siemens.de ([192.35.17.28])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C2sxS-0007cT-Hb
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2004 10:53:04 -0400
Message-ID: <7F3FE9B2FBF6194691BC493C6699C0B1568B94@mchh9esa.mchh.siemens.de>
From: Kuefmann Andreas ICM CP RD SD 1 <andreas.kuefmann@siemens.com>
To: "'William J Beksi'" <wjbeksi@setabox.com>,
	Kuefmann Andreas ICM CP RD SD 1 <andreas.kuefmann@siemens.com>
Date: Thu, 2 Sep 2004 16:52:36 +0200 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: AW: how to change size of MTD partitions at runtime
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi William,

thanks for your proposal. I'll give it a try.

The "partition table" is part of the bootloader's (U-Boot) environment.
So the first step would be to update the bootloader's environment
to reflect the new partition sizes.
Then I'd try to write the changes to the proc filesystem and hope
that there are no side effects when doing so.

thanks,
- Andy

-----Urspr=FCngliche Nachricht-----
Von: William J Beksi [mailto:wjbeksi@setabox.com]=20
Gesendet: Mittwoch, 1. September 2004 17:35
An: Kuefmann Andreas ICM CP RD SD 1
Cc: 'linux-mtd@lists.infradead.org'
Betreff: Re: how to change size of MTD partitions at runtime


Hi,
Kuefmann Andreas ICM CP RD SD 1 wrote:

>Hi all,
>
>I'm searching for a solution to dynamically change the size of MTD=20
>partitions at runtime.
>
>This functionality is required for a flash update of kernel and/or=20
>rootfs in the special case that the new kernel/rootfs is larger than=20
>the old one. (in an embedded environment)
>
>1.)
>there is no problem in erasing the flash, e.g eraseall /dev/mtd?,=20
>(acting from a chrooted environment)
>
>2.)
>However, reprogramming the flash with a larger image (now exceeding =
the=20
>limits of the previous partition) isn't as easy as a cp newimage.img=20
>/dev/mtd?.
>
>The MTD layer will still rely on the (old) partition sizes that were=20
>valid during system startup. (taken over from a U-BOOT environment)
> =20
>
I'm using the proc filesytem to dynamically change the mtd partition=20
sizes on my flash at runtime. I added a function to mtdcore.c that =
looks=20
like this:
static int mtd_write_proc (struct file *filp, const char *buf, unsigned =

long count, void *data)=20
{
    int value;
    struct mtd_info *this;
    unsigned long pos =3D (unsigned long)(filp->f_pos);
  =20
    down(&mtd_table_mutex);

    while (pos < count) {
       /* Get the partition number. */
       if (pos =3D=3D 0) {
          value =3D antoi(buf, pos, count);
          this =3D mtd_table[value];
       }
       /* Change size of the partition (in Mb). */
       if (pos =3D=3D 2) {
          value =3D antoi(buf, pos, count);
          this->size =3D value*1024*1024;
       } =20
       pos++;
    }
    up(&mtd_table_mutex);
    return count;
}
The partition table values can be changed by writing the partition=20
number and size (in megabytes) to /proc/mtd: echo 1 3 > /proc/mtd ||
||I'm not sure if this is the best way to dynamically change the
partition sizes at runtime, nor is it very safe.

>My question now is:
>- How can I manage to force a re-read of the partition table?
>
>
> =20
>
Where do you keep your partition table? I'm using a cramfs filesystem=20
and LinuxBIOS on nand flash. I reserve the first block of the flash to=20
store a partition table, bad block list, and other information. I have =
a=20
set of user space utilites for reading and writing the partition table.

--
William J Beksi

>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
> =20
>
