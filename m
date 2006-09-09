Subject: Re: [Sfd] FOSS, Science, and Public activism
From: David Woodhouse <dwmw2@infradead.org>
To: paul@mawsonlakes.org
In-Reply-To: <cc9bf44d0609071533r10bc5c5cl940088ead9669c4f@mail.gmail.com>
References: <20060701220824.1EC396B0FDD@gnu-darwin.org>
	<cc9bf44d0609071533r10bc5c5cl940088ead9669c4f@mail.gmail.com>
Content-Type: text/plain
Date: Sat, 09 Sep 2006 14:05:52 +0100
Message-Id: <1157807152.2977.87.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "proclus@gnu-darwin.org" <proclus@gnu-darwin.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-09-08 at 08:03 +0930, Paul Schulz wrote:
> Greetings,
> 
> On 7/2/06, proclus@gnu-darwin.org <proclus@gnu-darwin.org> wrote:
> > It is important to alert the whole FOSS community that Darwin
> > cannot be classified as a free or open source operation system
> > as of the Darwin-8 revision, because AppleACPIplatform-39 which
> > is required to boot the system is proprietary.  It is notable that
> > only the current version of Darwin from Apple is a non-free OS.
> > GNU-Darwin has a free version, an earlier revision that includes
> > the source code.  It is FOSS, and we call upon Apple to maintain
> > Darwin as such, as it has been in the past.  We hope that the
> > current situation with the kernel and ACPI driver will soon be
> > remedied so that Darwin will continue as a FOSS OS.

If it's only ACPI, does it really matter? ACPI exists mostly for the
same reason as proprietary kernel modules -- to allow manufacturers to
obscure the details of the hardware.

Instead of having a free interpreter which runs their proprietary
bytecode in kernel mode, you have a closed interpreter which runs their
proprietary bytecode in kernel mode.

I would argue that even if your interpreter was open source, once you
submitted to using ACPI you'd already lost the Free Software game.

-- 
dwmw2
