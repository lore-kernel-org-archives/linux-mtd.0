Received: from mail-qw0-f49.google.com ([209.85.216.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PDdC6-0007La-HD
	for linux-mtd@lists.infradead.org; Wed, 03 Nov 2010 13:16:03 +0000
Received: by qwh6 with SMTP id 6so17110qwh.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 03 Nov 2010 06:16:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4CD11C03.3090207@parrot.com>
References: <AANLkTimwumfui-_T1ScDYwMLKbNh1ia-SDMUg56wTfN5@mail.gmail.com>
	<4CD11C03.3090207@parrot.com>
Date: Wed, 3 Nov 2010 14:16:01 +0100
Message-ID: <AANLkTimfxjrtV4eks5tK68h6TQ20soib+6gaTC+QyB4a@mail.gmail.com>
Subject: Re: Suggested patch: reset errno after isatty()
From: Ketil Froyn <ketil@froyn.name>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 3, 2010 at 9:23 AM, Matthieu CASTET
<matthieu.castet@parrot.com> wrote:

> Why errno is checked when pread return 0 ?
> Errno should be checked only when return is -1.

Good point, and I guess that was why I was getting weird errors in the
first place, because errno was checked when no error had occurred. Odd
that pread() returned 0 when trying to read on my android device -
maybe a bionic bug?

This code has been rewritten, but the new master isn't working for me
(yet). This patch against v1.4.1 seems to have solved my problems for
now. I've just replaced pread() with read(), because it works, and
fixed up the error checking.

--- a/nanddump.c
+++ b/nanddump.c
@@ -412,10 +412,25 @@ int main(int argc, char * const argv[])
                        memset (readbuf, 0xff, bs);
                } else {
                        /* Read page data and exit on failure */
-                       if (pread(fd, readbuf, bs, ofs) != bs) {
-                               perror("pread");
-                               goto closeall;
-                       }
+                       do {
+                               ret = read(fd, readbuf, bs);
+                               if (ret == -1) {
+                                       if (errno == EAGAIN || errno == EINTR) {
+                                               continue;
+                                       }
+                                       perror("read");
+                                       goto closeall;
+                               }
+                               if (ret == 0) {
+                                       printf("No more data to read\n");
+                                       break;
+                               }
+                               if (ret != bs) {
+                                       fprintf(stderr, "read() got
wrong number of bytes: got %i, expected %i\n", ret, bs);
+                                       goto closeall;
+                               }
+                               break;
+                       } while (1);
                }

                /* ECC stats available ? */
