Received: from [202.56.196.162] (helo=brahma.intotoind.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B6SEa-0001I1-DQ
	for linux-mtd@lists.infradead.org; Thu, 25 Mar 2004 10:37:13 +0000
Message-Id: <5.1.0.14.0.20040325161533.030dd948@172.16.1.10>
Date: Thu, 25 Mar 2004 16:18:42 +0530
To: David Woodhouse <dwmw2@infradead.org>
From: "Rajesh B. V." <rajeshbv@intotoinc.com>
In-Reply-To: <1080205651.29835.1.camel@hades.cambridge.redhat.com>
References: <5.1.0.14.0.20040325143833.01b20e50@172.16.1.10>
 <5.1.0.14.0.20040325143833.01b20e50@172.16.1.10>
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

Thanks for the response.

>Are you removing the old files first, or writing the new files with
>different names and then renaming them to the same name as the original
>files? Or are you opening the original files with O_TRUNC?

I am overwriting the old files with new files ( with same name directly ) 
using simple 'cp'
# cp -f /config  /mnt/jffs2  ( where /mnt/jffs2 is mounted through 
/dev/mtdblock4 ).

>Are there any processes running which still have the old file open?

There are no other processes using these files once copy is done. Only 
during bootup and during taking backup only these files will be accessed.

Regards,
--Rajesh

At 09:07 AM 3/25/2004 +0000, David Woodhouse wrote:
>On Thu, 2004-03-25 at 14:45 +0530, Rajesh B. V. wrote:
> > Hi All,
> >
> > I mounted JFFS2 file system through device 'mtdblock4' on my ARM target.
> > I need to update some files ( kind of configuration files ) 
> periodically in
> > the JFFS2 partition.
> > For this i create the files in RAM and just copy the files from RAM to
> > JFFS2, overwriting the previous files.
>
>Are you removing the old files first, or writing the new files with
>different names and then renaming them to the same name as the original
>files? Or are you opening the original files with O_TRUNC?
>
>Are there any processes running which still have the old file open?
>
>--
>dwmw2
>
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
