From: enrico.scholz@sigma-chemnitz.de (Enrico Scholz)
Date: Mon, 24 Feb 2003 13:21:35 +0100
Subject: Kernel oops with an unclean unmounted filesystem
In-Reply-To: <200302201248.48556.tglx@linutronix.de> (Thomas Gleixner's
 message of "Thu, 20 Feb 2003 12:48:48 +0100")
References: <lyr8a41m8y.fsf@ensc-pc.intern.sigma-chemnitz.de>
 <200302192122.28841.tglx@linutronix.de>
 <lyvfzg3tyr.fsf@ensc-pc.intern.sigma-chemnitz.de>
 <200302201248.48556.tglx@linutronix.de>
Message-ID: <lywujpzx68.fsf@ensc-pc.intern.sigma-chemnitz.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Thomas Gleixner <tglx@linutronix.de> writes:

>> ...
>> 4. - mkdir sleep
>>    - ln -s /bin/sleep sleep/run
>>    - echo 1 >sleep/params
>>    - touch sleep/sync
>> 5. waited 1-2 seconds
>> 6. pressed the reset-button of the device
> ...
> No touch sleep/sync was your last action.
> Current CVS has a sanity check for this, so it should not Oops any more.

Thanks; with recent CVS version (20030223) it does not oops
anymore when mounting the filesystem.

When accessing the questionable directory (ls
/etc/minit/getty/sleep) the first time, the 'ls' process hangs in
D state. After rebooting 'ls' does not hang anymore but gives an
I/O error at sleep/sync.  I can not remove this file; but because
the corruption seems to be caused by the writing-part of JFFS2
(see below), this is not a problem.

> It will give you just a warning.  Please try, if you can
> reproduce it, by using the same procedure.

I can reproduce it 100% on a 2.5.59 kernel with any 'touch foo'
command. When using the CVS version of jffs2 (and commmenting out
the unpoint() stuff which does not compile with 2.5), things seem
to be fine and the filesystem does not become corrupted.



Thanks for your help
Enrico
