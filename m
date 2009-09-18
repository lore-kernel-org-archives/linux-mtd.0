Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mol2y-0005RP-58
	for linux-mtd@lists.infradead.org; Fri, 18 Sep 2009 21:31:21 +0000
From: "Darwin Rambo" <drambo@broadcom.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Fri, 18 Sep 2009 14:31:05 -0700
Subject: UBIFS and hardware ECC of all FF pages of MLC NAND
Message-ID: <B125D8217ABC4B43826503DE00A2D44910D7E85DFD@SJEXCHCCR01.corp.ad.broadcom.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have a 512 byte-at-a time hardware ECC generator that generates a particu=
lar non-FF code for 512 bytes of FF data. For a 4K MLC NAND flash, that mea=
ns in the OOB, I have 8 ECCs/page.

Ubinize creates large download files which in some cases have 64 byte heade=
rs, followed by a page of FFs, and in other cases, the entire page is FFs. =
(I noticed that mkfs.jffs2 doesn't appear to create large blocks of FFs in =
the image file. In fact, by 6MB jffs2 file became 14MB when I rebuilt for U=
BIFS, much of the file being large blocks of FFs).

When I download and program the flash I took the decision to program the EC=
C even for all FF pages.

I was getting ECC corruption on startup, and eventually traced it down to U=
BIFS writing new data to these all FF pages, but because the FS noticed tha=
t the page was blank, didn't erase anything, and wrote data, even though th=
e ECCs were still programmed and were non-FF. The result is that the new EC=
C collided with the old ECC that was there, and I got corruption of a nearb=
y page's ECC as well as the ECC in the page that was written.

When I changed the downloader to detect all FF pages and to leave the ECC a=
rea of the OOB at FF, then UBIFS works fine.

I had originally wanted the ECC even on all FF pages since this should help=
 stuck bit problems, even for erased all FF pages.

So the questions are
1. should UBIFS use the FF pattern alone as an assumption of a writable pag=
e, or should it also check the ECC?
2. for initial downloading, should an ECC be programmed on all FF data page=
s? Is there any correction advantage?
3. for runtime page writes, should an all FF page leave the ECC at FF as we=
ll?

I apologize in advance if this particular issue has already been covered el=
sewhere. Thanks!
