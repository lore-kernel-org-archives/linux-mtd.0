Received: from wa-out-1112.google.com ([209.85.146.182])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWB0q-0000BH-2j
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 14:19:44 +0000
Received: by wa-out-1112.google.com with SMTP id v33so4053wah.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Aug 2008 07:19:43 -0700 (PDT)
Message-ID: <6934efce0808210719s6458dc77w2c0755a4bf90bf8a@mail.gmail.com>
Date: Thu, 21 Aug 2008 07:19:43 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Jared Hulbert" <jaredeh@gmail.com>, Linux-kernel@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>,
	"=?UTF-8?Q?J=C3=B6rn_Engel?=" <joern@logfs.org>,
	tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
In-Reply-To: <20080821083916.GF5706@disturbed>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48AD00C4.6060302@gmail.com> <20080821083916.GF5706@disturbed>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> FWIW, I'm not sure it's a good idea to name this new filesystem AXFS.
> People are almost certainly going to confuse it with XFS despite
> the filesystems being aimed at diammetrically opposed ends of the
> storage spectrum. ;)

In principle I think you are right.  AXFS and XFS are similar names
and it could lead to confusion.  I think XFS should change its name to
prevent confusion.  I think by 2 years AXFS will be used in orders of
magnitude more machines anyway.  ;)

About opposite end of the spectrum...  Carsten just said AXFS might be
nice for s390, so I'm not sure how true that is.

I'm kind of attached to the name now.
