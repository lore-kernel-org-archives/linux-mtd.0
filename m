Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11yLmf-0003xX-00
	for mtd-list@infradead.org; Wed, 15 Dec 1999 21:16:29 +0000
Received: from stonewall.shenandoah.com ([204.111.72.3] helo=mail.datalux.com)
	by infradead.org with smtp (Exim 3.03 #1)
	id 11yLmd-0003xR-00
	for mtd@imladris.mvhi.com; Wed, 15 Dec 1999 21:16:27 +0000
Message-ID: <38580543.66818B2A@datalux.com>
Date: Wed, 15 Dec 1999 16:16:51 -0500
From: ralph stickley <ralph@datalux.com>
MIME-Version: 1.0
To: Adi Linden <adi@adis.on.ca>
CC: Embedded <linux-embedded@waste.org>, MTD <mtd@imladris.mvhi.com>
Subject: Re: Anyone embedding RH 6.1 / 2.2.12 ?
References: <Pine.LNX.4.10.9912151000340.6229-100000@localhost.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Ok,
Heres a shell script that should help. (Pasted it at the end of this message).

try:
./doc

to get the usage message.

./doc -E

Erases the disk on chip, well, almost.  I was using ext2 but commented that line out..
need to update for msdos filesystem.  Just mounts it for now.  How do you do this now?

./doc -f   xxx

That will copy all the packages listed in the doc.conf file (default file is built with
all
xx.tar filenames found in the ./packages directory).  Edit doc.conf to select which
packages to install.

The actual files 'untarred' are taken from the xx.list file.  Edit xx.list file to
include or
exclude specific files.

./doc -s

makes a list of the entire contents of the disk on chip - seemed like a fun thing to
do.

Other things to do from this shell script:
-- look in "updates" directory to copy new files over the un-tarred files
-- use a specific .config file to build the kernel just for the disk on chip
-- More features to come - any suggestions welcome :-)

Hope this helps.
Later,
Ralph

<more below>

Adi Linden wrote:

> Hi,
>
> > Yes, we will need to use the flash read-only.  I can make another partition (or
> > two) to use for storing user data.  If the software only writes to one partition,
> > then only that partition can be damaged during power down.   By alternating
> > partitions, only the last changes are lost. Have the application save it twice and
> > then you have it (That's my solution for the power down problem ).
>
> That's a neat idea. How do you detect error in writing? Use fsck on boot?
> So far I haven't had any user data to save. The emphasis has been on
> building an appliance type deal where you ask the user if the lights are
> on and if they're not on unplug the power to reset. However, even for
> dhcp it would be nice to save the dhcp.leases file...
>

I suppose...I thought that was automatic at power up...but then I'm still not sure
what happens at power up  ?:-o


>
> > I'd like to make a configuration utility like "make menuconfig", but since I only
> > need one configuration, that may be considered a waste of Co. time :-)  I should
> > finish my V0.0 shell script today...
>
> I created the *.list files with the idea of eventually creating a script
> that parses a file containing the *.tar files to use to build the system.
> Then it might be possible to use the *.list files to tag files that should
> be deleted from the system if they're not needed. A menu type system would
> be nice... :-) but I am not fluent in C, doing a lot of shell and perl
> programming. I opted to to this embedded project and learn about CISCO
> router admin instead of learning C...
>

C and Shell scripts are easy...its "programming" this dang OS thats a pain !:-|
I guess it's what your used to...

>
> > Hmmm...I'll need to get run level 5 in also, since we need to run X (but thats
> > another task, after I see this thing boot ).
>
> I haven't tackled X yet. I am still looking for an inexpensive embedded
> platform with a LCD touch screen for an Internet kiosk. So far US$2300.00
> was the bottom line I found...
>

<sales pitch on>
Check out:

http://www.datalux.com/ipix

They even have a linux version! (well, almost :-)

</sales pitch off>

>
> > AFAIK shutdown is not needed if your running from ram disk.  Any software running
>
> I need to be able to telnet into the box and force a reboot.
>

Hey, neat feature...

>
> There are mount options that force immediate writes. Would it be sync?
>

I guess theres' a 50 page how to about that somewhere...I'll have to check...

>
> > I like the idea of sharing files from a desktop to the embedded system...Thats got
> > to be the easiest way to debug the setup (especially when you don't have a floppy
> > disk on the embedded system (it is fun to use hard disks like floppies - 9 hard
> > drives sitting on my desk as I write <:-;).
>
> I almost had to build a remote boot system using bootroms for my employer.
> The idea got scrapped. The embedded platform I use has a build in bootrom.
> I'd love to use it to have a full system mounted nfs to do development,
> install software on the doc, etc... I alread spend significant time
> researching the remote boot thing, unfortunatley my research was centered
> on Windows clients booting from a Linux server.
>
> > Well, Duh....My mistake...I never knew...I was under the impression that there
> > were DOS files involved: command.com calling config.sys or something.  Hey, that
> > means I can leave the lilo (and especially plilo) in the trash - Whoopee Yeah Ra
> > Ra !!
>
> Just found a problem, though. Didn't compile MS-DOS filesystem support in
> the kernel. I tried the driver using using an ext2 formated doc... Got to
> fix that.
>
> > Spare time ?? whats that, please explain :-)
>
> Hey, after working 30 hours a day and 10 days a week there's still time
> left in the day ;-)
>
> > I'm thinking your connection is getting limited - best I could get on 3 different
> > downloads was about 2.8Kbps...maybe 56K is your upload speed ? Hmmmmm.... Well, if
> > you split it up, this won't be a problem...
>
> RAD modems on 2 pairs of wires, 256k in and 256k out... I wonder, I am far
> up in the boonies. Perhaps I could mirror on xoom.com or something like
> that. I am rearranging my site bit that should make mirroring possible.
>
> TTYL,
> Adi
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

#! /bin/sh
#
# DOConfig  - script to configure Disk on Chip
#
#    Copies files from <pakages>.tar as listed in doc.conf
#    Actual files are specified in <package>.list
#
#    Created by Ralph Stickley rstickley@datalux.com
#    Many Features copied from init.d scripts
#
#    Built for ?Pee Wee Linux? created by Adi Linden
#
#
# Make sure we're really running bash.
#
[ -z "$BASH" ] && { echo "DOConfig requires bash" 1>&2; exit 1; }
#
#  constants for this shell script
#
VER=0.1
CFG_FILE=doc.conf
LST_FILE=files.lst
DOC_LOG=doc.log
[ -z "$COLUMNS" ] && COLUMNS=80
RES_COL=40
MOVE_TO_COL="echo -en \\033[${RES_COL}G"
#
#  constants for system directory structure
#
PKG_DIR=packages
DOC=./mnt
DOC_DEV=/dev/fla1
#
#
#
# Function: Usage
#
DOCUsage() {

   echo ""
   echo -e "doc \t\t Disk On Chip shell utility - V"$VER""
   echo ""
   echo "Usage: doc  -[E f s] mnt"
   echo "   -E   Erase disk on chip at $DOC"
   echo "   -f   create files from file $CFG_FILE"
   echo "   -s   store snapshot of files in $LST_FILE"
   echo "   mnt  mount point for Disk On Chip filesystem"
   echo ""
}
#
# Function: DOCMounted  (ExitOnError)
#
DOCMounted() {
   #
   # check if device is mounted (maybe someplace else)
   #
   if ! grep -iq "$DOC_DEV" /proc/mounts ;  then
      echo Device $DOC_DEV not mounted
      if [ ! $# = "" ]; then
         exit 0
      else
         return 0
      fi
   fi
   #
   # verify $DOC is mounted at $DOC_DEV
   #
   mntpt=`basename $DOC`
   if ! grep -i $mntpt /proc/mounts | grep -iq "$DOC_DEV"  ; then
      echo Disk-On-Chip not mounted at $DOC
      if [ ! $# = "" ]; then
         exit 0
      else
         return 0
      fi
   fi
   # valid mount, return true
   return 1
}

#
# function: DOCList
#
DOCList() {
#
   loc=$PWD
   echo -n Creating file: $loc/$LST_FILE
   cd $DOC
   #
   # use du to list - there may be a better way
   #
   du . -a | cut -f2 | sort -u > $loc/$LST_FILE
   #
   cd $loc
   #
   echo ...done
}

#
# function: DOCBackup filename
#
DOCBackup() {
   #
   #  backup to new backup file
   #
   if [ -f $1 ]; then
      bakn=1
      while [ -f "$1".$bakn ]; do
         bakn=`expr $bakn + 1`
      done
      cp  $1  "$1".$bakn
      echo Backing up $1 to "$1".$bakn
   fi
}

#
# function DOCExtract
#
DOCExtract() {

   echo -n Extracting files from:
   $MOVE_TO_COL
   echo as specified in:
   #
   loc=$PWD
   ln=1
   #
   for nfile_lst in `cat $CFG_FILE`; do
       #
       # each list file needs it's tar ball untarred at mount point
       #
       tar_file=`basename $nfile_lst list`"tar"
       tar_dir=`dirname $nfile_lst`
       #
       if [ ! -f "$tar_dir"/"$tar_file" ] ; then
          echo $CFG_FILE Error: $tar_file not found \(line  "$ln"\)
       else
          #
          #        nice printout of whats happening
          cd $DOC
          echo -n $tar_file
          $MOVE_TO_COL
          echo $nfile_lst
          #
          #  -T option seems to generate errors for empty directories
          #
          tar -xT "$loc"/"$nfile_lst" -f "$loc"/"$tar_dir"/"$tar_file"  >/dev/null
2>/dev/null
          cd $loc
       fi
       #
       ln=`expr $ln + 1`    # increment line counter
   done
}
#
# DOC main()
#
   #
   # At least one parameter required
   #
   if [ "$1" = "" ]; then
      DOCUsage
      exit 0
   fi
   #
   # command line parameter #2 - change DOC mount point
   #
   if [ ! "$2" = "" ]; then
      DOC=$2
   fi
   #
   # Verify DOC mount point exists or create it
   #
   if [ ! -d $DOC ]; then
        echo Creating Disk-On-Chip mount point at: $DOC
        mkdir $DOC
   else
      echo Disk On Chip File System at: $DOC
   fi
   case "$1" in
      #
      # Command:  Erase DOC
      #
      -E)
         echo Creating Filesystem on Disk-On-Chip \("$DOC_DEV"\) at $DOC
         #
         umount  $DOC_DEV       >  $DOC_LOG  2> $DOC_LOG
         #mke2fs $DOC_DEV       >> $DOC_LOG
         mount   $DOC_DEV $DOC  >> $DOC_LOG  2> $DOC_LOG
         #
         # verify mount
         #
         DOCMounted  ExitOnError
         #
         echo Formatted and Mounted Disk On Chip at $DOC
         #
         rm -r $DOC_LOG        # comment out to see results
         #
         ;;                    # end -E
      #
      # Command: Snapshot of Current FileSystem
      #
      -s)
         #
         # make sure we have something to take a picture of
         #
         if [ ! DOCMounted ]; then
            mount $DOC_DEV $DOC
         fi
         DOCMounted ExitOnError
         #
         # backup previous list
         #
         DOCBackup $LST_FILE
         #
         #  list files on device
         #
         DOCList
         ;;              # end -s
      #
      # Copy Files
      #
      -f)
         if [ ! -f $CFG_FILE ]; then
            #
            # Build configuration default - use all files
            #
            ls "$PKG_DIR"/*.list > $CFG_FILE
            echo File \"$CFG_FILE\" not found, creating default $CFG_FILE
         fi
         #
         DOCExtract
         #
         sync
         echo Done.
         ;;
      *)
         echo Invalid Parameter: $1
         DOCUsage
   #
   #
   esac     # end commandline processing
#
# end.
#



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
