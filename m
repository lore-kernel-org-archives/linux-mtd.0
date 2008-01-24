Received: from wx-out-0506.google.com ([66.249.82.224])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JI9hy-0006Ph-Vs
	for linux-mtd@lists.infradead.org; Thu, 24 Jan 2008 21:34:09 +0000
Received: by wx-out-0506.google.com with SMTP id s7so321646wxc.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 24 Jan 2008 13:34:01 -0800 (PST)
Message-ID: <8bd0f97a0801241333u6ff94ebav3487baee90b6965c@mail.gmail.com>
Date: Thu, 24 Jan 2008 16:33:59 -0500
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: chip driver for ST PSD4256G6V parts
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

we have a driver for the ST PSD4256G6V parts (1) that needs to be
cleaned up a bit and pushed to mainline.  the trouble is that this
part is completely non-standard.  that is to say, it isnt CFI or JEDEC
compatible.  while i'd love to see this part simply disappear, it's
out of our (the software team's) hands, which means we need to support
it.

what makes me sad is the complete lack of any sort of chip-specific
driver in drivers/mtd/chips/ ... so this would need
drivers/mtd/chips/PSD4256G6V.c which is in stark contrast to
everything else.  but i guess it cant be avoided and that's what i
need to submit, right ?

(1): http://www.st.com/stonline/products/literature/ds/8116/psd4256g6v.htm
-mike
