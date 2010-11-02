Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PDHzA-0005Du-88
	for linux-mtd@lists.infradead.org; Tue, 02 Nov 2010 14:37:17 +0000
Received: by gxk25 with SMTP id 25so4408035gxk.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 02 Nov 2010 07:37:14 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 2 Nov 2010 15:37:13 +0100
Message-ID: <AANLkTimwumfui-_T1ScDYwMLKbNh1ia-SDMUg56wTfN5@mail.gmail.com>
Subject: Suggested patch: reset errno after isatty()
From: Ketil Froyn <ketil@froyn.name>
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

isatty() uses an ioctl and the resulting error code to determine if an
fd is a tty or not. If it isn't, errno is set to ENOTTY. Later in the
code, pread() fails, or rather returns 0 immediately. When this
happens, the following perror("pread") tells me:

pread: Not a typewriter

which is the wrong error. Here's strace showing the issue:

open("/sdcard/mtd5.dump", O_WRONLY|O_CREAT|O_TRUNC|O_LARGEFILE, 0644) = 4
ioctl(4, TCGETS or SNDCTL_TMR_TIMEBASE, 0xbee43ab0) = -1 ENOTTY (Not a
typewriter)
write(2, "Block size 131072, page size 204"..., 47) = 47
write(2, "Dumping data starting at 0x00000"..., 64) = 64
ioctl(3, 0x40084d0b, 0xbee43c30)        = 0
pread(3, "", 2048, 0)                   = 0
write(2, "pread", 5)                    = 5
write(2, ": ", 2)                       = 2
write(2, "Not a typewriter", 16)        = 16
write(2, "\n", 1)                       = 1

And the included patch (below, against v1.4.1, but simple enough)
should take care of it.

Though if someone knows what could be causing the pread() to keep
failing, I'd be interested in hearing it! And the mtd device is
reported as having a page size of 2048 and oob size 56, so to get even
this far I added that as a valid page size. Isn't it?

diff --git a/nanddump.c b/nanddump.c
index 709b2db..ba370ad 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -374,6 +374,7 @@ int main(int argc, char * const argv[])
                close(fd);
                exit(EXIT_FAILURE);
        }
+       errno = 0;

        /* Initialize start/end addresses and block size */
        if (length)
