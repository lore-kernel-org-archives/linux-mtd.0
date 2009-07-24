Received: from mail2.gnudd.com ([213.203.150.91] helo=mail.gnudd.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MUK2J-0005JS-6x
	for linux-mtd@lists.infradead.org; Fri, 24 Jul 2009 12:38:12 +0000
Date: Fri, 24 Jul 2009 14:37:51 +0200
From: Alessandro Rubini <rubini-list@gnudd.com>
To: vimal.newwork@gmail.com
Subject: Re: [PATCH V5 1/2] Nand driver for Nomadik 8815 SoC (on NHK8815 board)
Message-ID: <20090724123750.GA25563@mail.gnudd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Sender: rubini-list@gnudd.com
In-Reply-To: <ce9ab5790907240510y752885b9m2debac82bbdd7401@mail.gmail.com>
References: <ce9ab5790907240510y752885b9m2debac82bbdd7401@mail.gmail.com>
	<cover.1248434635.git.rubini@unipv.it>
	<50ed4996479c95b93714ac814608d5f0db85238d.1248434636.git.rubini@unip
	v.it>
Cc: STEricsson_nomadik_linux@list.st.com, linux-mtd@lists.infradead.org,
	rubini-list@gnudd.com, linux@arm.linux.org.uk, andrea.gallo@stericsson.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Please run ''checkpatch.pl' for this patch and try to fix the errors.

Ok, will do. Although I don't agree with everything checkpatch is
saying (I've heard checkpatch is meant as suggestions, to be
considered but not applied blindly, so I behaved accordingly).

> this can be 'NAND_ECC_SOFT' here... then

As explained in the comments above, there is the hardware in there,
only I've not been able to use it yet. So I prefer to stay HW and then
change as little as possible.  But, unless you confirm I can do that,
I'll write SOFT in there as requested.

Will repost on monday, I'm off for the weekend.

/alessandro
