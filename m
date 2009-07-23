Received: from mail2.gnudd.com ([213.203.150.91] helo=mail.gnudd.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MTsIN-0001qD-T3
	for linux-mtd@lists.infradead.org; Thu, 23 Jul 2009 07:00:57 +0000
Date: Thu, 23 Jul 2009 08:59:22 +0200
From: Alessandro Rubini <rubini-list@gnudd.com>
To: vimal.newwork@gmail.com
Subject: Re: [PATCH V4 1/2] Nand driver for Nomadik 8815 SoC (on NHK8815 board)
Message-ID: <20090723065922.GA22450@mail.gnudd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Sender: rubini-list@gnudd.com
In-Reply-To: <ce9ab5790907222130o2f1d704u199fbf7f1435e74f@mail.gmail.com>
References: <ce9ab5790907222130o2f1d704u199fbf7f1435e74f@mail.gmail.com>
	<cover.1248300341.git.rubini@unipv.it>
	<cae21cf16cad72ef35ce7e8cc3effe25b497924e.1248300341.git.rubini@unip
	v.it>
Cc: STEricsson_nomadik_linux@list.st.com, linux@arm.linux.org.uk,
	linux-mtd@lists.infradead.org, andrea.gallo@stericsson.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 'nand_calculate_ecc' and 'nand_correct_data' (nand_ecc.c) do it in SW.
> This need not to be re-do.

When I initially tried soft ecc it didn't work, so I thought ours was
a different algorithm. Most likely I was wrong, I'll recheck ASAP.

> We should not write multiple statements in single line needlessly.

I didn't want to waste a whole screenfull for a burst of similar
error checks. (I still don't want, but I'll obey to the request).

/alessandro
