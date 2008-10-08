Received: from wa-out-1112.google.com ([209.85.146.181])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KnMtw-00036L-TG
	for linux-mtd@lists.infradead.org; Wed, 08 Oct 2008 00:27:41 +0000
Received: by wa-out-1112.google.com with SMTP id v33so2093083wah.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Oct 2008 17:27:39 -0700 (PDT)
Message-ID: <8956d4ca0810071727i63554837k923a0091b3ef9bd0@mail.gmail.com>
Date: Wed, 8 Oct 2008 11:27:39 +1100
From: "Mitch Davis" <mjd-linux-mtd@afork.com>
Sender: capnkernel@gmail.com
To: linux-mtd@lists.infradead.org
Subject: mtd-utils: fec.c uses bcopy()
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I use buildroot to build my embedded Linux.  My run-time library is
uClibc, which doesn't provide bcopy().

fec.c in mtd-utils uses bcopy(), so mtd-utils doesn't compile for me.
I'd like to fix this.

 - Should I rewrite fec.c so it uses memcpy instead?
 - Should I just add #define NEED_BCOPY to fec.c?
 - Should I leave fec.c unchanged and add -DNEED_BCOPY to the Makefile
(which would be passed to every compile?)

  http://git.infradead.org/mtd-utils.git?a=blob_plain;f=fec.c

Which solution would you guys accept?

Thanks,

Mitch.
