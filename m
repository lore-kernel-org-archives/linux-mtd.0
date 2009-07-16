Received: from einhorn.in-berlin.de ([192.109.42.8])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRP9P-0001eN-RX
	for linux-mtd@lists.infradead.org; Thu, 16 Jul 2009 11:29:27 +0000
Message-ID: <4A5F0F03.5080507@s5r6.in-berlin.de>
Date: Thu, 16 Jul 2009 13:29:07 +0200
From: Stefan Richter <stefanr@s5r6.in-berlin.de>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: [PATCH 02/06] Fix compilation warning for fs/ubifs/commit.c
References: <20090715021901.4112.45973.sendpatchset@subratamodak.linux.ibm.com>	
	<1247640750.11353.6.camel@localhost.localdomain>	
	<4A5E1D1A.3090705@s5r6.in-berlin.de>
	<1247738232.11353.90.camel@localhost.localdomain>
In-Reply-To: <1247738232.11353.90.camel@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Sachin P Sant <sachinp@linux.vnet.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>,
	linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>,
	Subrata Modak <subrata@linux.vnet.ibm.com>,
	Balbir Singh <balbir@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Wed, 2009-07-15 at 20:16 +0200, Stefan Richter wrote:
>> The changelog of the patch is bad.  "Fix compilation warning" is not 
>> correct.  It should be "suppress compilation warning" or "annotate 
>> unitialized variable" or whatever --- i.e. it should say what it does.
> 
> For me this sounds the same. But probably your version is better
> English. I'll change this.
> 
>> Furthermore, since the 3 lines context around the change in the diff do 
>> not reveal why the chosen "fix" is correct and desirable, the changelog 
>> should also leave a note why it's done this way.
> 
> The changelog says which kind of warning is fixed, I though it is
> obvious what is the warning. At lease for me it would.
> 
> But if Subrata sends me the warning he sees, I'll change that.
> Thankfully I did not push the patch to ubifs-2.6.git/linux-next
> which I never re-base, but pushed it to master which I do rebase
> and it is documented here:
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_source
> 
> So I may just amend the commit's message.
> 
>> The patch form David Howells which is quoted here has an equally bad 
>> subject, but at least its changelog goes on to explain what the patch 
>> really does and why it does it in the proposed way.
> 
> Well, I just thought this type of warnings and way of fixing is very
> standard because I saw many similar fixes all over the place.
> 
> Anyway, amended the patch like this so far:
> http://git.infradead.org/ubifs-2.6.git?a=commit;h=5c1507e6097c4abc13bbad69de137366c9043f22

Hi,

my comment was more directed to Subrata rather than you, as a pointer 
for future changes of this kind.

By '"Fix compilation warning" is not correct' I mean:

This subject would be strictly correct if there was a warning message 
which contained a factual or formal mistake, and the patch would make 
the warning show up as a factual and formal correct message.

Yet the patch does nothing else than _suppress a message_.

This comment surely sounds pedantic, but my motive for posting was that 
changes which are posted with a sloppily written (and in this case, 
incomplete) changelog are too often ill-conceived themselves.

The warning which is being suppressed here is surely of the kind 
"variable may be used uninitialized".

There are of course different possible causes for such a warning to come 
up --- and depending on the cause, different types of "fixes" are called 
for.

     1.) Reason:  A variable is in fact used uninitialized; maybe only in
         border cases which are extremely rarely executed in practice.

         Wrong "fix":  Shut up the compiler with this uninitialized_var()
         macro (or worse, by an arbitrary dummy initialization).  Then
         the bug is still there, it only has become invisible, which is
         of course even worse.

         Right fix:  Fix up the code to provide the intended value in the
         variable.

     2.) Reason:  The compiler wrongly interprets a variable as
         occasionally unused, because there is convoluted, messy code.

         Wrong "fix":  Shut up the compiler with this uninitialized_var()
         macro or worse, by an initialization.  Then the code has become
         even messier than it already was!

         Right fix:  Refactor the code to become cleanly laid out, easy
         to follow, obviously correct.  (And as a side effect, compilable
         without warning.  But that's only a side effect, not the actual
         goal of the code change!)

     3.) Reason:  The compiler wrongly interprets a variable as
         occasionally unused, even though this is nicely organized,
         obvious code where the assertion of the compiler is not only
         wrong, but everybody also can see immediately from the code that
         there will never be a.

         Aside from improving the compiler itself to properly handle
         this, in this case the appropriate action is to use the
         uninitialized_var() macro --- /unless/ there is a non-intrusive
         way to refactor the code to be compilable without warning but
         keep it still nice to read.

         Why is the latter still better than uninitialized_var()?  Easy:
         If anybody later changes the code such that he introduces an
         actual use-without-initialization bug, nobody will notice the
         bug because it's hidden by the macro.

         And there are more downsides to the macro:  The readability of
         code which makes use of it suffers somewhat.  Also, the macro
         works with gcc (i.e. shuts gcc up), but apparently not with the
         Intel compiler.

So, in the majority of types of cases, uninitialized_var() is the wrong 
course of action.  (Though maybe not in the majority of occurrences of 
cases.)

Furthermore, Subrata's changelog does not document whether there was a 
deeper analysis of the real reason for the warning and for the most 
appropriate solution.  The changelog only points to uninitialized_var() 
usage in entirely unrelated code.

OK.  Rant over.  It's now time for me to actually have look at the code 
which is being patched here. :-)  (Sorry, I commented before only on the 
basis of Subrata's diff and changelog.)

 From fs/ubifs/commit.c in mainline 2.6.31-rc3:

Before lower_key, there was obviously already an issue with last_sqnum 
which received the same treatment as lower_key receives now.  Both of 
these are provided with a value in a conditional block:

	int first = 1;

	if (first) {
		first = 0;
		...
	}

block and first used after this block.  From the looks of the whole 
function, these two variables indeed don't appear in danger to ever be 
accessed uninitialized.

So, is uninitialized_var() a good fix here?  I'd say it's not a 
particular good one.  Count the lines of code of dbg_check_old_index() 
and the maximum indentation level of it.  Then remember the teachings of 
CodingStyle. :-)  See?  dbg_check_old_index() clearly isn't a prime 
example of best kernel coding practice.  /Perhaps/ a little bit of 
refactoring would make it easier to read, and as a bonus side effect, 
make it unnecessary to use the slightly dangerous and 
uninitialized_var() macro here.
-- 
Stefan Richter
-=====-==--= -=== =----
http://arcgraph.de/sr/
