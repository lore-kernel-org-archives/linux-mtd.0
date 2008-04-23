Received: from wf-out-1314.google.com ([209.85.200.168])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Joax4-0005gf-N9
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 09:07:43 +0000
Received: by wf-out-1314.google.com with SMTP id 29so1977556wff.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Apr 2008 02:07:41 -0700 (PDT)
Message-ID: <bae050c10804230207s79902591l8a977881d89e48c3@mail.gmail.com>
Date: Wed, 23 Apr 2008 17:07:41 +0800
From: Nancy <nancydreaming@gmail.com>
To: dedekind@infradead.org
Subject: Re: [RFC] slight UBI scan time improvement
In-Reply-To: <1208938571.11721.38.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1208882552.11721.13.camel@sauron>
	<bae050c10804230015r50b7747apef8b1d8cab302c9a@mail.gmail.com>
	<1208935971.11721.20.camel@sauron>
	<bae050c10804230101m64bc2558icf9a5ad7efb8c824@mail.gmail.com>
	<1208938571.11721.38.camel@sauron>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/23/08, Artem Bityutskiy <dedekind@infradead.org> wrote:
> On Wed, 2008-04-23 at 16:01 +0800, Nancy wrote:
> >     Yes, the issue is go away by properly use MLC nand.
> >     But the write fail issue in UBI still exist! Suppose you are
> > properly used your Nand, when it return write fail, but can erase
> > successfully, UBI still group this block in good block heap. That is
> > wrong and dangerous.
>
> The driver may return I/O errors for many reasons, including bugs in the
> driver. Or this may be an dumb user who screwed up his flash. It might
> be something else. We do not wand to mark the eraseblock bad when it is
> _not_ bad.
>
> And it's not just erase successfully. We torture the eraseblock. We
> erase it, read it back, check it has all 0xFFs, then write 0xA5 pattern,
> read it back, check, erase again, read back, check, write 0x5A pattern,
> read back, check, erase, read back, check, write 0x00 pattern, read
> back, check, erase, read back check. Enough? If it is not enough, feel
> free to send a patch for better torturing.
>
> Please, refer the torture_peb() function for more details.
>
> So, we do not mark eraseblock as bad if it passed the torture test.
> Note, a bit-flip during torture test is enough to mark the eraseblock
> bad as well.
>
> In your particular case, you would have _all_ eraseblocks marked as bad
> if UBI did what you want.

Torure is enough : )
Will you please explain why pattern 0x00 is not enough, it still need
0xA5 and 0x5A. What these information come from? Thanks in advance.



-- 
Best wishes,
Nancy
