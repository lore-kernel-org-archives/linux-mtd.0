Received: from acl.lanl.gov ([128.165.147.1])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 178kSb-00065U-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 May 2002 17:20:06 +0100
Date: Fri, 17 May 2002 10:20:03 -0600 (MDT)
From: Ronald G Minnich <rminnich@lanl.gov>
To: David Woodhouse <dwmw2@infradead.org>
cc: "Richard A. Smith" <rsmith@bitworks.com>,
    "linuxbios@lanl.gov" <linuxbios@lanl.gov>,
     <linux-mtd@lists.infradead.org>
Subject: Re: Getting big flash onto motherboards. Will CF work? what will? 
In-Reply-To: <12770.1021652243@redhat.com>
Message-ID: <Pine.LNX.4.33.0205171018500.11746-100000@snaresland.acl.lanl.gov>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Fri, 17 May 2002, David Woodhouse wrote:

> Dunno; I just made it up -- is it even technically possible to put flash in
> the DIMM slots of most motherboards?

I think on SDRAM it would be doable, but i can't see anyone putting in the
effort as you have to get all the state machines right, and then you have
to convince the BIOS you're not really there.

In an earlier life I did design 2 different NICs for DRAM slots, and it
was not hard. But that was before SDRAM and its complexities.

ron
