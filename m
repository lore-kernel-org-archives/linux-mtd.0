Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rldu4-0002Te-JQ
 for linux-mtd@lists.infradead.org; Fri, 13 Jan 2012 09:58:33 +0000
Message-ID: <4F10003D.2010809@parrot.com>
Date: Fri, 13 Jan 2012 10:58:21 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Gabriel Matni <gabriel.matni@gmail.com>
Subject: Re: ubifs mount fails due to corrupt empty space
References: <CALuiOdd6vgDogxf9+RFWhb-uUoDLji2CawB3Gvisg2iW4C7PiA@mail.gmail.com>
In-Reply-To: <CALuiOdd6vgDogxf9+RFWhb-uUoDLji2CawB3Gvisg2iW4C7PiA@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Gabriel Matni a écrit :
> Hello list,
> 
> Using kernel 3.2, ubifs failed to mount a fs properly due to a corrupt
> empty space encoutered while replaying the journal. Please notice the
> bitflip occurring in the supposedly empty space shown in the log below.
> The storage medium is an SLC NAND flash.
> 
> The stack dump shown below shows that replay_log_leb() was behind the
> call to ubifs_scan(), and could not deal with the -EUCLEAN error
> returned. ubifs_scan() returned this error because it detected the
> corrupt empty space.
> 
> The fs was unmounted cleanly, resulting in no need for fs recovery to
> happen during the mount (need_recovery=0). Therefore the recovery of the
> log_leb in question couldn't be performed, causing the mount to abort.
> This problem was also seen in the following thread:
> http://lists.infradead.org/pipermail/linux-mtd/2009-March/024953.html
> <http://lists..infradead.org/pipermail/linux-mtd/2009-March/024953.html> with
> a NOR flash
>  
> I applied the attached patch and the fs was successfully mounted giving
> the fs a second life.
> 
> My main questions are:
> 1) What should be the expected behavior of ubifs in this case?
> 2) Is there a systematic way to recover from a situation like that?
ubifs expect empty space to be protected by ecc. But if empty page ecc is not
ff, this need hack in the nand driver.



Matthieu
