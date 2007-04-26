Subject: Re: OOPS at mount
From: David Woodhouse <dwmw2@infradead.org>
To: joakim.tjernlund@transmode.se
In-Reply-To: <1177598252.8841.49.camel@gentoo-jocke.transmode.se>
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
	<1177591781.2755.373.camel@pmac.infradead.org>
	<1177592422.8841.24.camel@gentoo-jocke.transmode.se>
	<1177592932.2755.383.camel@pmac.infradead.org>
	<1177593184.8841.29.camel@gentoo-jocke.transmode.se>
	<1177593359.2755.386.camel@pmac.infradead.org>
	<1177594798.8841.37.camel@gentoo-jocke.transmode.se>
	<1177595075.2755.400.camel@pmac.infradead.org>
	<1177595567.8841.41.camel@gentoo-jocke.transmode.se>
	<1177595818.2755.411.camel@pmac.infradead.org>
	<1177598252.8841.49.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Date: Thu, 26 Apr 2007 20:39:22 +0100
Message-Id: <1177616362.2755.441.camel@pmac.infradead.org>
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

On Thu, 2007-04-26 at 16:37 +0200, Joakim Tjernlund wrote:
> Most pkg files seems OK, 
> pkg --list /tftpboot/download/cuappl02a-r8a-070425_2.powerpc.pkg
> is OK 
> but pkg --list cuappl02a-r8a-070221_10.powerpc.pkg 
> isn't, but thats an old file that could have been damaged earlier.

I strongly suspect it was deleted while you had summary support.

> I don't get any CRC errors on the restored image

That's expected. You'll only see those if you mount with summary
support. The summary leads the kernel to expect that those nodes are
valid, but in fact they've been marked obsolete.

-- 
dwmw2
