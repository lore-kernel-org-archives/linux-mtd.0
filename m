Subject: Re: [PATCH] [MTD] [NAND] nand_ecc.c: adding support for 512 byte ecc
From: David Woodhouse <dwmw2@infradead.org>
To: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
In-Reply-To: <ac9c93b10808220143o27a769c6lbb37faaa68f6318d@mail.gmail.com>
References: <19F8576C6E063C45BE387C64729E739403CD517C16@dbde02.ent.ti.com>
	<19F8576C6E063C45BE387C64729E739403CD517C1A@dbde02.ent.ti.com>
	<ac9c93b10808211139t69d3ce6euaac35368f1514931@mail.gmail.com>
	<19F8576C6E063C45BE387C64729E739403CD517C1B@dbde02.ent.ti.com>
	<1219385223.18027.105.camel@sauron>
	<ac9c93b10808220143o27a769c6lbb37faaa68f6318d@mail.gmail.com>
Content-Type: text/plain
Date: Fri, 22 Aug 2008 10:06:19 +0100
Message-Id: <1219395979.9583.18.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Singh, Vimal" <vimalsingh@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	David@mgw-mx06.nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-08-22 at 10:43 +0200, Frans Meulenbroeks wrote:
> @David (dwmw2)
> Please let me know what the preferred way to integrate this. I can
> either provide a patch on top of Vimal' patch if needed, or I can add
> my changes to it and submit a patch containing the work of both of us,
> or I can send my changes as review comment to Vimal and let him make
> the patch. What is the preferred way? (and I highly prefer a solution
> where Vimal gets credit for his changes)

When you forward the patch on to me, put 'From: Vimal Singh <...>'  as
the first line of the _body_ of the email so that it is still attributed
to him. It's reasonable to preserve his signed-off-by, if you're only
making relatively minor changes, and document what _you_ changed in
square brackets. For an example, see
http://www.mail-archive.com/linux-btrfs@vger.kernel.org/msg00461.html

Alternatively, if his patch isn't actually introducing a regression, it
doesn't hurt to do it as two separate patches -- whichever you prefer.

When resending an updated patch, make sure the proper commit comment
remains intact -- if you want to add some commentary like 'fixed up
according to review and made some other fixes', which doesn't live in
the commit comment but follows on from the email thread, then add it
after a line with three dashes -- again, you can see that in the example
above.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
