Received: from web26309.mail.ukl.yahoo.com ([217.146.176.20])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EmWRg-0006XR-Vu
	for linux-mtd@lists.infradead.org; Wed, 14 Dec 2005 08:13:33 -0500
Message-ID: <20051214130643.14752.qmail@web26309.mail.ukl.yahoo.com>
Date: Wed, 14 Dec 2005 13:06:43 +0000 (GMT)
From: Sreecharan Sivadevuni <mailsreecharan@yahoo.co.uk>
To: suresh.veigas@amdlbct.com, linux-mtd@lists.infradead.org
In-Reply-To: <20051214072501.80960.qmail@web26303.mail.ukl.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: 
Subject: Re: [uClinux-dev] Question on using JFFS2 on MTD using
	IntelflashTE28F640 on uClinux-2.4-24
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Stevens,
          Got it! Now 'jffs' is working for me.  Your
suggestion was spot on. Actually the character devices
are alloted as mtd1,mtd2 etc for each partition. but
mtd0 is alloted for entire flash. But the same pattern
is not followed with block devices. so that what
happens is 'mtd1' is actually 'mtdblock0' so it is
something like this:

mtd1 ----> mtdblock0
mtd2 ----> mtdblock1
mtd3 ----> mtdblock2

Now this above thing was not mentioned in any
documentation. and I was struggling for two weeks. 

And to add to trouble 'cat /proc/mtd' prints incorrect
information. It doesnot show 'mtd0' as entire flash
but shows it as first partition. actually 'cat
/proc/mtd' should print one row more than there are
number of partitions. I think this is a bug and needs
a fix. comments anyone ?

I used latest 'physmap.c' file from
'cvs.infradead.org'. I see that in the latest version
in this file 'add_mtd_device' is called   after
'add_mtd_partitions' in function 'init_physmap'. But
in earlier revision it is called before calling
'add_mtd_partitions' is this correct ?  can anyone
comment ?

Thanks
Sreecharan.S



> 
> --- Suresh Steven Veigas <suresh.veigas@amdlbct.com>
> wrote:
> 
> > 1. I have like this, which is working for 2.4
> > kernel, try removing both
> > erasable and writable flags.
> > 2. In this i have mtd0 as whole flash. mtd1 as
> > bootROM and Image, mtd2 as
> > User FS1, mtd3 as User FS2 mtd4 as User FS3
> > 3. If you are using ROMFS & blkmem also, check the
> > MAJOR no's of mtdblock
> > and blkmem.
> > 
> > 
> > static struct mtd_partition physmap_partitions[] =
> {
> >         {
> >                 name:           "bootROM and
> Image",
> >                 size:           0x00100000,     /*
> > for 1MB kernel image */
> >                 offset:         0,
> >                 mask_flags:     MTD_WRITEABLE,  /*
> > force read-only */
> >         },{
> >                 name:           "User FS1",
> >                 size:           0x00100000,     /*
> > for 1MB userFS */
> >                 offset:        
> MTDPART_OFS_APPEND,
> >         },{
> >                 name:           "User FS2",
> >                 size:           0x00100000,     /*
> > for 1MB userFS */
> >                 offset:        
> MTDPART_OFS_APPEND,
> >         },{
> >                 name:           "User FS3",
> >                 size:           MTDPART_SIZ_FULL, 
>  
> >    /* for 1MB userFS */
> >                 offset:        
> MTDPART_OFS_APPEND,
> >         }
> > };
> > 
> > 
> > regards
> > Steven
> > 
> > ----- Original Message -----
> > From: "Sreecharan Sivadevuni"
> > <mailsreecharan@yahoo.co.uk>
> > To: "uClinux development list"
> > <uclinux-dev@uclinux.org>
> > Sent: Friday, December 09, 2005 3:39 PM
> > Subject: Re: [uClinux-dev] Question on using JFFS2
> > on MTD using
> > IntelflashTE28F640 on uClinux-2.4-24
> > 
> > 
> > Hi Stevens,
> >           True MTD_WRITEB_WRITEABLE might make
> > partition readonly, but so far till now I tried
> all
> > possible options, and latest is I tried
> > "MTD_EREASABLE
> > | MTD_WRITEB_WRITEABLE", but the results are same.
> > 
> > And for partitions, I could verify in '/proc/mtd'
> > that
> > it is "jffs2" not "jffs-rdonly" that is at 'mtd4'.
> > further my MTD cannot detect '/dev/mtdblock5' it
> > says
> > "unknown device"
> > 
> > Thanks
> > Sreecharan.S
> > 
> > 
> > --- Suresh Steven Veigas
> <suresh.veigas@amdlbct.com>
> > wrote:
> > 
> > > check these once
> > >
> > > mask_flags: MTD_WRITEB_WRITEABLE,  /* force
> > > --------makes the partition readonly
> > > In my board, if partition size is very less then
> > it
> > > was giving "No space
> > > left on device",  try increasing the partition
> > size
> > >
> > > I think MTD4 is refering to "jffs2-rdonly"
> > > partitions, mtd0 = complete
> > > flash, mtd1 = boot ---------check it once
> > >
> > > regards
> > > Steven
> > >
> > >
> > >
> > 
> > 
> > 
> >
>
___________________________________________________________
> > To help you stay safe and secure online, we've
> > developed the all new Yahoo!
> > Security Centre. http://uk.security.yahoo.com
> > _______________________________________________
> > uClinux-dev mailing list
> > uClinux-dev@uclinux.org
> >
>
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
> > This message was resent by uclinux-dev@uclinux.org
> > 
> > 
> > 
> > Confidentiality Notice:
> > 
> > The information contained in this electronic
> message
> > and any attachments to this message are intended
> for
> > the exclusive use of the addressee(s) and may
> > contain confidential or privileged information. If
> > you are not the intended recipient, please notify
> > the sender at AMDLBCT or sysadmin@amdlbct.com
> > immediately and destroy all copies of this message
> > and any attachments.
> > 
> > _______________________________________________
> > uClinux-dev mailing list
> > uClinux-dev@uclinux.org
> >
>
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
> > This message was resent by uclinux-dev@uclinux.org
> > 
> 
> 
> 
> 		
>
___________________________________________________________
> 
> To help you stay safe and secure online, we've
> developed the all new Yahoo! Security Centre.
> http://uk.security.yahoo.com
> _______________________________________________
> uClinux-dev mailing list
> uClinux-dev@uclinux.org
>
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
> This message was resent by uclinux-dev@uclinux.org
> 



		
___________________________________________________________ 
How much free photo storage do you get? Store your holiday 
snaps for FREE with Yahoo! Photos http://uk.photos.yahoo.com
