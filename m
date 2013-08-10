Received: from mail-qe0-f54.google.com ([209.85.128.54])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8FRU-0003I2-CC
 for linux-mtd@lists.infradead.org; Sat, 10 Aug 2013 20:07:17 +0000
Received: by mail-qe0-f54.google.com with SMTP id 1so2936710qee.13
 for <linux-mtd@lists.infradead.org>; Sat, 10 Aug 2013 13:06:47 -0700 (PDT)
Received: from mail-qc0-x22d.google.com (mail-qc0-x22d.google.com
 [2607:f8b0:400d:c01::22d])
 by mx.google.com with ESMTPSA id nh4sm26588684qeb.6.2013.08.10.13.01.27
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
 Sat, 10 Aug 2013 13:01:28 -0700 (PDT)
Received: by mail-qc0-f173.google.com with SMTP id z10so2783132qcx.18
 for <linux-mtd@lists.infradead.org>; Sat, 10 Aug 2013 13:01:27 -0700 (PDT)
MIME-Version: 1.0
From: James Pharaoh <james@phsys.co.uk>
Date: Sat, 10 Aug 2013 22:01:12 +0200
Message-ID: <CALSKDaTTZjbRSS9q4frrmqbty0eTC92TtgJn8mVbMGdLdfT+gA@mail.gmail.com>
Subject: Root on UBIFS prevents NFS on all filesystem
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am having a problem making any kind of NFS export from my NAS, which
is running Debian with the root filesystem on UBIFS.

Now, I understand that NFS exports are not (yet) supported from UBIFS.
But I seem to be having the same trouble exporting from other
filesystems, including BTRFS and EXT3.

Can someone confirm if having my root filesystem on UBIFS will cause
this behaviour and if there is anything I can do about it?

The actual error I get while restarting nfs-kernel-server is as follows:

"/vol/test does not support NFS export"

Thanks,
James
