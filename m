From: David Woodhouse <dwmw2@infradead.org>
To: Ralph Siemsen <rsiemsen@rossvideo.com>
In-Reply-To: <4433F9FE.7020501@rossvideo.com>
References: <4433E9A1.1030807@netwinder.org>
	<1144254468.6227.84.camel@pmac.infradead.org>
	<4433F9FE.7020501@rossvideo.com>
Content-Type: text/plain
Date: Wed, 05 Apr 2006 18:27:38 +0100
Message-Id: <1144258058.6227.90.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: FAQ entry for loopback mounting
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-04-05 at 13:10 -0400, Ralph Siemsen wrote:
> I misread the code a bit.  "Mi" and "Gi" should in fact work (I didn't 
> try them), having been bitten repeatedly by neither "k" or "kB" working 
> as one might have (naviely) expected.  Yes I know the "i" thing is SI 
> standard but the old "be leniant in what you accept" policy really 
> should apply imho.

We _are_ being lenient. If you say 'k' or 'M' instead of 'Ki' or 'Mi'
then you are going to get the powers of ten which you asked for... which
is almost certainly _not_ what you wanted. Giving you powers of two is
not an option. So it's best not to accept it at all.

-- 
dwmw2
