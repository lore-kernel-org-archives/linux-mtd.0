From: David Woodhouse <dwmw2@infradead.org>
To: "Matthew S. McClintock" <mattsm@arlut.utexas.edu>
In-Reply-To: <1074622804.4726.0.camel@chuck.arlut.utexas.edu>
References: <000d01c3df7f$e8685c60$6e01a8c0@solarwave>
	 <1074622804.4726.0.camel@chuck.arlut.utexas.edu>
Content-Type: text/plain
Message-Id: <1074622975.7885.15.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 20 Jan 2004 18:22:56 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: RE: MTD - DOC 2000 freezes on umount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-01-20 at 12:20 -0600, Matthew S. McClintock wrote:
> I got the same problem. I just edited out the offending lines since they
> did not effect me.

I sincerely hope you were effected by your parents and not by any form
of software :)

>  I was unable to determine the problem by looking at
> the contents of the file.

Bizarre. It's a define_bool, which is relatively new -- but not so new
it's not in 2.4.24, I thought. As you're only interested in the
DiskOnChip drivers, you're right that it doesn't affect you (assuming
that's what you meant:)

-- 
dwmw2
