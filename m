Date: Tue, 20 Feb 2007 19:11:16 +0000 (GMT)
From: Alexey Korolev <akorolev@infradead.org>
To: Nicolas Pitre <nico@cam.org>
Subject: Re: [SPAM]  Re: P30 flash left in read status mode after a write
In-Reply-To: <Pine.LNX.4.64.0702141632470.1757@xanadu.home>
Message-ID: <Pine.LNX.4.64.0702201904170.11543@pentafluge.infradead.org>
References: <45D35A6F.3060203@ringle.org>
	<20070214205601.GB20486@lazybastard.org>
	<45D37D96.4010501@ringle.org>
	<Pine.LNX.4.64.0702141632470.1757@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@lazybastard.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

HI ALL.


I'm not sure if it could help but it remind me one bug I faced over a year ago. Could you please try this fixup. It fixes improper CFI parsing in CFI drivers.
--- trunk/drivers/mtd/chips/cfi_cmdset_0001.c (revision 8)
+++ trunk/drivers/mtd/chips/cfi_cmdset_0001.c (revision 10)
@@ -285,7 +285,7 @@
                             sizeof(struct cfi_intelext_otpinfo);

               /* Burst Read info */
-             extra_size += (extp->MinorVersion < '4') ? 6 : 5;
+             extra_size += (unsigned int)extp->extra[extra_size+1]+2;

               /* Number of hardware-partitions */
               extra_size += 1;
@@ -519,7 +519,7 @@
                      sizeof(struct cfi_intelext_otpinfo);

               /* Burst Read info */
-             offs += (extp->MinorVersion < '4') ? 6 : 5;
+             offs += (int)extp->extra[offs+1]+2;
-------------------------------------

Original fix message is here:http://lists.infradead.org/pipermail/linux-mtd/2005-October/014144.html

Thanks
Alexey
