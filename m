From: swahl@brecis.com (Steve Wahl)
Date: Wed, 19 Mar 2003 09:56:38 -0600
Subject: DQ5 & DQ6 in chips/cfi_cmdset_0002.c (Dairy Queen 5 warning)
In-Reply-To: <1048033423.11512.1657.camel@tubarao>; from tharbaugh@lnxi.com on Tue, Mar 18, 2003 at 05:23:43PM -0700
References: <1047428715.11517.50.camel@tubarao> <20030312102735.U1745@brecis.com> <1047915630.11512.81.camel@tubarao> <1047926318.11517.235.camel@tubarao> <1048033423.11512.1657.camel@tubarao>
Message-ID: <20030319095638.V1745@brecis.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Tue, Mar 18, 2003 at 05:23:43PM -0700, Thayne Harbaugh wrote:
>   It likely could be simplified even more - take out feeble support for
> interleaved chips (which I don't have and can't test and I'm not even
> sure that the chips that work this way support interleaving).

Interleaved operation is probably always supported, because the chips
don't "know" they're doing it.

Unless I'm completely mistaken, interleaving is simply having N chips
with a data bus width of W on a bus that's N * W wide.  For instance,
I once worked on a product with a processor that didn't do anything
smaller than a 32 bit bus, so the flash area of memory was populated
with 4 chips (each 8 bits wide).

For these, you generally issue the commands to all chips at one time,
in this case writing 32 bit words with the command bytes replicated in
each byte of the word.  Makes the polling a little complicated,
perhaps, because you have to watch for all chips to reach a finished
state before you continue.

Still thinking about the rest of what you wrote.  My initial thoughts
are this shouldn't really need a whole separate command set file.

--> Steve
