Received: from dns03.mail.yahoo.co.jp ([211.14.15.206])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Nvm7-0000Lx-TE
	for <linux-mtd@lists.infradead.org>; Thu, 05 Jun 2003 15:31:32 +0100
Message-ID: <000e01c32b6f$22d11d80$570486da@w0a3t0>
From: "matsunaga" <matsunaga_kazuhisa@yahoo.co.jp>
To: <linux-mtd@lists.infradead.org>
Date: Thu, 5 Jun 2003 23:31:21 +0900
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Subject: PAD macro
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi 

This is really a trivial thing, 
but there are places where PAD macro is not used for 4byte alignment.
I think it would be better to be unified.

scan.c, line 357 ofs = (ofs+3)&~3;
dir.c,  line 359 writtenlen = (writtenlen+3)&~3;
dir.c,  line 656 writtenlen = (writtenlen+3)&~3;

Best regards.

Matsunaga.
__________________________________________________
Do You Yahoo!?
Yahoo! BB is Broadband by Yahoo!
http://bb.yahoo.co.jp/
