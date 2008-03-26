Received: from wf-out-1314.google.com ([209.85.200.168])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JeMq8-0000Ll-W8
	for linux-mtd@lists.infradead.org; Wed, 26 Mar 2008 04:02:17 +0000
Received: by wf-out-1314.google.com with SMTP id 29so3151145wff.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 25 Mar 2008 21:02:15 -0700 (PDT)
Message-ID: <bae050c10803252102k373c5bddudda56bba12a0979f@mail.gmail.com>
Date: Wed, 26 Mar 2008 12:02:15 +0800
From: Nancy <nancydreaming@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: UBI: about ubinize tool
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Hi,
    As I know, ubinize can generate UBI images. I don't understand why
its .cfg file need parameter "image=ubifs.img", why can't it collect
the content
from the defined vol_id automatically and output to file "ubi.img"?
    How to make the input image file? mkfs.ubifs can only generate
ubifs image. If it was another filesystem eg. vfat, there's no tool.
That's why I need a tool like ubinize. Its job should be collect all
the PEBs( not include ech) that the volume used and put them to output
files
.
