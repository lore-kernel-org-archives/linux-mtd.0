Received: from moutng.kundenserver.de ([212.227.126.186])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JKvaB-00012U-Rm
	for linux-mtd@lists.infradead.org; Fri, 01 Feb 2008 13:05:35 +0000
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org, Anton Vorontsov <avorontsov@ru.mvista.com>
Subject: Re: [PATCH] physmap-concat map platform driver
Date: Fri, 1 Feb 2008 14:05:05 +0100
References: <20070526002925.GB801@zarina>
	<20070531212749.GR26191@xi.wantstofly.org>
	<20070531215838.GA1603@zarina>
In-Reply-To: <20070531215838.GA1603@zarina>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200802011405.05999.sr@denx.de>
Cc: Lennert Buytenhek <buytenh@wantstofly.org>, kernel-discuss@handhelds.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Anton,

On Thursday 31 May 2007, Anton Vorontsov wrote:
> > Maybe it makes more sense to add that support to physmap
> > instead?
>
> Well.. more easier solution would be merging physmap-concat to physmap,
> trying make physmap-concat platform_data-compatible.
>
> I can try implement that.

Did you make any progress here? Just checking, since I have the same problem 
supporting the Intel 48F4400 which consists of two non-identical NOR chips 
with different geometries. If you don't have anything yet, I'll come up with 
a patch to extend the physmap driver to support multiple regions.

Thanks.

Best regards,
Stefan
