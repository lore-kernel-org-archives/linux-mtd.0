Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NV4DU-0003GP-P7
	for linux-mtd@lists.infradead.org; Wed, 13 Jan 2010 14:29:05 +0000
Received: by bwz4 with SMTP id 4so15585890bwz.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 Jan 2010 06:28:59 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 13 Jan 2010 15:28:58 +0100
Message-ID: <a328840c1001130628h4bb0f03auad84dd1564fc08a7@mail.gmail.com>
Subject: Memory leak on UBI volume truncating
From: Marek Skuczynski <mareksk7@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,
  I have prepare a simple volume update stress test (see test code below).
  This test has been run for kernel 2.6.23 with some updates from 2.6.28,
  and always after a few minutes the OOM killer was launched.

  What i found it that each an UBI volume truncate operation with
ubiupdatevol tool
  causes memory leak. I think this happens because:

  - ubi_start_update()  param "bytes" is equal 0

  - vol->updating flag is re-set to 0

  - vol->upd_buf is allocated regardless of vol->updating flag,
     but not released on device close by vol_cdev_release()

  I never run the test on a newer kernel version, so I cannot confirm
that this problem still exists.

  Please confirm, whether my findings are correct or not, thanks.

Regards,
  Marek


int ubi_start_update(struct ubi_device *ubi, struct ubi_volume *vol,
    long long bytes)
   /* ... */
   vol->updating = 1;

   if (bytes == 0) {
        /* ... */
        vol->updating = 0;
   }

   vol->upd_buf = vmalloc(ubi->leb_size);
   /* ... */
}

static int vol_cdev_release(struct inode *inode, struct file *file)
{
  /* ... */
   if (vol->updating) {
      /* ... */
      vol->updating = 0;
      vfree(vol->upd_buf);
   }
   /* ... */
}

[--- TEST BODY ----]
while [ true ]
do
   echo "Truncating #1"
   /tmp/ubiupdatevol /dev/ubi0_3 -t
   echo "Writing #1"
   cat /dev/zero  | /tmp/ubiupdatevol /dev/ubi0_3 -s 4206 -
   echo "Truncating #2"
   /tmp/ubiupdatevol /dev/ubi0_3 -t
   echo "Writing #2"
   cat /dev/urandom  | /tmp/ubiupdatevol /dev/ubi0_3 -s 4206 -
done
