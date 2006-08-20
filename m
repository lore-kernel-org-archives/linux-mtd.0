Subject: Re: [PATCH] CORE: Allow kernel access to struct mtd_part and
	PART() for axfs
From: David Woodhouse <dwmw2@infradead.org>
To: Jared Hulbert <jaredeh@gmail.com>
In-Reply-To: <6934efce0608180223g4591c1beja5be00f57d5173f4@mail.gmail.com>
References: <6934efce0608180223g4591c1beja5be00f57d5173f4@mail.gmail.com>
Content-Type: text/plain
Date: Sun, 20 Aug 2006 09:17:31 +0100
Message-Id: <1156061852.22871.239.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-08-18 at 02:23 -0700, Jared Hulbert wrote:
> This is best way we could figure out to get access to the physical
> address of a given partition.  We _need_ the physical address to use
> remap_pfn_range().

If it's going to be public information I'd prefer to just add it to the
struct mtd_info rather than exposing more private structures just
because they happen to contain it at the moment.

But really, you need to be able to coordinate with the flash driver so
that you can read from it _only_ when it's in read mode. This kind of
thing is what point() is for. The whole point()/unpoint() thing is
probably misdesigned, so feel free to make suggestions for changing it,
if it doesn't do what you want.

How do you handle tearing down a mapping when the data moves from one
place on the flash to another? Or does that not happen? 

-- 
dwmw2
