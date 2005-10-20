Received: from zproxy.gmail.com ([64.233.162.202])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ESbeU-0001rT-HB
	for linux-mtd@lists.infradead.org; Thu, 20 Oct 2005 10:45:12 -0400
Received: by zproxy.gmail.com with SMTP id 14so278557nzn
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Oct 2005 07:44:00 -0700 (PDT)
Date: Thu, 20 Oct 2005 23:43:51 +0900
From: Suzuki Takashi <suzuki.takashi@gmail.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <b1c6420f0510142012m3c6807acx885ff7d71e532368@mail.gmail.com>
References: <b1c6420f0510142012m3c6807acx885ff7d71e532368@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID: <4357ad30.3d4bb9f2.6009.3397@mx.gmail.com>
Subject: Re: [PATCH 2/4] util/jffs2reader file size fix
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 15 Oct 2005 12:12:07 +0900, I wrote:
> This is a trivial patch for util/jffs2reader
> to correct file sizes shown in the listings.
> 
> Please review and apply if it is ok.

The patch without quoted-printable encoding.
Thanks.


--- jffs2reader.c.compile	2005-10-10 12:51:37.000000000 +0900
+++ jffs2reader.c	2005-10-10 17:55:17.000000000 +0900
@@ -369,7 +369,7 @@ void printdir(char *o, size_t size, stru
 			putblock((char*)&rdev, sizeof(rdev), &devsize, ri);
 			printf("%4d, %3d ", (int)MAJOR(rdev), (int)MINOR(rdev));
 		} else {
-			printf("%9ld ", (long)je32_to_cpu (ri->dsize));
+			printf("%9ld ", (long)je32_to_cpu (ri->isize));
 		}
 		d->name[d->nsize]='\0';
 		if (age < 3600L * 24 * 365 / 2 && age > -15 * 60) {


-- 
Suzuki Takashi
