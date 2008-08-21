Received: from rn-out-0910.google.com ([64.233.170.188])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWBFy-0003vC-O4
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 14:35:22 +0000
Received: by rn-out-0910.google.com with SMTP id m7so18213rnd.3
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Aug 2008 07:35:22 -0700 (PDT)
Message-ID: <6934efce0808210735w479075abga9f660e42ab8935d@mail.gmail.com>
Date: Thu, 21 Aug 2008 07:35:21 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Geert Uytterhoeven" <Geert.Uytterhoeven@sonycom.com>
Subject: Re: [PATCH 10/10] AXFS: axfs_uncompress.c
In-Reply-To: <Pine.LNX.4.64.0808211423360.20704@vixen.sonytel.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48AD0126.1050609@gmail.com> <1219318838.18027.68.camel@sauron>
	<Pine.LNX.4.64.0808211423360.20704@vixen.sonytel.be>
Cc: cotte@de.ibm.com, linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	=?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> If you want support for multiple decompression algorithms, you can switch
> from using zlib_inflate*() directly to calling zlib through the crypto API.
> Then you can call crypto_alloc_comp() with the correct decompression algorithm
> name.
>
> For squashfs, I had to modify only ca. 40 lines of code.

I definately want to support multiple formats.  I have a flag in the
superblock all ready to go for that.  One problem.  I'm not sure how
to do it.  Can you point us to some reference code?
