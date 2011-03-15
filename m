Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PzQZ3-0007iu-LG
	for linux-mtd@lists.infradead.org; Tue, 15 Mar 2011 09:29:18 +0000
Received: by bwz1 with SMTP id 1so396609bwz.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Mar 2011 02:29:14 -0700 (PDT)
Message-ID: <4D7F3168.9010300@googlemail.com>
Date: Tue, 15 Mar 2011 10:29:12 +0100
From: Andre Naujoks <nautsch2@googlemail.com>
MIME-Version: 1.0
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: gcc 4.5 and copy_flag in libubigen.c
References: <4D7E4437.70300@googlemail.com>
	<Pine.LNX.4.64.1103150930350.25520@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.1103150930350.25520@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 15.03.2011 09:45, schrieb Ricard Wanderlof:
> 
> On Mon, 14 Mar 2011, Andre Naujoks wrote:
> 
>> I am compiling a board support package with mtd-utils-1.3.1.
>>
>> After a gcc update to version 4.5 on my host the build fails and it
>> tells me that:
>>
>> ./src/libubigen.c: In function 'ubigen_write_leb':
>> ./src/libubigen.c:204:19: error: operation on 'u->v->copy_flag' may be
>> undefined.
>>
>> This seems like a recently introduced warning by the new gcc version,
>> but because of the -Werror halts my build.
> 
>> // This is the part gcc 4.5 complains about
>> // ---------------------
>>
>>        if (action & MARK_AS_UPDATE) {
>>                u->v->copy_flag = (u->v->copy_flag)++;
>>        }
>>
>> // --------------------
>>
> 
> I can understand why gcc warns about this, the operation is undefined. I
> would think the problem is not with the pointer dereference, it is the
> way the copy flag is used both before and after the ++. What you have is
> 
>   foo = foo++;
> 
> which is an undefined operation, for the following reason. While
> 
>   foo++;
> 
> says that foo has one value before this operation and the value +1 after
> (the C standard talks about 'sequence points', i.e points in the code
> where all variables have well defined values),
> 
>   foo = foo++;
> 
> is ambiguous in that it is not clear whether the ++ takes place after
> the assignment or vice versa. Should the compiler bump the value of foo,
> but return the old value, assign it to foo, and then assign foo the
> incremented value, or increment the value, return the old value, and
> assign it to foo, in effect not changing the value?
> 
> It might have worked by chance on an older compiler that didn't notice
> the problem and consistently picked one of the two possibilities above
> (preferebly the first one); however, according to the C standard, once
> an operation becomes undefined all aspects of it become undefined so the
> compiler could technically stuff any value in foo (or none at all).
> 
> Anyhow, technicalities aside, it looks like someone made a mental error
> when simply trying to set the copy_flag. I'm fairly convinced that the
> author simply meant:
> 
>   (u->v->copy_flag)++;
> 
>> My question is this. If this is indeed just a flag, can I just set
>> copy_flag to 1 instead of incrementing it? Witout breaking anything?
> 
> It is (or perhaps was?) commonplace to set flags by incrementing them.
> I'm not sure why this is considered a good idea. Possibly because
> 
>   flag++;
> 
> looks more elegant and cool than
> 
>   flag = 1;
> 
> although the latter is most certainly faster; in the first case the
> value must be read, incremented and copied back to the variable. Of
> course, if the variable is in a register there's no real overhead, but
> most processors have fast ways of loading small immediate values so the
> latter version will probably be just as quick and not need more code
> either.
> 
> I don't know if it could have something to do with the machines on which
> Unix was originally written, that it was faster, or, more likely, used
> up less code space, to increment something than to load it with 1.
> 
> I would agree with you in principle, especially since the variable is
> called 'flag' something, then again, without a thorough understanding of
> what the flag is used for, someone could conceivably have decided to use
> it as a counter instead of a flag, but retain the name.
> 
> /Ricard

Thanks for the detailed answer. At least I learned something today :-).
Since this code is considered old and no longer used I was able to just
disable this part in the build without consequences (AFAICS).

Thanks a lot anyway. I really appreciate it.

Andre
