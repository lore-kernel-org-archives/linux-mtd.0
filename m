From: enrico.scholz@sigma-chemnitz.de (Enrico Scholz)
Date: Wed, 19 Feb 2003 21:18:20 +0100
Subject: Kernel oops with an unclean unmounted filesystem
In-Reply-To: <200302192122.28841.tglx@linutronix.de> (Thomas Gleixner's
 message of "Wed, 19 Feb 2003 21:22:28 +0100")
References: <lyr8a41m8y.fsf@ensc-pc.intern.sigma-chemnitz.de>
 <200302192122.28841.tglx@linutronix.de>
Message-ID: <lyvfzg3tyr.fsf@ensc-pc.intern.sigma-chemnitz.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Thomas Gleixner <tglx@linutronix.de> writes:

>> after creating and/or modifying a file in a JFFS2 filesystem,
>> I turned off the device without unmounting/syncing the device.
> What exactly did you do there ? I mean creating and/or modifying.

AFAIR I did:

1. rebooted the device and used the JFFS2 fs as the root-fs
2. cd /etc/minit/getty
3. - mv depends depends_
   - { echo 'getty/sleep'; cat depends_; } >depends
   - rm -f depends_
4. - mkdir sleep
   - ln -s /bin/sleep sleep/run
   - echo 1 >sleep/params
   - touch sleep/sync
5. waited 1-2 seconds
6. pressed the reset-button of the device

I am not sure about the order of the operations in 3 and 4, or if
3 and 4 were swapped.

The used toolset was busybox linked against glibc-2.3.1.

Because I wanted to keep a reproducible testcase I have not tried
to repeat it.




Enrico
