Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QIMpa-0000Zc-6X
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 15:20:38 +0000
Received: by eyh6 with SMTP id 6so1129264eyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 May 2011 08:20:36 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] ubifs: add ubifs_fixup_free_space()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <BANLkTikgYvy9Dk8NXnmUP+1bWAjfoB-LVw@mail.gmail.com>
References: <BANLkTinVHD1QYpqSTG0_WcLy-aA1ere34g@mail.gmail.com>
	<1304694168.7222.68.camel@localhost>
	<BANLkTikgYvy9Dk8NXnmUP+1bWAjfoB-LVw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 06 May 2011 18:17:05 +0300
Message-ID: <1304695025.7222.76.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-05-06 at 11:18 -0400, Matthew L. Creech wrote:
> On Fri, May 6, 2011 at 11:02 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> >> +
> >> +     ubifs_assert(len >= 0);
> >> +     ubifs_assert(len % c->min_io_size == 0);
> >
> > So if this is true.
> >
> >> +
> >> +     /* Pad if necessary */
> >> +     aligned_len = ALIGN(len, c->min_io_size);
> >> +     if (aligned_len > len) {
> >
> > This will be always false and the below code can be removed, right?
> >
> 
> Oh, yes you're right - I added it before you had mentioned that the
> lengths would be min_io_size-aligned.  :)  Thanks

I think I killed this in the version of this patch I sent you, I
encourage you to take it as the base for you next version of the
patch-set.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
