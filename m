From: David Woodhouse <dwmw2@infradead.org>
To: Robin Gilks <robin.gilks@tait.co.nz>
In-Reply-To: <3F983694.1060005@tait.co.nz>
References: <3F983694.1060005@tait.co.nz>
Content-Type: text/plain
Message-Id: <1066981471.29915.589.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 24 Oct 2003 08:44:32 +0100
Content-Transfer-Encoding: 7bit
cc: mtd list <linux-mtd@lists.infradead.org>
Subject: Re: Building jffs2 utils?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-10-24 at 09:14 +0000, Robin Gilks wrote:
> Greetings
> 
> Can someone give a clue as to the correct way to cross compile the utils 
> directory? Its find just running make using my existing (Mandrake 9.1 
> based) i386 system but a cross compile to powerpc-uclibc fails miserably 
> on any jffs2 tools due to the zlib stuff not being found.

Cross-compile zlib first?

-- 
dwmw2
