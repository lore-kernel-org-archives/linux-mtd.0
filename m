Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SM9A5-0003VC-De
 for linux-mtd@lists.infradead.org; Mon, 23 Apr 2012 02:37:58 +0000
Received: by pbcun4 with SMTP id un4so3577575pbc.36
 for <linux-mtd@lists.infradead.org>; Sun, 22 Apr 2012 19:37:55 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 23 Apr 2012 10:37:53 +0800
Message-ID: <CAGKjfA1YN6wrSpV3ZuvYfA=gW_hjBLPKTraudeL_FTUu2dTJ8Q@mail.gmail.com>
Subject: [PATCH] ubi: Do "dump_stack()" in case of the
 ubi_io_read()/ubi_io_write()/do_sync_erase() has an error
From: Xiaoming Zhang <xiaoming1981.zhang@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd <linux-mtd@lists.infradead.org>, zxm927@163.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

As you suggested there's a patch to turn "ubi_dbg_dump_stack()" into
"dump_stack()".
This is generated and tested on Linux-2.6.31/mips. The test result:

...
UBI error: ubi_io_read: error -77 while reading 2048 bytes from PEB
0:2048, read 2048 bytes
Call Trace:
[<80016fac>] dump_stack+0x8/0x34
[<80322b70>] ubi_io_read+0x158/0x1ac
[<80322c14>] ubi_io_read_vid_hdr+0x50/0x494
[<80324b04>] wear_leveling_worker+0x14c/0x634
[<80325448>] do_work+0x9c/0x134
[<80325660>] ubi_thread+0x180/0x204
[<8006934c>] kthread+0x84/0x8c
[<80021534>] kernel_thread_helper+0x10/0x18
...

The patch is listed below. Thank you.


ubi: Do "dump_stack()" to always have the dump in case of the
ubi_io_read()/ubi_io_write()/do_sync_erase() has an error.

Signed-off-by: Mark Zhang <mark.zhang@motorola.com>

--- linux-2.6.31.orig/drivers/mtd/ubi/io.c	2012-04-23 08:58:24.000000000 +0800
+++ linux-2.6.31/drivers/mtd/ubi/io.c	2012-04-23 09:01:51.000000000 +0800
@@ -173,7 +173,7 @@ retry:

 		ubi_err("error %d while reading %d bytes from PEB %d:%d, "
 			"read %zd bytes", err, len, pnum, offset, read);
-		ubi_dbg_dump_stack();
+		dump_stack();

 		/*
 		 * The driver should never return -EBADMSG if it failed to read
@@ -259,7 +259,7 @@ int ubi_io_write(struct ubi_device *ubi,
 	if (ubi_dbg_is_write_failure()) {
 		dbg_err("cannot write %d bytes to PEB %d:%d "
 			"(emulated)", len, pnum, offset);
-		ubi_dbg_dump_stack();
+		dump_stack();
 		return -EIO;
 	}

@@ -268,7 +268,7 @@ int ubi_io_write(struct ubi_device *ubi,
 	if (err) {
 		ubi_err("error %d while writing %d bytes to PEB %d:%d, written "
 			"%zd bytes", err, len, pnum, offset, written);
-		ubi_dbg_dump_stack();
+		dump_stack();
 	} else
 		ubi_assert(written == len);

@@ -323,7 +323,7 @@ retry:
 			goto retry;
 		}
 		ubi_err("cannot erase PEB %d, error %d", pnum, err);
-		ubi_dbg_dump_stack();
+		dump_stack();
 		return err;
 	}

@@ -341,7 +341,7 @@ retry:
 			goto retry;
 		}
 		ubi_err("cannot erase PEB %d", pnum);
-		ubi_dbg_dump_stack();
+		dump_stack();
 		return -EIO;
 	}



On Sun, Apr 22, 2012 at 10:37 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Sun, 2012-04-15 at 21:49 +0800, Mark wrote:
>> And, after I patched the nand driver, in most of the situations the
>> UBIFS can be successfully recovered, but I still get this error:
>>
>> ...
>> UBI error: ubi_io_read: error -77 while reading 126976 bytes from PEB
>> 2:4096, read 126976 bytes
>> UBIFS error (pid 481): insert_node: duplicate sqnum in replay
>> mount: mounting ubi13_0 on /usr/local/hmt/appdata failed: Invalid argument
>> ...
>>
>> Does this mean this should never happen to UBIFS? Then what could be the
>> reason?
>> Thank you very much, and my test environment:
>
> I see ubi_dbg_dump_stack() call in ubi_io_read() when it returns an
> error. If you have debugging enabled - you should have the dump in your
> kernel buffer.
>
> Yeah, we should turn it into 'dump_stack()' to always have the dump. I'd
> gratefully accept a patch.
>
> --
> Best Regards,
> Artem Bityutskiy
