Subject: Re: m25p80 : chip not supporting OPCODE_BE
From: David Woodhouse <dwmw2@infradead.org>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <49F72BBB.7020207@parrot.com>
References: <4941418F.2070802@parrot.com>  <49F72BBB.7020207@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 08 May 2009 13:55:26 +0100
Message-Id: <1241787326.19381.70.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-04-28 at 18:15 +0200, Matthieu CASTET wrote:
> Matthieu CASTET a écrit :
> > Hi,
> > 
> > it seems the m45peXX flash are not supporting OPCODE_BE command [1].
> > Shouldn't we add a flag to avoid to issue such command on such flash ?
> > 
> > 
> > 
> > Matthieu
> > 
> > [1]
> > http://www.numonyx.com/Documents/Datasheets/M45PE80.pdf
> > 
> 
> ping

Would seem sensible... got a patch?

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
