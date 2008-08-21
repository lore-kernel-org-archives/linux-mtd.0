Received: from rn-out-0910.google.com ([64.233.170.187])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWBN2-0002XX-On
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 14:42:40 +0000
Received: by rn-out-0910.google.com with SMTP id m7so20539rnd.3
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Aug 2008 07:42:40 -0700 (PDT)
Message-ID: <6934efce0808210742v14a093e8vde31f9eea0555f99@mail.gmail.com>
Date: Thu, 21 Aug 2008 07:42:39 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Leon Woestenberg" <leon.woestenberg@gmail.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
In-Reply-To: <c384c5ea0808210731k17ccc836u60c4803c3abfea31@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48AD00C4.6060302@gmail.com> <20080821083916.GF5706@disturbed>
	<6934efce0808210719s6458dc77w2c0755a4bf90bf8a@mail.gmail.com>
	<c384c5ea0808210731k17ccc836u60c4803c3abfea31@mail.gmail.com>
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

> What if the use-case did not cover all cases of XIP use?
>
> If a compressed page is attempted to be executed, will the filesystem
> fall back to decompression to RAM and execution from RAM, or will this
> result in a faulty system?

No this will not result in a faulty system.  It is perfectly
acceptable to have all pages in a file XIP, no pages in a fill XIP,
and anywhere in between.

> The design choices look real good. Congrats on the achievement.

thanks!
