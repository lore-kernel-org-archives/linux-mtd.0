Return-path: <David.Woodhouse@mvhi.com>
To: Yaroslav Kholodov <kholodov@mail.kbimpuls.msk.ru>,
        "Vadim Lebedev" <vlebedev@aplio.fr>,
        Philippe MOULARD <philippe.moulard@atis.fr>,
        Alessandro Rubini <rubini@pop.systemy.it>,
        Daniel Kahlin <tlr@stacken.kth.se>, David Lang <dlang@diginsite.com>,
        Karl Pitrich <pit@root.at>, Eric LaForest <elafo@aai.ca>,
        "Enzo Michelangeli" <em@who.net>,
        Will Kassebaum <wkassebaum@escient.com>,
        Howard Goldstein <hg@bofh.sebastian.fl.us>,
        "Oleg V Makarenko" <oleg@twok.khabarovsk.su>,
        dhinds@hyper.stanford.edu, linux-kernel@vger.rutgers.edu
Subject: ANNOUNCE: Mailing list for memory technology devices.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 11 May 1999 23:50:16 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E10hLLt-00089N-00@devel2.axiom.internal>
Sender: rubini@pop.systemy.it
Resent-Message-ID: <GIuArD.A.N_.ADSO3@giga>
Reply-To: prosa-drivers@giga.prosa.it
List-Id: linux-mtd.lists.infradead.org

I've just set up a mailing list for discussion of the memory device subsystem
that I've started to develop for Linux.

To recap on the status: 

We have a basic 'mtd' layer which allows us to register low-level physical
devices. The low-level devices provide simple functionality (read, write, 
erase block), and the mtd glue layer presents this via a character device to 
the user.

On top of this, there can be loaded high-level drivers which attach to these
devices and provide more sophisticated functionality, such as the FTL
'filesystem', which presents a block device to the user. 

This model (and a large amount of the code) is 'borrowed' heavily from David
Hinds' code in the PCMCIA suite. 

Currently, we support the following physical devices...:
 1. Physical memory over and above what the kernel uses.
 2. M-Systems' ISA Flash disks.

... and only one high-level driver: the FTL filesystem driver.

We should shortly have low-level drivers for the M-Systems DiskOnChip 2000, 
and I would like to resync with the PCMCIA drivers, so that PCMCIA flash 
devices can use the same MTD system. 

In discussion with David Hinds about two years ago, we decided that this system
should be designed as a replacement for the PCMCIA version, with a view to
removing the version in the PCMCIA code (just like the PCMCIA code doesn't have
its own SCSI subsystem, etc). David - I'm not sure if that's still your 
intention - could you venture an opinion on the subject, please?

The code is available from ftp://imladris.mvhi.com/pub/mtd/

The mailing list is mtd@imladris.demon.co.uk - to subscribe, send 
"subscribe mtd" in the body of a mail to majordomo@imladris.demon.co.uk


----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.
