Received: from mail2.gnudd.com ([213.203.150.91] helo=mail.gnudd.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MTv3C-0003DE-Sw
	for linux-mtd@lists.infradead.org; Thu, 23 Jul 2009 09:57:27 +0000
Date: Thu, 23 Jul 2009 11:57:12 +0200
From: Alessandro Rubini <rubini-list@gnudd.com>
To: vimal.newwork@gmail.com
Subject: Re: [PATCH V4 1/2] Nand driver for Nomadik 8815 SoC (on NHK8815 board)
Message-ID: <20090723095712.GA26414@mail.gnudd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Sender: rubini-list@gnudd.com
In-Reply-To: <ce9ab5790907230249s25a66deeh1bb2ffec73187719@mail.gmail.com>
References: <ce9ab5790907230249s25a66deeh1bb2ffec73187719@mail.gmail.com>
	<ce9ab5790907222130o2f1d704u199fbf7f1435e74f@mail.gmail.com>
	<cover.1248300341.git.rubini@unipv.it>
	<20090723065922.GA22450@mail.gnudd.com>
	<20090723090730.GA24918@mail.gnudd.com>
Cc: STEricsson_nomadik_linux@list.st.com, linux-mtd@lists.infradead.org,
	linux@arm.linux.org.uk, andrea.gallo@stericsson.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> So, the standard procedure is not compatible with data already in
>> flash (written with the older u-boot and kernel provided by the vendor
>> with the kit).
> 
> No, Its just byte order. Try enabling 'CONFIG_MTD_NAND_ECC_SMC' in your configs.
> It should work fine.

Yes, it does. Didn't notice it, thanks. I'll resubmit tomorrow.

/alessandro
