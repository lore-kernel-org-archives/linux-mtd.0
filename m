Received: from mail-pz0-f43.google.com ([209.85.210.43])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SMIR5-0001ZK-9u
 for linux-mtd@lists.infradead.org; Mon, 23 Apr 2012 12:32:10 +0000
Received: by dadn15 with SMTP id n15so18904907dad.16
 for <linux-mtd@lists.infradead.org>; Mon, 23 Apr 2012 05:32:05 -0700 (PDT)
Message-ID: <4F954BAD.2010606@gmail.com>
Date: Mon, 23 Apr 2012 20:31:41 +0800
From: Mark <xiaoming1981.zhang@gmail.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] ubi: Do "dump_stack()" in case of the
 ubi_io_read()/ubi_io_write()/do_sync_erase() has an error
References: <CAGKjfA1YN6wrSpV3ZuvYfA=gW_hjBLPKTraudeL_FTUu2dTJ8Q@mail.gmail.com>
In-Reply-To: <CAGKjfA1YN6wrSpV3ZuvYfA=gW_hjBLPKTraudeL_FTUu2dTJ8Q@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>, zxm927@163.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ubi: Do "dump_stack()" to always have the dump in case of the
ubi_io_read()/ubi_io_write()/do_sync_erase() has an error.

Signed-off-by: Mark Zhang <mark.zhang@motorola.com>
---
  drivers/mtd/ubi/io.c |   10 +++++-----
  1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 43f1a00..4a866db 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -198,7 +198,7 @@ retry:

  		ubi_err("error %d%s while reading %d bytes from PEB %d:%d, "
  			"read %zd bytes", err, errstr, len, pnum, offset, read);
-		ubi_dbg_dump_stack();
+		dump_stack();

  		/*
  		 * The driver should never return -EBADMSG if it failed to read
@@ -284,7 +284,7 @@ int ubi_io_write(struct ubi_device *ubi, const void 
*buf, int pnum, int offset,
  	if (ubi_dbg_is_write_failure(ubi)) {
  		dbg_err("cannot write %d bytes to PEB %d:%d "
  			"(emulated)", len, pnum, offset);
-		ubi_dbg_dump_stack();
+		dump_stack();
  		return -EIO;
  	}

@@ -293,7 +293,7 @@ int ubi_io_write(struct ubi_device *ubi, const void 
*buf, int pnum, int offset,
  	if (err) {
  		ubi_err("error %d while writing %d bytes to PEB %d:%d, written "
  			"%zd bytes", err, len, pnum, offset, written);
-		ubi_dbg_dump_stack();
+		dump_stack();
  		ubi_dbg_dump_flash(ubi, pnum, offset, len);
  	} else
  		ubi_assert(written == len);
@@ -370,7 +370,7 @@ retry:
  			goto retry;
  		}
  		ubi_err("cannot erase PEB %d, error %d", pnum, err);
-		ubi_dbg_dump_stack();
+		dump_stack();
  		return err;
  	}

@@ -388,7 +388,7 @@ retry:
  			goto retry;
  		}
  		ubi_err("cannot erase PEB %d", pnum);
-		ubi_dbg_dump_stack();
+		dump_stack();
  		return -EIO;
  	}
