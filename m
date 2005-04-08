From: Arjan van de Ven <arjan@infradead.org>
To: Andrew Morton <akpm@osdl.org>
In-Reply-To: <20050408104826.3ca70fb4.akpm@osdl.org>
References: <20050408170805.GE2292@wohnheim.fh-wedel.de>
	<20050408104826.3ca70fb4.akpm@osdl.org>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 Apr 2005 20:01:59 +0200
Message-Id: <1112983320.6278.80.camel@laptopd505.fenrus.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] restrict inter_module_* to its last users
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-04-08 at 10:48 -0700, Andrew Morton wrote:
> Jörn Engel <joern@wohnheim.fh-wedel.de> wrote:
> >
> > Next step for inter_module removal.  This patch makes the code
> >  conditional on its last users and shrinks the kernel binary for the
> >  huge majority of people.
> 
> If we do this, nobody will get around to fixing up the remaining users.

there is really only one, and how is this making it LESS likely? the
stuff remains deprecated and spews warnings, just like it is now....
just that other mortals now also don't get the kernel bloat...
