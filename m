Received: from rcdn-iport-3.cisco.com ([173.37.86.74])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKTOx-0001PB-44
 for linux-mtd@lists.infradead.org; Wed, 07 Nov 2018 19:22:07 +0000
Date: Wed, 7 Nov 2018 11:21:45 -0800
From: Daniel Walker <danielwa@cisco.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Joakim Tjernlund <joakim.tjernlund@infinera.com>,
 "nkela@cisco.com" <nkela@cisco.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "xe-linux-external@cisco.com" <xe-linux-external@cisco.com>
Subject: Re: [PATCH] jffs2: implement mount option to configure endianness
Message-ID: <20181107192131.tf5ptjiccne3tzmq@zorba>
References: <20181106214928.40020-1-nkela@cisco.com>
 <921b0f78cf67d7307a0555e1fd6f2c2976310adc.camel@infradead.org>
 <1e4c066d1896e2a0b8b146253d34d05cc4f9ab36.camel@infinera.com>
 <8b08e8b992093453bb2b9caff8cff08c.squirrel@twosheds.infradead.org>
 <20181107173303.slnb3i2d6ufaonp7@zorba>
 <df9cdf1753ec7e6e20c12aa096b98453.squirrel@twosheds.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df9cdf1753ec7e6e20c12aa096b98453.squirrel@twosheds.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 07, 2018 at 05:58:53PM -0000, David Woodhouse wrote:
> 
> > On Wed, Nov 07, 2018 at 04:12:14PM -0000, David Woodhouse wrote:
> >>
> >> > Yes, this may slow things down. I am not sure I agree with the impl.
> >> > either.
> >> > Could one not make cpu_to_je_X/jeX_to_cpu a function ptr which is set
> >> to
> >> > a func. with the correct endian?
> >>
> >> On x86 retpoline would make that quite slow.
> >
> > Is x86 the largest consumer of jffs2 ?
> 
> Certainly not. I'm not sure which architectures do have Spectre V2
> mitigations which make indirect branches expensive now... perhaps there is
> no intersection with the cases where we really care about JFFS2 being
> CPU-bound?


How about we add the Kconfig option to enable the mount option. So if you enable
to mount option your accepting the performance impact and we'll note that in the
Kconfig description. Then we can do the performance testing in time, and maybe
make this always on at some later time when the performance impact is better
understood ?

We could also add likely()/unlikely() cause that's easy enough.

Daniel
