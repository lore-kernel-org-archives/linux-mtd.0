Date: Thu, 8 Nov 2018 07:25:30 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: "danielwa@cisco.com" <danielwa@cisco.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nkela@cisco.com" <nkela@cisco.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "xe-linux-external@cisco.com" <xe-linux-external@cisco.com>
Subject: Re: [PATCH] jffs2: implement mount option to configure endianness
Message-ID: <20181108152530.GA27198@infradead.org>
References: <20181106214928.40020-1-nkela@cisco.com>
 <921b0f78cf67d7307a0555e1fd6f2c2976310adc.camel@infradead.org>
 <1e4c066d1896e2a0b8b146253d34d05cc4f9ab36.camel@infinera.com>
 <8b08e8b992093453bb2b9caff8cff08c.squirrel@twosheds.infradead.org>
 <20181107173303.slnb3i2d6ufaonp7@zorba>
 <df9cdf1753ec7e6e20c12aa096b98453.squirrel@twosheds.infradead.org>
 <bee96cb5db73c325675881b180006e1382718abe.camel@infinera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bee96cb5db73c325675881b180006e1382718abe.camel@infinera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 07, 2018 at 06:41:47PM +0000, Joakim Tjernlund wrote:
> > Certainly not. I'm not sure which architectures do have Spectre V2
> > mitigations which make indirect branches expensive now... perhaps there is
> > no intersection with the cases where we really care about JFFS2 being
> > CPU-bound?
> 
> All that passing of a new extra arg and extra if .. elif .. does cost too.

I know of no current microarchitecture where an indirect call is cheaper
than a simple branch, which can be very well predicted.
