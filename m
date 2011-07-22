Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QkAz6-0001Tf-1x
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2011 08:21:24 +0000
Received: by pzk1 with SMTP id 1so3322023pzk.16
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Jul 2011 01:21:21 -0700 (PDT)
Subject: Re: UBIFS support for SLC and MLC
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
Date: Fri, 22 Jul 2011 11:22:37 +0300
In-Reply-To: <CAPBSBxqEzqkMV=1zJgmfsjO+OF2AQ3j+wpmhn1F+b_ZE6QYZug@mail.gmail.com>
References: <CAJcvjphp3Cjew0=P6LWQ05Hb6HWpPy3D2FOBd8J5KwVGQpwcwA@mail.gmail.com>
	<CAPBSBxqEzqkMV=1zJgmfsjO+OF2AQ3j+wpmhn1F+b_ZE6QYZug@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1311322961.20707.12.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, John <jtburch62@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-07-20 at 18:17 -0400, Matthew L. Creech wrote:
> On Wed, Jul 20, 2011 at 4:53 PM, John <jtburch62@gmail.com> wrote:
> > I'm exploring flash memory technology for a new product and am
> > confused about whether UBIFS fully supports SLC and MLC NAND.  When I
> > read the FAQ at
> > http://www.linux-mtd.infradead.org/faq/ubifs.html#L_ubifs_mlc, it
> > states that one of the two aspects of MLC that are not supported is
> > "program disturb".  However, the document link referenced in the same
> > FAQ (http://www.linux-mtd.infradead.org/faq/ubifs.html#L_ubifs_mlc)
> > states that "program disturb" is common to both SLC and MLC - just at
> > different error rates.
> >
> > 1.  How does UBIFS address the "program disturb" effect in SLC NAND?
> >
> > 2.  Why doesn't the FAQs explanation for how UBIFS handles "read
> > disturb" apply to "program disturb"?
> >
> 
> I think the first "read disturb" that is discussed in the FAQ is a
> rather specific case: repeated READs of a page cause bit-flips on that
> same page.  The solution is simply to correct the block on-flash
> ("scrub" it) whenever a bit-flip is detected.

Matthew, John, to make sure this good conversation is not lost in the
mailing list archives, it would be great to amend the FAQ by sending a
patch against mtd-www: git://git.infradead.org/mtd-www.git

It is quite trivial to change it.

-- 
Best Regards,
Artem Bityutskiy
