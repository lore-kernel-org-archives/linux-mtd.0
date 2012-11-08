Received: from mtxmxout1.matrox.com ([138.11.2.91])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TWXd4-0002Gs-7p
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2012 19:19:07 +0000
Date: Thu, 8 Nov 2012 14:22:50 -0500
From: Christopher Harvey <charvey@matrox.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: Re: state of support for "external ECC hardware"
Message-ID: <20121108192250.GU2389@harvey-pc.matrox.com>
References: <20121029204227.GA32300@harvey-pc.matrox.com>
 <509B9143.4020506@keymile.com>
 <20121108152125.GR2389@harvey-pc.matrox.com>
 <20121108185942.GC28118@parrot.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20121108185942.GC28118@parrot.com>
Cc: "stefan.bigler@keymile.com" <stefan.bigler@keymile.com>, "Brunck,
 Holger" <Holger.Brunck@keymile.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Gerlando Falauto <gerlando.falauto@keymile.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 08, 2012 at 07:59:42PM +0100, Ivan Djelic wrote:
> On Thu, Nov 08, 2012 at 03:21:25PM +0000, Christopher Harvey wrote:
> (...) 
> > We had BCH8 code running, but it wasn't enough. The main reason we
> > switched away from host side ECC was because we were getting bitflips
> > within the ECC codeword data itself.
> 
> But the ECC bytes are part of the BCH codeword, therefore I don't understand
> what the issue could be ? Are you sure bitflips were not in some unprotected
> OOB area ?

Ok, the ECC bytes I had were stored in the OOB area and were
unprotected. Any bit flips in the OOB area was a disaster. This was
coming from a heavily modified forked kernel that had BCH8 bugs in the
past. For example, I had to fix this one before the patch came out:
http://arago-project.org/git/projects/linux-omap3.git?p=projects/linux-omap3.git;a=commitdiff;h=adc46d691d745604da1197d154fe712e10ec468d;hp=9e78267ed6302537474489e88bd59827315db15b
I can't explain why this implementation fails on ECC byte corruption.

-Chris
