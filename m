Received: from nz-out-0102.google.com ([64.233.162.202])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GI9Pp-0002pO-Up
	for linux-mtd@lists.infradead.org; Tue, 29 Aug 2006 20:38:31 +0100
Received: by nz-out-0102.google.com with SMTP id s1so2506307nze
	for <linux-mtd@lists.infradead.org>;
	Tue, 29 Aug 2006 12:37:28 -0700 (PDT)
Message-ID: <6934efce0608291237m7779c57dj23ebc8435c8f43ea@mail.gmail.com>
Date: Tue, 29 Aug 2006 12:37:28 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Josh Boyer" <jdub@us.ibm.com>
Subject: Re: [PATCH] CORE: adding mtd_get_partition_physaddr()
In-Reply-To: <1156871627.2003.15.camel@zod.rchland.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <6934efce0608282144ge2250dbv1635377c005a9f74@mail.gmail.com>
	<1156871627.2003.15.camel@zod.rchland.ibm.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > +void * mtd_get_partition_physaddr (struct mtd_info *mtd)
>
> Nit: No space between the paren and the function name please.

oops

> > +extern void * mtd_get_partition_physaddr(struct mtd_info *mtd);
>
> Couldn't this be a proper prototype instead of an extern?

I thought EXPORT_SYMBOL_GPL()  implied it should be extern.  Is that incorrect?
