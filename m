Received: from [203.200.31.15] (helo=mail.bpltelecom.com)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 19rXio-0006xW-Iv
	for <linux-mtd@lists.infradead.org>; Tue, 26 Aug 2003 07:54:32 +0100
Message-ID: <1578.10.10.13.147.1061881336.squirrel@mail.bpltelecom.com>
Date: Tue, 26 Aug 2003 12:32:16 +0530 (IST)
From: "Vidya Srinivas" <vidya.s@bpltelecom.com>
To: <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: cramfs:wrong magic
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

   I am using Montavista Linux. I want to mount cramfs as my rootfile
system. In the kernal command line arguments i have mentioned:

root=/dev/mtdblock3 rootfstype=cramfs init=/sbin/init

At the time of FS mounting, the kernel is throwing this error:

cramfs : wrong magic

And, the kernel panics.

I checked the magic numberof my file system image file (by reading the
contents in textpad), it shows 0x28cd3d45 which i think is the right magic
number.

If i simply try to mount this image on my Red hat 7.3,

mount -o loop -t cramfs img.cramfs /mnt/

It mounts correctly without giving any problem.

What might be the mistake?

Please help me out.

Regards,

-- 
Vidya.S
BPL TELECOM LTD
11th KM, Arikere
Bannergatta Road,
Bangalore - 560072
email - vidya.s@bpltelecom.com
Ph - 6589080 extn - 2005
