From: David Woodhouse <dwmw2@infradead.org>
To: Ian Campbell <icampbell@arcom.com>
In-Reply-To: <1092735533.9001.48.camel@icampbell-debian>
References: <1092731553.9001.18.camel@icampbell-debian>
	<1092734138.3777.50.camel@imladris.demon.co.uk>
	<1092735533.9001.48.camel@icampbell-debian>
Content-Type: text/plain
Message-Id: <1092737054.14552.137.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 17 Aug 2004 11:04:14 +0100
Content-Transfer-Encoding: 7bit
Cc: Linux MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: Re: MTD patches
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-08-17 at 10:38 +0100, Ian Campbell wrote:
> Hi, 
> 
> I noticed that you had to moderate this message due to a suspicious
> header. Is this a false positive or can I do something to fix it? The
> message didn't say which header.

All mail with attachments gets stopped for moderation. If you're posting
only _one_ patch then inline it instead of attaching it -- if you're
posting three then the only sane way would be to send it as three
patches. Or just wait for moderation ;)

> > Hmmm. Isn't this why we introduced an extra argument to the partition
> > parsers in the first place? The map code should be able to pass a
> > suitable argument, rather than having ifdefs in the parser code? Gary?
> 
> I had a solution based on this idea for a bit, but I didn't like it in
> the end since mtd_parse_partitions only takes a single parameter which
> is passed to all the partition modules you might be using (I have
> command line then redboot in my setup). Hence it didn't seem to make
> sense to pass a redboot partition table specific parameter to this
> function.

True. I'm growing to hate our partitioning code. I think it all needs
rewriting.

> > > mtd-jedec-probe-parts
> > >         
> > >         This patch adds a few new part numbers to jedec_probe.c. They
> > >         are AMD AM29F002T, Hyundai HY29F002T and Macronix MX29FOO2T.
> > 
> > OK, please apply this -- you have CVS access don't you?
> 
> I don't believe I do, one of my colleagues here at Arcom does (David
> Vrabel). I can ask him to commit this patch, or else I can send you
> whatever you need to get an account setup for me, just a ssh public
> key?.

Yep.

> I guess cvs.infradead.org is still IPv6 only, do you have any advice for
> a tunnel to use that will work from within a corporate firewall, or on a
> dynamic IPv4 cable modem address?

If you have a public IPv4 address of any kind, that's sufficient. If
it's got initscripts like Red Hat/Fedora then add the four config lines
shown at http://www.linux-mtd.infradead.org/ and it should just work.
Other distributions are similarly trivial.

If you have an account on a box _anywhere_ with both IPv6 and IPv4, you
can use that in conjunction with SSH's 'ProxyCommand' option which makes
it run a command and use stdin/stdout instead of trying to connect
directly. I have this in my ~/.ssh/config at work, where there's no
IPv6:

Host cvs.infradead.org phoenix.infradead.org phoenix
 ProxyCommand ssh pentafluge.infradead.org nc -6 %h %p




-- 
dwmw2
