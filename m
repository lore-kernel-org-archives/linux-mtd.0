From: tglx@linutronix.de (Thomas Gleixner)
Date: Thu, 20 Feb 2003 12:48:48 +0100
Subject: Kernel oops with an unclean unmounted filesystem
In-Reply-To: <lyvfzg3tyr.fsf@ensc-pc.intern.sigma-chemnitz.de>
References: <lyr8a41m8y.fsf@ensc-pc.intern.sigma-chemnitz.de>
 <200302192122.28841.tglx@linutronix.de>
 <lyvfzg3tyr.fsf@ensc-pc.intern.sigma-chemnitz.de>
Message-ID: <200302201248.48556.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Wednesday 19 February 2003 21:18, Enrico Scholz wrote:
> 1. rebooted the device and used the JFFS2 fs as the root-fs
> 2. cd /etc/minit/getty
> 3. - mv depends depends_
>    - { echo 'getty/sleep'; cat depends_; } >depends
>    - rm -f depends_
> 4. - mkdir sleep
>    - ln -s /bin/sleep sleep/run
>    - echo 1 >sleep/params
>    - touch sleep/sync
> 5. waited 1-2 seconds
> 6. pressed the reset-button of the device
> I am not sure about the order of the operations in 3 and 4, or if
> 3 and 4 were swapped.
No touch sleep/sync was your last action.
Current CVS has a sanity check for this, so it should not Oops any more.
It will give you just a warning.
Please try, if you can reproduce it, by using the same procedure.
Nobody can explain how it got there.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
