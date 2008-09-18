Received: from wf-out-1314.google.com ([209.85.200.174])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KgL76-0002FN-Ui
	for linux-mtd@lists.infradead.org; Thu, 18 Sep 2008 15:08:13 +0000
Received: by wf-out-1314.google.com with SMTP id 28so3815422wfc.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 Sep 2008 08:08:11 -0700 (PDT)
Message-ID: <8956d4ca0809180800k6915961em8018ffa439a89045@mail.gmail.com>
Date: Fri, 19 Sep 2008 01:00:38 +1000
From: "Mitch Davis" <mjd-linux-mtd@afork.com>
Sender: capnkernel@gmail.com
To: linux-mtd@lists.infradead.org
Subject: mkfs.jffs2: device table entries not the same type as in FS
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm using buildroot, which can use mkfs.jffs2 to generate JFFS2
images.  I'm having the problem that mkfs.jffs2 fails with this
message:

  % mkfs.jffs2 -e 0x20000 -l -s 0x800 -n -D device_table.txt -d root
-o rootfs.arm-20080918.jffs2
  mkfs.jffs2: root/dev/mem: file type does not match specified type!

The problem is that there is an entry for /dev/mem (plus lots of
others) in device_table.txt, but there is also an empty file called
root/dev/mem in the tree I've pointed mkfs.jfffs2 at.  Now of course,
the problem would go away if there was no empty file there, but those
files are a consequence of generating other output types in buildroot
using fakeroot to imitate root-owned device files.  It's not really
possible to make them go away.

Here's the code in mkfs.jffs2:

  http://git.infradead.org/mtd-utils.git?a=blob;f=mkfs.jffs2.c;hb=d769da93a56590c23ce9430a1d970e31e835ae88#l320

The comment says "It is ok for some types of files to not exit on disk
(such as device nodes), but if they _do_ exist the specified mode had
better match the actual file or strange things will happen....".

What strange things?  If I change the code so it just replaces the
existing filesystem_entry, what will break?

Hoping you can help me understand that code.

Thanks,

Mitch.
