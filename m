From: David Woodhouse <dwmw2@infradead.org>
To: Kalev Lember <kalev@colleduc.ee>
In-Reply-To: <Pine.LNX.4.44.0410111519200.15371-100000@kiire.colleduc.ee>
References: <Pine.LNX.4.44.0410111519200.15371-100000@kiire.colleduc.ee>
Content-Type: text/plain
Message-Id: <1097497518.318.285.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 11 Oct 2004 13:25:18 +0100
Content-Transfer-Encoding: 7bit
Cc: Nicolas Pouillon <nipo@ssji.net>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]Probing at 0x0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-10-11 at 15:23 +0300, Kalev Lember wrote:
> On Fri, 8 Oct 2004, David Woodhouse wrote:
> 
> > On Fri, 2004-10-08 at 21:28 +0300, Kalev Lember wrote:
> > > No, it is not supported. According to 
> > > http://www.tri-m.com/products/msystems/files/specs/mddoc_spec.pdf the 32 
> > > MB Millennium Plus has 16 bit data bus while the supported 16 MB Mil+ 
> > > has 8 bit bus.
> > 
> > I think you can use it in 8-bit mode too though. The old doc2001plus
> > driver handled them both, didn't it?
> 
> I think you are right. It did handle both of them in 8-bit mode.
> I believe that if we are going to use 32 MB devices in 8-bit mode, we must 
> deal with the interleaving crap, right?

I think so, yes.

-- 
dwmw2
