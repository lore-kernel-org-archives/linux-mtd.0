Date: Wed, 24 Oct 2012 14:09:57 +0100
From: Will Deacon <will.deacon@arm.com>
To: Bastian Hecht <hechtb@googlemail.com>
Subject: Re: Possible regression in arm/io.h
Message-ID: <20121024130957.GB7339@mudshark.cambridge.arm.com>
References: <CABYn4syj0GZAsDYVQfXg_qKAFkbrxPLoZWpKRzwf3gfRkMGZkQ@mail.gmail.com>
 <20121024105223.GC23775@mudshark.cambridge.arm.com>
 <CABYn4swp9JBEHgGTOkoe=tOh3Mf1dq5WYr=2xuKNpTmLX5LcFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABYn4swp9JBEHgGTOkoe=tOh3Mf1dq5WYr=2xuKNpTmLX5LcFQ@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 24, 2012 at 01:34:18PM +0100, Bastian Hecht wrote:
> 2012/10/24 Will Deacon <will.deacon@arm.com>:
> > It sounds like we need to:
> >
> >         (a) Understand what has changed in GCC to cause this error to start
> >             cropping up.
> >
> >         (b) Have a look at the impact of using only "Q" on the generated
> >             code (especially register usage for the address).
> >
> 
> Uff... I've just started to write ARM assembly and have no practical
> experience with the inner workings of real world compilers. So this
> time I'm afraid I was just good enough to report this. It sounds
> interesting to hunt it, but would take ages for me at this point.

Ok, I'll have a look at the impact of moving exclusively to "Q" when I get a
chance. Which toolchain are you using?

Will
