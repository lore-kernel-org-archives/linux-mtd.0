Message-ID: <44340038.3000602@netwinder.org>
Date: Wed, 05 Apr 2006 13:36:56 -0400
From: Ralph Siemsen <ralphs@netwinder.org>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <4433E9A1.1030807@netwinder.org>	
	<1144254468.6227.84.camel@pmac.infradead.org>	
	<4433F9FE.7020501@rossvideo.com>
	<1144258058.6227.90.camel@pmac.infradead.org>
In-Reply-To: <1144258058.6227.90.camel@pmac.infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

David Woodhouse wrote:

> We _are_ being lenient. If you say 'k' or 'M' instead of 'Ki' or 'Mi'
> then you are going to get the powers of ten which you asked for... which
> is almost certainly _not_ what you wanted. Giving you powers of two is
> not an option. So it's best not to accept it at all.

No, if you give it "k" only, then it multiples by 1024, but because 
there is no "i", it does not advance *endp, and then parse_num() returns 
-EINVAL because it sees trailing garbage.  So just "k" is not accepted 
at all, which is not "leniant" in my books.

-R
