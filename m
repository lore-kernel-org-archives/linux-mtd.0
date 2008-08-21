Received: from yx-out-1718.google.com ([74.125.44.155])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWAuX-00051F-Ed
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 14:13:13 +0000
Received: by yx-out-1718.google.com with SMTP id 3so431yxi.72
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Aug 2008 07:13:12 -0700 (PDT)
Message-ID: <6934efce0808210713m220d2a6cje06a2dc51c4a857a@mail.gmail.com>
Date: Thu, 21 Aug 2008 07:13:12 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Nick Piggin" <nickpiggin@yahoo.com.au>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
In-Reply-To: <200808212043.51209.nickpiggin@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48AD00C4.6060302@gmail.com> <48AD42AE.4030107@de.ibm.com>
	<200808212043.51209.nickpiggin@yahoo.com.au>
Cc: linux-embedded@vger.kernel.org, carsteno@de.ibm.com,
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

> Agreed. I haven't had a good look through it yet, but at a glance it
> looks pretty neat. The VM side of things looks pretty reasonable
> (I fear XIP faulting might have another race or two, but that's a
> core mm issue rather than filesystem specific).

How might I design a test to flush those bugs out?  We haven't seen any.
