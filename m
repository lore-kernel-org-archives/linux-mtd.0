Received: from [202.56.196.162] (helo=brahma.intotoind.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B6U4v-0001uX-7O
	for linux-mtd@lists.infradead.org; Thu, 25 Mar 2004 12:35:22 +0000
Message-Id: <5.1.0.14.0.20040325181511.01b26820@172.16.1.10>
Date: Thu, 25 Mar 2004 18:16:51 +0530
To: David Woodhouse <dwmw2@infradead.org>
From: "Rajesh B. V." <rajeshbv@intotoinc.com>
In-Reply-To: <1080211172.29835.40.camel@hades.cambridge.redhat.com>
References: <5.1.0.14.0.20040325161533.030dd948@172.16.1.10>
 <5.1.0.14.0.20040325143833.01b20e50@172.16.1.10>
 <5.1.0.14.0.20040325143833.01b20e50@172.16.1.10>
 <5.1.0.14.0.20040325161533.030dd948@172.16.1.10>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
cc: linux-mtd@lists.infradead.org
Subject: Re: Running out of space on MTD partition with JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

Pl. find the output of "df -h" after every copy and the file sizes also, 
copied below.

I tried to remove the files as you suggested
(see at the end of the capture where i did remove using "rm -f")

But still the "df -h" output shows the same free memory.


/****************************************************************
#
#
# df -h
Filesystem                Size      Used Available Use% Mounted on
/dev/ram0                 3.8M      1.5M      2.1M  41% /
/dev/mtdblock1           11.7M     11.7M         0 100% /mnt/cramfs
/dev/mtdblock2          768.0k    660.0k    108.0k  86% /mnt/jffs2
#
# ls -al /mnt/jffs2/igateway/config/
drwxr-xr-x    2 root     root            0 Jan  1 00:21 .
drwxr-xr-x    4 root     root            0 Jan  1 00:21 ..
-rwx------    1 root     root        30896 Jan  1 00:21 config.bkp
-rwx------    1 root     root        30896 Jan  1 00:21 config.dbm
-rwx------    1 root     root          797 Jan  1 00:21 vpn.bkp
-rwx------    1 root     root          797 Jan  1 00:21 vpn.dbm
# ldsv -s
Saving The Configuration. This may take some time.

Done.
#
# df -h
Filesystem                Size      Used Available Use% Mounted on
/dev/ram0                 3.8M      1.5M      2.1M  41% /
/dev/mtdblock1           11.7M     11.7M         0 100% /mnt/cramfs
/dev/mtdblock2          768.0k    672.0k     96.0k  88% /mnt/jffs2
#
# ls -al /mnt/jffs2/igateway/config/
drwxr-xr-x    2 root     root            0 Jan  1 00:21 .
drwxr-xr-x    4 root     root            0 Jan  1 00:21 ..
-rwx------    1 root     root        30896 Jan  1 00:21 config.bkp
-rwx------    1 root     root        30896 Jan  1 00:21 config.dbm
-rwx------    1 root     root          797 Jan  1 00:21 vpn.bkp
-rwx------    1 root     root          797 Jan  1 00:21 vpn.dbm
#
# ldsv -s
Saving The Configuration. This may take some time.

Done.
#
# df -h
Filesystem                Size      Used Available Use% Mounted on
/dev/ram0                 3.8M      1.5M      2.1M  41% /
/dev/mtdblock1           11.7M     11.7M         0 100% /mnt/cramfs
/dev/mtdblock2          768.0k    680.0k     88.0k  89% /mnt/jffs2
#
# ls -al /mnt/jffs2/igateway/config/
drwxr-xr-x    2 root     root            0 Jan  1 00:22 .
drwxr-xr-x    4 root     root            0 Jan  1 00:22 ..
-rwx------    1 root     root        30896 Jan  1 00:22 config.bkp
-rwx------    1 root     root        30896 Jan  1 00:22 config.dbm
-rwx------    1 root     root          797 Jan  1 00:22 vpn.bkp
-rwx------    1 root     root          797 Jan  1 00:22 vpn.dbm
#
# ldsv -s
Saving The Configuration. This may take some time.

Done.
#
#
# df -h
Filesystem                Size      Used Available Use% Mounted on
/dev/ram0                 3.8M      1.5M      2.1M  41% /
/dev/mtdblock1           11.7M     11.7M         0 100% /mnt/cramfs
/dev/mtdblock2          768.0k    692.0k     76.0k  90% /mnt/jffs2
#
# ls -al /mnt/jffs2/igateway/config/
drwxr-xr-x    2 root     root            0 Jan  1 00:22 .
drwxr-xr-x    4 root     root            0 Jan  1 00:22 ..
-rwx------    1 root     root        30896 Jan  1 00:22 config.bkp
-rwx------    1 root     root        30896 Jan  1 00:22 config.dbm
-rwx------    1 root     root          797 Jan  1 00:22 vpn.bkp
-rwx------    1 root     root          797 Jan  1 00:22 vpn.dbm
#
#
# ldsv -s
Saving The Configuration. This may take some time.

Done.
#
#
# df -h
Filesystem                Size      Used Available Use% Mounted on
/dev/ram0                 3.8M      1.5M      2.1M  41% /
/dev/mtdblock1           11.7M     11.7M         0 100% /mnt/cramfs
/dev/mtdblock2          768.0k    704.0k     64.0k  92% /mnt/jffs2
#
# ls -al /mnt/jffs2/igateway/config/
drwxr-xr-x    2 root     root            0 Jan  1 00:22 .
drwxr-xr-x    4 root     root            0 Jan  1 00:22 ..
-rwx------    1 root     root        30896 Jan  1 00:22 config.bkp
-rwx------    1 root     root        30896 Jan  1 00:22 config.dbm
-rwx------    1 root     root          797 Jan  1 00:22 vpn.bkp
-rwx------    1 root     root          797 Jan  1 00:22 vpn.dbm
#
#
# ldsv -s
Saving The Configuration. This may take some time.

Done.
#
#
# df -h
Filesystem                Size      Used Available Use% Mounted on
/dev/ram0                 3.8M      1.5M      2.1M  41% /
/dev/mtdblock1           11.7M     11.7M         0 100% /mnt/cramfs
/dev/mtdblock2          768.0k    716.0k     52.0k  93% /mnt/jffs2
#
# ls -al /mnt/jffs2/igateway/config/
drwxr-xr-x    2 root     root            0 Jan  1 00:22 .
drwxr-xr-x    4 root     root            0 Jan  1 00:22 ..
-rwx------    1 root     root        30896 Jan  1 00:22 config.bkp
-rwx------    1 root     root        30896 Jan  1 00:22 config.dbm
-rwx------    1 root     root          797 Jan  1 00:22 vpn.bkp
-rwx------    1 root     root          797 Jan  1 00:22 vpn.dbm
#
#
# cd /mnt/jffs2/igateway/config/
# ls -al
drwxr-xr-x    2 root     root            0 Jan  1 00:22 .
drwxr-xr-x    4 root     root            0 Jan  1 00:22 ..
-rwx------    1 root     root        30896 Jan  1 00:22 config.bkp
-rwx------    1 root     root        30896 Jan  1 00:22 config.dbm
-rwx------    1 root     root          797 Jan  1 00:22 vpn.bkp
-rwx------    1 root     root          797 Jan  1 00:22 vpn.dbm
#
#
# rm -f *
#
#
# ls -al
drwxr-xr-x    2 root     root            0 Jan  1 00:22 .
drwxr-xr-x    4 root     root            0 Jan  1 00:22 ..
#
# df -h
Filesystem                Size      Used Available Use% Mounted on
/dev/ram0                 3.8M      1.5M      2.1M  41% /
/dev/mtdblock1           11.7M     11.7M         0 100% /mnt/cramfs
/dev/mtdblock2          768.0k    716.0k     52.0k  93% /mnt/jffs2
#
#
#
# ls -al
drwxr-xr-x    2 root     root            0 Jan  1 00:22 .
drwxr-xr-x    4 root     root            0 Jan  1 00:22 ..
#
# ldsv -s
Saving The Configuration. This may take some time.

Done.
#
# df -h
Filesystem                Size      Used Available Use% Mounted on
/dev/ram0                 3.8M      1.5M      2.1M  41% /
/dev/mtdblock1           11.7M     11.7M         0 100% /mnt/cramfs
/dev/mtdblock2          768.0k    728.0k     40.0k  95% /mnt/jffs2
# ls -al
# ls -al /mnt/jffs2/igateway/config/
drwxr-xr-x    2 root     root            0 Jan  1 00:24 .
drwxr-xr-x    4 root     root            0 Jan  1 00:24 ..
-rwx------    1 root     root        30896 Jan  1 00:24 config.bkp
-rwx------    1 root     root        30896 Jan  1 00:24 config.dbm
-rwx------    1 root     root          797 Jan  1 00:24 vpn.bkp
-rwx------    1 root     root          797 Jan  1 00:24 vpn.dbm
#
#
*************************************************************************/

Regards,
--Rajesh
At 10:39 AM 3/25/2004 +0000, David Woodhouse wrote:
>On Thu, 2004-03-25 at 16:18 +0530, Rajesh B. V. wrote:
> > Hi David,
> >
> > Thanks for the response.
> >
> > >Are you removing the old files first, or writing the new files with
> > >different names and then renaming them to the same name as the original
> > >files? Or are you opening the original files with O_TRUNC?
> >
> > I am overwriting the old files with new files ( with same name directly )
> > using simple 'cp'
> > # cp -f /config  /mnt/jffs2  ( where /mnt/jffs2 is mounted through
> > /dev/mtdblock4 ).
> >
> > >Are there any processes running which still have the old file open?
> >
> > There are no other processes using these files once copy is done. Only
> > during bootup and during taking backup only these files will be accessed.
>
>Ok. How big is the partition, how big is the config file and what else
>is on the partition? Can you show me the output of 'df' when you start,
>and when you do this a few times? If you remove the old file first, what
>does 'df' say then, before you write the new one?
>
>--
>dwmw2
>
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
