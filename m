Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YxhRd-0007bX-9g
 for linux-mtd@lists.infradead.org; Wed, 27 May 2015 19:56:53 +0000
Received: by pdfh10 with SMTP id h10so24286619pdf.3
 for <linux-mtd@lists.infradead.org>; Wed, 27 May 2015 12:56:32 -0700 (PDT)
Date: Wed, 27 May 2015 12:56:23 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Christian Riesch <christian.riesch@omicron.at>
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: Initialize datum before calling
 map_word_load_partial
Message-ID: <20150527195623.GJ27753@ld-irv-0074>
References: <1427837363-2782-1-git-send-email-christian.riesch@omicron.at>
 <20150507070256.GF6055@norris-Latitude-E6410>
 <CABkLObrEFNF9xwyxvJzy5tp+NaTZg_Ngws-Zryvv3bXS24VVNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABkLObrEFNF9xwyxvJzy5tp+NaTZg_Ngws-Zryvv3bXS24VVNg@mail.gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Christian,

On Thu, May 07, 2015 at 12:32:03PM +0200, Christian Riesch wrote:
> On Thu, May 7, 2015 at 9:02 AM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> > On Tue, Mar 31, 2015 at 11:29:22PM +0200, Christian Riesch wrote:
> >> In do_otp_write we must initialize the variable datum before calling
> >> map_word_load_partial. Otherwise the upper bits of datum may be undefined,
> >> which later causes problems in chip_good called by do_write_oneword.
> >
> > Hmm, are you sure this is actually the problem? It looks to me like the
> > logic for the "partial write of a word, load old contents" block means
> > that we *will* initialize datum with old contents, if we're not aligned.
> 
> That's right. But if we are aligned, datum will not be initialized, at
> least not in every case.
> 
> > So your initialization actually looks redundant.
> >
> > Or please help explain, if I'm wrong.
> 
> This is from do_otp_write():
[snip]
> Without initialization, unaligned writes work fine, whereas aligned writes fail.

OK, thanks for the more thorough explanation. Makes sense. Applied to
l2-mtd.git.

Brian
