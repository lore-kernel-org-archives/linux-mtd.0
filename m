From: David Woodhouse <dwmw2@infradead.org>
To: Ian Campbell <icampbell@arcom.com>
In-Reply-To: <1067861205.11248.78.camel@linuxdev.icampbell.arcom.cc>
References: <1067856319.11251.47.camel@linuxdev.icampbell.arcom.cc>
	 <1067858096.3423.431.camel@hades.cambridge.redhat.com>
	 <1067859524.11241.58.camel@linuxdev.icampbell.arcom.cc>
	 <1067861205.11248.78.camel@linuxdev.icampbell.arcom.cc>
Content-Type: multipart/mixed; boundary="=-iOUPOkv2loy04phlEg9w"
Message-Id: <1067862159.3423.532.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 03 Nov 2003 12:22:40 +0000
cc: Linux MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: Re: ilookup used in fs/jffs2/gc.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-iOUPOkv2loy04phlEg9w
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2003-11-03 at 12:06 +0000, Ian Campbell wrote:
> with the latest CVS I see corruption of some of the nodes in /dev/. I
> don't think this is anything to do with the ilookup stuff, but rather
> the update to the latest CVS code. 
> 
> /dev/ttyS0 (the console device) and some of /dev/tty[0-9] seem to be
> corrupted (the major.minor #s and other metadata is incorrect). 

Er, yes. It wasn't an endianness thing at all. It was a 'dwmw2 being
particularly stupid' thing. Oops.

-- 
dwmw2

--=-iOUPOkv2loy04phlEg9w
Content-Disposition: inline
Content-Type: message/rfc822

Received: from localhost.localdomain ([127.0.0.1](Exim
	4.22 #5 (Red Hat Linux)) id 1AGdiI-0004Vd-BA;
	Mon, 03 Nov 2003 12:21:42	+0000
Received: from [2002:d556:63ea::1] (helo=phoenix.infradead.org) by
	pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux)) id
	1AGdiG-0004VW-1j	for <linux-mtd-cvs@lists.infradead.org>;
	Mon, 03 Nov 2003	12:21:40 +0000
Received: from dwmw2 by phoenix.infradead.org with local (Exim 4.22) id
	1AGdh3-00079E-Qz for linux-mtd-cvs@lists.infradead.org;
	Mon, 03 Nov 2003	12:20:25 +0000
To: linux-mtd-cvs@lists.infradead.org
X-CVS-Module: mtd
X-CVS-Directory: mtd/include/linux/mtd
Precedence: first-class
Message-Id: <E1AGdh3-00079E-Qz@phoenix.infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Mon, 03 Nov 2003 12:20:25 +0000
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Spam-Status: No, hits=-0.1 required=5.0
	tests=PATCH_UNIFIED_DIFF,SPAM_PHRASE_00_01 version=2.44
X-Spam-Level: 
X-Pentafluge-Mail-From: <dwmw2@infradead.org>
Subject: mtd/include/linux/mtd compatmac.h,1.61,1.62
X-BeenThere: linux-mtd-cvs@lists.infradead.org
X-Mailman-Version: 2.1.1
List-Id: Linux MTD CVS commit list <linux-mtd-cvs.lists.infradead.org>
List-Unsubscribe: 
	<http://lists.infradead.org/mailman/listinfo/linux-mtd-cvs>,
	<mailto:linux-mtd-cvs-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd-cvs>
List-Post: <mailto:linux-mtd-cvs@lists.infradead.org>
List-Help: <mailto:linux-mtd-cvs-request@lists.infradead.org?subject=help>
List-Subscribe: 
	<http://lists.infradead.org/mailman/listinfo/linux-mtd-cvs>,
	<mailto:linux-mtd-cvs-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-cvs-bounces@lists.infradead.org
Errors-To: linux-mtd-cvs-bounces@lists.infradead.org
X-SA-Exim-Mail-From: linux-mtd-cvs-bounces@lists.infradead.org
X-SA-Exim-Scanned: No; SAEximRunCond expanded to false
X-Pentafluge-Mail-From: <linux-mtd-cvs-bounces@lists.infradead.org>
X-Evolution-Source: imap://dwmw2@pentafluge.infradead.org/
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

Update of /home/cvs/mtd/include/linux/mtd
In directory phoenix.infradead.org:/tmp/cvs-serv27457

Modified Files:
	compatmac.h 
Log Message:
Fix old_encode_dev()

Index: compatmac.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/compatmac.h,v
retrieving revision 1.61
retrieving revision 1.62
diff -u -r1.61 -r1.62
--- compatmac.h	13 Oct 2003 20:56:48 -0000	1.61
+++ compatmac.h	3 Nov 2003 12:20:23 -0000	1.62
@@ -55,7 +55,7 @@
 #if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,73)
 #define iminor(d) minor(d)
 #define imajor(d) major(d)
-#define old_encode_dev(d) ( imajor(d) | iminor(d) )
+#define old_encode_dev(d) ( (imajor(d)<<8) | iminor(d) )
 #define old_decode_dev(rdev)  (kdev_t_to_nr(mk_kdev((rdev)>>8, (rdev)&0xff)))
 #define old_valid_dev(d) (1)
 #endif


__________________________________________________________
Linux-MTD CVS commit list
http://lists.infradead.org/mailman/listinfo/linux-mtd-cvs/
--=-iOUPOkv2loy04phlEg9w--
