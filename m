Received: from recycle.lbl.gov ([131.243.169.124])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15w3j6-0001gj-00
	for <linux-mtd@lists.infradead.org>; Tue, 23 Oct 2001 16:44:24 +0100
Message-ID: <20011023085329.A144@recycle.lbl.gov>
Date: Tue, 23 Oct 2001 08:53:29 -0700
From: Larry Doolittle <ldoolitt@recycle.lbl.gov>
To: "Kremer, Alex" <alex.kremer@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: MTD support for Intel E28F016S3 ?
References: <7C0E66E1B97BD5119B120002A50A63D22E41C9@hasmsx101.iil.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <7C0E66E1B97BD5119B120002A50A63D22E41C9@hasmsx101.iil.intel.com>; from Kremer, Alex on Tue, Oct 23, 2001 at 10:03:06AM +0200
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tue, Oct 23, 2001 at 10:03:06AM +0200, Kremer, Alex wrote:
> | From: Larry Doolittle [mailto:ldoolitt@recycle.lbl.gov]
> | 
> | One weird effect showed up using the 28F320B3B on a nanoEngine, where
> | the CFI detect code "found" the chip, [ chop ]
> 
> This is strange, I have TE28F320B3B mapped over dc21285 and the cfi_probe
> first, jedec_probe after works fine...

All I know is, I saw the "QRY" probe respond loud and clear from this
chip, but the CFI data structure that the mtd code then picked up was
garbage.  The package is marked
   TE28F320
   B3BA110
   U9360221A
   (U)(C)1998

I got a private e-mail from a Mr. Conley at Intel which said there is
"a problem with some of the B3s that the CFI command comes back with
information that is an invalid C3 information block."  He hoped to
get more information and pass it on.

    - Larry
