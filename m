Received: from cmsout01.mbox.net ([165.212.64.31])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C1p9O-0001Vk-5N
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2004 12:37:08 -0400
Message-ID: <068701c48eaf$845dfe70$fd0ba8c0@briantpc>
From: "Brian T" <btuch@usa.net>
To: <linux-mtd@lists.infradead.org>
References: <042901c48c42$2593cd30$fd0ba8c0@briantpc><045201c48c4b$8407dc40$fd0ba8c0@briantpc><Pine.LNX.4.61.0408271203050.2901@xanadu.home><053c01c48c60$4976ad80$fd0ba8c0@briantpc>
	<1093631103.16320.14.camel@thomas.tec.linutronix.de>
Date: Mon, 30 Aug 2004 11:36:35 -0500
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0684_01C48E85.9AF8D5D0"
Subject: Re: undefined reference to `__ffs'
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------=_NextPart_000_0684_01C48E85.9AF8D5D0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit




> On Fri, 2004-08-27 at 20:04, Brian T wrote:
> > So MTD is no longer compatable with the current 2.4 tree?  I just
unpacked
> > it and didn't see it in linux/asm-i386/bitops.h .  Am I looking in the
wrong
> > place?
>
> __ffs was never in 2.4. Move to 2.6 or add it to compatmac.h and provide
> a nice patch, if you really want to hang on with 2.4
>
> tglx

compatmac.h patch attached for __ffs() .

Compiles against 2.4.27 now.  Hope I didn't break anything.

-Brian

------=_NextPart_000_0684_01C48E85.9AF8D5D0
Content-Type: application/octet-stream;
	name="compatmac.diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="compatmac.diff"

--- include/linux/mtd/compatmac.h.orig	Mon Aug 30 09:17:28 2004=0A=
+++ include/linux/mtd/compatmac.h	Mon Aug 30 11:22:18 2004=0A=
@@ -64,6 +64,22 @@=0A=
 =0A=
 #include <linux/sched.h>=0A=
 =0A=
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)=0A=
+/**=0A=
+ *   * __ffs - find first bit in word.=0A=
+ *     * @word: The word to search=0A=
+ *       *=0A=
+ *         * Undefined if no bit exists, so code should check against 0 =
first.=0A=
+ *           */=0A=
+static inline unsigned long __ffs(unsigned long word)=0A=
+{=0A=
+	__asm__("bsfl %1,%0"=0A=
+	:"=3Dr" (word)=0A=
+	:"rm" (word));=0A=
+	return word;=0A=
+}=0A=
+#endif /* < 2.5.0 */=0A=
+=0A=
 #ifdef __rh_config_h__=0A=
 #define sigmask_lock sighand->siglock=0A=
 #define sig sighand=0A=

------=_NextPart_000_0684_01C48E85.9AF8D5D0--
