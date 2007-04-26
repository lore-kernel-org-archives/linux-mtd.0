Subject: Re: OOPS at mount
From: David Woodhouse <dwmw2@infradead.org>
To: joakim.tjernlund@transmode.se
In-Reply-To: <1177591404.8841.18.camel@gentoo-jocke.transmode.se>
References: <1177513779.5073.9.camel@gentoo-jocke.transmode.se>
	<1177514597.2755.251.camel@pmac.infradead.org>
	<1177515648.5073.14.camel@gentoo-jocke.transmode.se>
	<1177515855.2755.252.camel@pmac.infradead.org>
	<1177516583.5073.22.camel@gentoo-jocke.transmode.se>
	<1177517258.2755.261.camel@pmac.infradead.org>
	<1177522774.28488.4.camel@gentoo-jocke.transmode.se>
	<1177587937.8841.13.camel@gentoo-jocke.transmode.se>
	<1177590673.2755.369.camel@pmac.infradead.org>
	<1177591404.8841.18.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Date: Thu, 26 Apr 2007 13:49:41 +0100
Message-Id: <1177591781.2755.373.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-04-26 at 14:43 +0200, Joakim Tjernlund wrote:
> I get this:
> Node at 20830232 is ino #26d7, version 2. Range 0x0-0x1000, isize 4096
> Node at 20832264 is ino #26d7, version 3. Range 0x1000-0x2000, isize 8192
> Node at 20833744 is ino #26d7, version 4. Range 0x2000-0x3000, isize 12288
> Node at 20834972 is ino #26d7, version 5. Range 0x3000-0x4000, isize 16384
> Node at 46094176 is ino #26d7, version 1172. Range 0x0-0x0, isize 16384 

Right.... and do you still get that complaint about truncation?

-- 
dwmw2
