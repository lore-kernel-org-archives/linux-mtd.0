Message-ID: <4ABB7224.8000804@nokia.com>
Date: Thu, 24 Sep 2009 16:20:36 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Darwin Rambo <drambo@broadcom.com>
Subject: Re: UBIFS and hardware ECC of all FF pages of MLC NAND
References: <B125D8217ABC4B43826503DE00A2D44910D7E85DFD@SJEXCHCCR01.corp.ad.broadcom.com>
In-Reply-To: <B125D8217ABC4B43826503DE00A2D44910D7E85DFD@SJEXCHCCR01.corp.ad.broadcom.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Darwin Rambo wrote:
> I have a 512 byte-at-a time hardware ECC generator that generates a particular non-FF code for 512 bytes of FF data. For a 4K MLC NAND flash, that means in the OOB, I have 8 ECCs/page.
> 
> Ubinize creates large download files which in some cases have 64 byte headers, followed by a page of FFs, and in other cases, the entire page is FFs. (I noticed that mkfs.jffs2 doesn't appear to create large blocks of FFs in the image file. In fact, by 6MB jffs2 file became 14MB when I rebuilt for UBIFS, much of the file being large blocks of FFs).
> 
> When I download and program the flash I took the decision to program the ECC even for all FF pages.
> 
> I was getting ECC corruption on startup, and eventually traced it down to UBIFS writing new data to these all FF pages, but because the FS noticed that the page was blank, didn't erase anything, and wrote data, even though the ECCs were still programmed and were non-FF. The result is that the new ECC collided with the old ECC that was there, and I got corruption of a nearby page's ECC as well as the ECC in the page that was written.
> 
> When I changed the downloader to detect all FF pages and to leave the ECC area of the OOB at FF, then UBIFS works fine.
> 
> I had originally wanted the ECC even on all FF pages since this should help stuck bit problems, even for erased all FF pages.
> 
> So the questions are
> 1. should UBIFS use the FF pattern alone as an assumption of a writable page, or should it also check the ECC?

Sorry for the slow reply.

UBIFS assumes FF pages at the end of eraseblocks are empty.  UBI and UBIFS are
designed not to require OOB and will not read or write it.

> 2. for initial downloading, should an ECC be programmed on all FF data pages? Is there any correction advantage?

In your case, as you have discovered, you must not program ECC for FF pages at
the end of eraseblocks.

> 3. for runtime page writes, should an all FF page leave the ECC at FF as well?

No.  The only time UBI or UBIFS will write an all FF page is if that is the
data to be stored - in which case, it should be given an ECC.

> 
> I apologize in advance if this particular issue has already been covered elsewhere. Thanks!
