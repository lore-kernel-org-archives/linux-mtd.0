Received: from rn-out-0910.google.com ([64.233.170.189])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWGPw-0003sf-Vt
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 20:06:01 +0000
Received: by rn-out-0910.google.com with SMTP id m7so114688rnd.3
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Aug 2008 13:06:00 -0700 (PDT)
Message-ID: <6934efce0808211305j349dc0fbo1cb122c0c5159ac0@mail.gmail.com>
Date: Thu, 21 Aug 2008 13:05:59 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH 03/10] AXFS: axfs.h
In-Reply-To: <200808211331.36346.arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48AD00E6.2070505@gmail.com> <200808211331.36346.arnd@arndb.de>
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

>> +#define AXFS_PAGE_SIZE 4096
>
> What happens on systems where AXFS_PAGE_SIZE != PAGE_SIZE?

Right now, bad things I imagine.  I meant to revisit this, there was
some reason during development for this, I don't remember.  No reason
for AXFS_PAGE_SIZE I think.
