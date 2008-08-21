Received: from nf-out-0910.google.com ([64.233.182.186])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KW3iL-0004yH-Da
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 06:32:10 +0000
Received: by nf-out-0910.google.com with SMTP id d21so652349nfb.22
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Aug 2008 23:32:08 -0700 (PDT)
Message-ID: <ac9c93b10808202332n2654884eh877848df2da59f20@mail.gmail.com>
Date: Thu, 21 Aug 2008 08:32:08 +0200
From: "Frans Meulenbroeks" <fransmeulenbroeks@gmail.com>
To: jaredeh@gmail.com
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
In-Reply-To: <48AD00C4.6060302@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48AD00C4.6060302@gmail.com>
Cc: cotte@de.ibm.com, linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jared, nice work!

I've also read your paper from the linux symposium
(http://ols.fedoraproject.org/OLS/Reprints-2008/hulbert-reprint.pdf)

A few questions:
- how does this benchmark compared to cramfs and squashfs in a NAND-only system
  (or is it just not a good plan to use this with NAND-only (of course
I won't get XIP with NAND, I understand that)
- would axfs be suitable as a filesystem on a ram disk?

Background for the last question is that if you do not have the memory
to retain all pages uncompressed (as you would with ramfs), this could
be a nice intermediate format.
Furthermore compared to ramfs, a filesystem on a ramdisk does not need
the initialisation during startup (decompressing the cpio file,
creating the files, copying the data), so when it comes to boot times
a filesystem on a ramdisk (e.g. axfs) could be a better choice.

Appreciate your feedback.

Frans.
