Received: from rv-out-0708.google.com ([209.85.198.243])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWeqf-0003vl-Kw
	for linux-mtd@lists.infradead.org; Fri, 22 Aug 2008 22:11:14 +0000
Received: by rv-out-0708.google.com with SMTP id b17so579002rvf.42
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Aug 2008 15:11:11 -0700 (PDT)
Message-ID: <48AF3905.70304@gmail.com>
Date: Fri, 22 Aug 2008 15:09:09 -0700
From: Will Marone <wjmarone@gmail.com>
MIME-Version: 1.0
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
References: <48AD00C4.6060302@gmail.com>
	<Pine.LNX.4.64.0808221650500.17105@vixen.sonytel.be>
In-Reply-To: <Pine.LNX.4.64.0808221650500.17105@vixen.sonytel.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-embedded@vger.kernel.org,
	=?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@AM.SONY.COM
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Geert Uytterhoeven wrote:
> I gave AxFS a try on PS3 (ppc64, always use big-endian 64-bit for testing new
> code ;-).
> When mounting the image, I got the crash below:
>
> | attempt to access beyond end of device
> | loop0: rw=0, want=4920, limit=4912
> | Unable to handle kernel paging request for data at address 0x00000028
> | Faulting instruction address: 0xd000000000037988
> | Oops: Kernel access of bad area, sig: 11 [#1]
> | SMP NR_CPUS=2 PS3
>
> When mounting (also on PS3) an image created on ia32, I get a different crash:
>
> | axfs: wrong magic
>   ^^^^^^^^^^^^^^^^^
> | Unable to handle kernel paging request for data at address 0x000003a8
> | Faulting instruction address: 0xd0000000000355f0
> | Oops: Kernel access of bad area, sig: 11 [#1]
> | SMP NR_CPUS=2 PS
Geert,

Thanks for giving it a spin, especially on a platform as different from 
ours as the PS3.

Before I dig more into what happened, I was wondering if you could tell 
me a bit more
about your environment, particularly how you supplied the filesystem to 
the kernel and
your mount commandline (also, if you used a boot commandline, what it was.)

My first guess would be a ppc64 compiled UML session, but I'd like to be 
a bit more sure.


Will Marone
