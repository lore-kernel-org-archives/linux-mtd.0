From: swahl@brecis.com (Steve Wahl)
Date: Tue, 18 Mar 2003 10:51:00 -0600
Subject: DQ5 & DQ6 in chips/cfi_cmdset_0002.c (Dairy Queen 5 warning)
In-Reply-To: <1047925661.11512.213.camel@tubarao>; from tharbaugh@lnxi.com on Mon, Mar 17, 2003 at 11:27:41AM -0700
References: <20030312102735.U1745@brecis.com> <002701c2e8ba$8690e8c0$1200a8c0@JOHNB> <20030312154316.X1745@brecis.com> <1047916461.11517.85.camel@tubarao> <20030317101928.J1745@brecis.com> <1047925661.11512.213.camel@tubarao>
Message-ID: <20030318105100.N1745@brecis.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Mon, Mar 17, 2003 at 11:27:41AM -0700, Thayne Harbaugh wrote:
> On Mon, 2003-03-17 at 09:19, Steve Wahl wrote:
> > On Mon, Mar 17, 2003 at 08:54:21AM -0700, Thayne Harbaugh wrote:
> 
> <snip>
> 
> > > I do know, however, that several
> > > manufactures recommend that the final status should be checked an
> > > additional two times before a success is reported.
> 
> 
> > I'd be interested
> > to see specific data sheets or application notes that do this.
> 
> What I stated is not completely accurate.  Here is what SST states on
> page 14 of _4_Mbit_LPC_Flash_SST49LF040_ in the Write Operation Status
> Detection section:
> 
> The actual completion of the nonvolatile write is asynchronous with the
> system; therefore, either a Data# Palling or Toggle Bit read may be
> simultaneous with the completion of the Write cycle.  If this occurs,
> the system may possibly get an erroneous result, i.e., valid data may
> appear to conflict with either DQ7 or DQ6.  In order to prevent spurious
> rejection, if an erroneous result occurs, the software routine should
> include a loop to read the accessed location an additional two (2)
> times.  If both reads are valid, then the device has completed the Write
> cycle, otherwise the rejection is valid.

Ahh.  If I read this correctly, if you are about to report an error
you should read two more times to make sure it's still there.

So your original wording should be "the final status should be checked
an additional two times before a *failure* is reported."  You could
legally / reasonably report success the instant you detect it.

Do you agree?

It is somewhat funny that if this was followed, I wouldn't have run
into the "DQ5 detected, but things seem OK" warning (can't remember
the original wording, sorry). 

--> Steve
