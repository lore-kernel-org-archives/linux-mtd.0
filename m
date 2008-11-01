Subject: Re: ST M29W320D incorrectly configured
From: David Woodhouse <dwmw2@infradead.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
In-Reply-To: <m1k5bohs61.fsf@frodo.ebiederm.org>
References: <20081029195349.imqvyxcajuoko0wo@imap.linux.ibm.com>
	<1225463927.16774.106.camel@macbook.infradead.org>
	<m1k5bohs61.fsf@frodo.ebiederm.org>
Content-Type: text/plain
Date: Sat, 01 Nov 2008 07:33:33 +0000
Message-Id: <1225524813.16774.140.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: jwboyer@gmail.com, linux-mtd@lists.infradead.org,
	Corinna Schultz <cschultz@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-10-31 at 23:33 -0700, Eric W. Biederman wrote:
> Forget my last I see now how we can try a 16bit device on an 8 bit
> bus. I had missed the type <<=1 in gen_probe_new_chip.  Ooops.
> 
> With that said I think we need to fix cfi_send_gen_cmd as this problem
> applies to all uses of it.
> 
> Unless I've missed something the patch below completely fixes the
> problem.

Yeah, that looks better. I had looked at the possibility of continuing
to use 'word' addresses and fixing up cfi_build_cmd_addr(), but for some
reason I hadn't noticed that it was used _only_ for the unlock addresses
(or zero). I thought I was going to need to put a special case in for
when it was being used with unlock addresses, and it all got a bit
complex. So I switched to using byte addresses in the variables instead.

I prefer your approach, although I think the patch isn't quite correct.

You have to make sure we properly handle the case of a 16-bit device in
16-bit mode. We mustn't set the byte address to 0x555 there; it has to
remain 0x554. We need to do the 'addr |= ....' bit _only_ if the device
is in compatibility mode (i.e. interleave * type > map_bankwidth(map)).

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
