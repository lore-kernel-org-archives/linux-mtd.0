Received: from yx-out-1718.google.com ([74.125.44.154])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWbBO-0004BB-7o
	for linux-mtd@lists.infradead.org; Fri, 22 Aug 2008 18:16:22 +0000
Received: by yx-out-1718.google.com with SMTP id 3so406709yxi.72
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Aug 2008 11:16:21 -0700 (PDT)
Message-ID: <6934efce0808221116w76a662b0t954b0922b69d3232@mail.gmail.com>
Date: Fri, 22 Aug 2008 11:16:20 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Jamie Lokier" <jamie@shareable.org>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
In-Reply-To: <20080822181314.GB24179@shareable.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48AD00C4.6060302@gmail.com> <20080821110749.GA1926@shareable.org>
	<6934efce0808210711t686a88eci6eb294dbb54d68fe@mail.gmail.com>
	<48AE0476.80109@snapgear.com> <20080822181314.GB24179@shareable.org>
Cc: cotte@de.ibm.com, Greg Ungerer <gerg@snapgear.com>,
	linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
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

On Fri, Aug 22, 2008 at 11:13 AM, Jamie Lokier <jamie@shareable.org> wrote:
> Greg Ungerer wrote:
>> One thing for sure is that many people who do non-MMU setups
>> are interested in XIP to get the space savings. These are very
>> often small devices with very constrained RAM and flash. (For
>> whatever it is worth single NOR flash only boards are common in
>> these smaller form factors :-)
>
> I'm using XIP on a device with 32MB RAM.  The reason I use it is
> _partly_ to save RAM, partly because programs start about 10 times
> faster (reading NOR flash is slow and I keep the XIP region in RAM)

What kind of NOR you using?  That is not what I measure with fast
synchronous burst NOR's.
