Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BsrbJ-0004G4-VP
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2004 19:24:47 -0400
To: Andy Hawkins <a.hawkins@cabletime.com>
References: <Pine.SGI.4.10.10407262153220.569820-100000@Sky.inp.nsk.su>
	<1090856360.2220.63.camel@adh> <1090858047.2219.77.camel@adh>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 05 Aug 2004 17:24:39 -0600
In-Reply-To: <1090858047.2219.77.camel@adh>
Message-ID: <m37jsdnp6w.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: "Eric W. Biederman" <eric@lnxi.com>
Cc: D.A.Fedorov@inp.nsk.su, linux-mtd@lists.infradead.org,
	Thayne Harbaugh <tharbaugh@lnxi.com>
Subject: Re: Problem writing to NOR flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andy Hawkins <a.hawkins@cabletime.com> writes:

> Hi all,
> 
> After a bit more digging and reading of the data sheet, it appears the
> the chip I'm using doesn't need locking and unlocking. I then went back
> to the version of the code where we had this working (whatever came with
> the 2.4.20 kernel) and found that none of this locking / unlocking
> mechanism was present.
> 
> So, to test I commented out the contents of cfi_amdstd_lock_varsize and
> cfi_amdstd_unlock_varsize, and I can now successfully write to the NOR!
> 
> Are these functions only required for some very specific chips? 

Yes.

> If so,
> what is the *correct* way for this code to determine whether or not they
> are needed (this code is in a 'generic' file, so I'm surprised that
> there's chip specific information in there).

When Thayne wrote the code he was assuming that since there were no
lock/unlock functions the lock/unlock entry points were simply
not called.  And he figured if it actually broken something someone
would scream.  And then he thought someone had removed the code
when cfi_cmdset_0002 was scrubbed a while ago.

In addition that code really is generic, it applies to firmware
hub parts and there are chips that use both cfi_cmdset_0001 and
cfi_cmdset_0002 that can use it.

When I get a chance it is my intention to refactor the probing
routines to make handling of chips with special capabilities
simpler.

As a first step I am putting a few conditionals in cfi_amdstd_setup
so that chips that we won't use those methods on chips that
don't support them.  Then we can look at better ways to organize
the probe code so the probe/setup code is not such a mess.

I have the first chunk done but I'm not ready to check it
in until I have a chance to test it.  And I am swamped right now...

Eric
